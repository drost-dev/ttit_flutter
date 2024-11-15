import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repos/supabase_repo/supabase_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'reset_password_screen_event.dart';
part 'reset_password_screen_state.dart';

class ResetPasswordScreenBloc
    extends Bloc<ResetPasswordScreenEvent, ResetPasswordScreenState> {
  ResetPasswordScreenBloc() : super(ResetPasswordScreenLoading()) {
    on<ResetPasswordScreenEvent>((event, emit) async {
      switch (event) {
        case ResetPasswordScreenLoad():
          emit(ResetPasswordScreenLoaded());
          break;
        case ResetPasswordScreenSendCode():
          SupabaseRepo sbRepo = GetIt.I.get<SupabaseRepo>();
          try {
            await sbRepo.signInOtp(event.email);
            emit(ResetPasswordScreenCompleted(email: event.email));
          } catch (e) {
            switch (e) {
              case AuthException():
                emit(ResetPasswordScreenError(e.message));
                break;
              default:
                emit(ResetPasswordScreenError(e));
                break;
            }
          }
          emit(ResetPasswordScreenLoaded());
          break;
      }
    });
  }
}
