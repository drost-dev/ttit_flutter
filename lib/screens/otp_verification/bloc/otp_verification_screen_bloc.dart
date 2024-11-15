import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repos/supabase_repo/supabase_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'otp_verification_screen_event.dart';
part 'otp_verification_screen_state.dart';

class OtpVerificationScreenBloc
    extends Bloc<OtpVerificationScreenEvent, OtpVerificationScreenState> {
  OtpVerificationScreenBloc() : super(OtpVerificationScreenLoading()) {
    on<OtpVerificationScreenEvent>(
      (event, emit) async {
        switch (event) {
          case OtpVerificationScreenLoad():
            emit(OtpVerificationScreenLoading());
            emit(OtpVerificationScreenLoaded());
            break;

          case OtpVerificationScreenSignIn():
            var sbRepo = GetIt.I.get<SupabaseRepo>();
            try {
              await sbRepo.verifyOtp(event.email, event.otpCode);
              emit(OtpVerificationScreenSuccess());
            } catch (e) {
              switch (e) {
                case AuthApiException e:
                  emit(OtpVerificationScreenError(e: e.message));
                  break;
                case AuthException e:
                  emit(OtpVerificationScreenError(e: e.message));
                  break;
                default:
                  emit(OtpVerificationScreenError(e: e));
              }
              emit(OtpVerificationScreenLoaded());
            }
            break;
            
          case OtpVerificationScreenResend():
            var sbRepo = GetIt.I.get<SupabaseRepo>();
            try {
              await sbRepo.signInOtp(event.email);
            } catch (e) {
              switch (e) {
                case AuthException e:
                  emit(OtpVerificationScreenError(e: e.message));
                  break;
                default:
                  emit(OtpVerificationScreenError(e: e));
                  break;
              }
            }
            break;
        }
      },
    );
  }
}
