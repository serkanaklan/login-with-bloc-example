import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'smtp_event.dart';
part 'smtp_state.dart';

class SmtpBloc extends Bloc<SmtpEvent, SmtpState> {
  var SuccesMsg = "";
  SmtpBloc() : super(SmtpInitial(AddSmtpEvent)) {
    on<SmtpEvent>((event, emit) {
      // TODO: implement event handler
      emit(SmtpInitialized(SuccesMsg));
    });
  }
}
