import 'package:flutter_bloc/flutter_bloc.dart';
part '../state/splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenInitial());
}
