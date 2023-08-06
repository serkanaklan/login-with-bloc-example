import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  var success_message = "";
  PasswordBloc() : super(PasswordInitial()) {
    on<PasswordEvent>((event, emit) {
      // TODO: implement event handler
      emit(PasswordInitialized(success_message));
    });
  }
}
