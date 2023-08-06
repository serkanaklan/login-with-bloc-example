part of 'password_bloc.dart';

abstract class PasswordEvent extends Equatable {
  const PasswordEvent();

  @override
  List<Object> get props => [];
}

class AddPasswordEvent extends PasswordEvent {
  const AddPasswordEvent();
  @override
  List<Object> get props => [];
}
