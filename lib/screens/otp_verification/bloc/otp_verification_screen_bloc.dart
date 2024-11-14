import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repos/supabase_repo/supabase_repo.dart';
import 'package:get_it/get_it.dart';

part 'otp_verification_screen_event.dart';
part 'otp_verification_screen_state.dart';

class OtpVerificationScreenBloc extends Bloc<OtpVerificationScreenEvent, OtpVerificationScreenState> {
  OtpVerificationScreenBloc() : super(OtpVerificationScreenLoading()) {
    on<OtpVerificationScreenEvent>((event, emit) {
      switch (event) {
        case OtpVerificationScreenLoad():
          emit(OtpVerificationScreenLoading());
          emit(OtpVerificationScreenLoaded());
          break;
        case OtpVerificationScreenSignIn():
          var sbRepo = GetIt.I.get<SupabaseRepo>();
          try {
            sbRepo.verifyOtp(event.email, event.otpCode);
            emit(OtpVerificationScreenSuccess());
          } catch (e) {
            emit(OtpVerificationScreenError(e: e));
          }
          break;
      }
    });
  }
}
