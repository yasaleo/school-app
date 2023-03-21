part of 'navigation_cubit.dart';

@immutable
abstract class NavigationState {}

class NavigationInitial extends NavigationState {
  final Widget initialScreen;

  NavigationInitial({required this.initialScreen});
}

class NavigatedScreens extends NavigationState {
  final Widget screen;

  NavigatedScreens({required this.screen});
}

class NavigationLoading extends NavigationState {
  NavigationLoading();
}
