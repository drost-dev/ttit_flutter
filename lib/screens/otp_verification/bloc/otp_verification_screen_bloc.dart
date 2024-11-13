import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'otp_verification_screen_event.dart';
part 'otp_verification_screen_state.dart';

class OtpVerificationScreenBloc extends Bloc<OtpVerificationScreenEvent, OtpVerificationScreenState> {
  OtpVerificationScreenBloc() : super(OtpVerificationScreenLoading()) {
    on<OtpVerificationScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
