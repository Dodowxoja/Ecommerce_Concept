part of '../cubit/cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartComplete extends CartState {
  int count = 0;
  CartComplete(count);
}

class CartError extends CartState {}
