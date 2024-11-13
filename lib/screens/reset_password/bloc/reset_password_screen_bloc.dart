import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repos/supabase_repo/supabase_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'reset_password_screen_event.dart';
part 'reset_password_screen_state.dart';

class ResetPasswordScreenBloc
    extends Bloc<ResetPasswordScreenEvent, ResetPasswordScreenState> {
  ResetPasswordScreenBloc() : super(ResetPasswordScreenLoading()) {
    on<ResetPasswordScreenEvent>((event, emit) {
      switch (event) {
        case ResetPasswordScreenLoad():
          emit(ResetPasswordScreenLoaded());
          break;
        case ResetPasswordScreenSendCode():
          SupabaseRepo sbRepo = GetIt.I.get<SupabaseRepo>();
          try {
            sbRepo.signInOtp(event.email);
          } catch (e) {
            emit(ResetPasswordScreenError(e));
          }
          emit(ResetPasswordScreenCompleted(email: event.email));
          break;
      }
    });
  }
}
