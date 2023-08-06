part of 'smtp_bloc.dart';

@immutable
abstract class SmtpEvent {
  const SmtpEvent();
  @override
  List<Object> get props => [];
}

class AddSmtpEvent extends SmtpEvent {
  const AddSmtpEvent();
  @override
  List<Object> get props => [];
}
