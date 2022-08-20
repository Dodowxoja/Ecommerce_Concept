part of '../cubit/my_cart_cubit.dart';

abstract class MyHomeState {}

class MyHomeInitial extends MyHomeState {}

class MyCartLoading extends MyHomeState {}

class MyCartComplete extends MyHomeState {
  MyCartComplete();
}

class MyCartError extends MyHomeState {}
