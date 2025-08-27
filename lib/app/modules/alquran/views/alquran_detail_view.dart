import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rpl1getx/app/data/Models/alquran.dart';

class AlquranDetailView extends StatefulWidget {
  final Alquran alquran;
  const AlquranDetailView({super.key, required this.alquran});

  @override
  State<AlquranDetailView> createState() => _AlquranDetailViewState();
}

class _AlquranDetailViewState extends State<AlquranDetailView> {
  late AudioPlayer _player;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  Future<void> _playAudio() async {
    final url = (widget.alquran.audio == null || widget.alquran.audio!.isEmpty)
        ? 'https://download.quranicaudio.com/qdc/mishari_al_afasy/murattal/1.mp3'
        : widget.alquran.audio!;

    try {
      await _player.setUrl(url);
      _player.play();
      setState(() => isPlaying = true);

      _player.playerStateStream.listen((state) {
        if (state.playing == false) {
          setState(() => isPlaying = false);
        }
      });
    } catch (e) {
      Get.snackbar('Error', 'Gagal memutar audio: $e');
    }
  }

  Future<void> _stopAudio() async {
    await _player.stop();
    setState(() => isPlaying = false);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  String _typeText() {
    final t = widget.alquran.type;
    if (t == null) return '-';
    return t.toString().split('.').last.toLowerCase() == 'mekah'
        ? 'Mekah'
        : 'Madinah';
  }

  Widget _chip(String label, String value, {IconData? icon}) {
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16),
            const SizedBox(width: 6),
          ],
          Text('$label: $value'),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Widget _sectionTitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nama = widget.alquran.nama ?? '-';
    final asma = widget.alquran.asma ?? '';
    final arti = widget.alquran.arti ?? '-';
    final ayat = widget.alquran.ayat?.toString() ?? '-';
    final nomor = widget.alquran.nomor ?? '-';
    final urut = widget.alquran.urut ?? '-';
    final rukuk = widget.alquran.rukuk ?? '-';
    final ket = (widget.alquran.keterangan == null ||
            widget.alquran.keterangan!.trim().isEmpty)
        ? '-'
        : widget.alquran.keterangan!.trim();

    return Scaffold(
      appBar: AppBar(
        title: Text(nama),
        actions: [
          IconButton(
            tooltip: isPlaying ? 'Stop Audio' : 'Putar Audio',
            onPressed: isPlaying ? _stopAudio : _playAudio,
            icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (asma.isNotEmpty)
              Text(
                asma,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      height: 1.6,
                      fontWeight: FontWeight.w600,
                    ),
              ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _chip('Asal', _typeText(), icon: Icons.place),
                _chip('Ayat', ayat, icon: Icons.format_list_numbered),
                _chip('Nomor', nomor, icon: Icons.confirmation_number),
                _chip('Urut', urut, icon: Icons.sort),
                _chip('Rukuk', rukuk, icon: Icons.bookmark_outline),
              ],
            ),

            _sectionTitle(context, 'Arti'),
            SelectableText(arti),

            _sectionTitle(context, 'Keterangan'),
            SelectableText(ket, textAlign: TextAlign.justify),

            _sectionTitle(context, 'Audio'),
            ElevatedButton.icon(
              onPressed: isPlaying ? _stopAudio : _playAudio,
              icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
              label: Text(isPlaying ? 'Stop Audio' : 'Putar Audio'),
            ),
            Text(
              (widget.alquran.audio == null || widget.alquran.audio!.isEmpty)
                  ? 'Default audio digunakan'
                  : widget.alquran.audio!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
