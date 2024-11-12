import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repos/supabase_repo/supabase_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'sign_up_screen_event.dart';
part 'sign_up_screen_state.dart';

class SignUpScreenBloc extends Bloc<SignUpScreenEvent, SignUpScreenState> {
  SignUpScreenBloc() : super(SignUpScreenLoading()) {
    on<SignUpScreenEvent>((event, emit) async {
      switch (event) {
        case SignUpScreenLoad():
          emit(SignUpScreenLoaded());
          break;
        case SignUpScreenRegister():
          var sbRepo = GetIt.I<SupabaseRepo>();
          try {
            await sbRepo.signUp(
              event.name,
              event.email,
              event.password,
            );
            emit(SignUpScreenCompleted());
          } catch (e) {
            emit(SignUpScreenError(e));
          }
          break;
      }
    });
  }
}
