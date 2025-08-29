part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const COUNTER = _Paths.COUNTER;
  static const FORM_PENDAFTARAN = _Paths.FORM_PENDAFTARAN;
  static const POST = _Paths.POST;
  static const CREATE_POST = _Paths.CREATE_POST;
  static const EDIT_POST = _Paths.EDIT_POST;
  static const ALQURAN = _Paths.ALQURAN;
  static const AUTH = _Paths.AUTH;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const PROFILE = _Paths.PROFILE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const COUNTER = '/counter';
  static const FORM_PENDAFTARAN = '/form-pendaftaran';
  static const POST = '/post';
  static const EDIT_POST = '/post/edit';
  static const CREATE_POST = '/post/create';
  static const ALQURAN = '/alquran';
  static const AUTH = '/auth';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const PROFILE = '/profile';
}
