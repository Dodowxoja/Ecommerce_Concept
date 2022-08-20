part of 'splash_screen_cubit.dart';

abstract class SplashScreenState {}

class SplashScreenInitial extends SplashScreenState {}

class SplashScreenLoading extends SplashScreenState {}

class SplashScreenComplete extends SplashScreenState {
  SplashScreenComplete();
}

class SplashScreenError extends SplashScreenState {}
