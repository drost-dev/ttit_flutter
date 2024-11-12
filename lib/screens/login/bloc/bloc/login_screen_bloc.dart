import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repos/supabase_repo/supabase_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(LoginScreenLoading()) {
    on<LoginScreenEvent>((event, emit) async {
      switch (event) {
        case LoginScreenLoad():
          emit(LoginScreenLoaded());
          break;
        case LoginScreenLogin():
          SupabaseRepo sbRepo = GetIt.I<SupabaseRepo>();
          try {
            await sbRepo.signIn(event.email, event.password);
            emit(LoginScreenCompleted());
          } catch (e) {
            emit(LoginScreenError(e: e));
          }
      }
    });
  }
}
