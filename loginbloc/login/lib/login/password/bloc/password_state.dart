part of 'password_bloc.dart';

abstract class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

class PasswordInitial extends PasswordState {}

class PasswordInitialized extends PasswordState {
  final Success_message;
  PasswordInitialized(this.Success_message);
  @override
  List<Object> get props => [];
}

class PasswordError extends PasswordState {}
