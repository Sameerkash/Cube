import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingLoading());

}

abstract class OnboardingState {}

class OnboardingLoading extends OnboardingState {}

class OnboardingAPILoading extends OnboardingState {}

class OnboardingLoaded extends OnboardingState {}

class OnboardingReset extends OnboardingState {}

class Onboarded extends OnboardingState {}
