part of 'smtp_bloc.dart';

@immutable
abstract class SmtpState {}

class SmtpInitial extends SmtpState {
  final SuccesMsg;
  SmtpInitial(this.SuccesMsg);
  @override
  List<Object> get props => [];
}

class SmtpInitialized extends SmtpState {
  final SuccesMsg;
  SmtpInitialized(this.SuccesMsg);
  @override
  List<Object> get props => [];
}

class SmtpError extends SmtpState {
  final errorMsg;
  SmtpError(this.errorMsg);
  @override
  List<Object> get props => [];
}
