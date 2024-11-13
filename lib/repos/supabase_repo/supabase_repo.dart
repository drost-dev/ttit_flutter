import 'package:flutter_application_1/repos/abstract_database_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRepo implements AbstractDatabaseRepo {
  SupabaseRepo._init(this._sb);

  static Future<SupabaseRepo> init() async {
    await Supabase.initialize(
      url: 'https://agihcsovydxctcrmhxsu.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFnaWhjc292eWR4Y3Rjcm1oeHN1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzEwMzk0OTAsImV4cCI6MjA0NjYxNTQ5MH0.GtMELO_g0XunjFxULkuTuExskl5IEoUhzvXZdjvmSmw',
      // url: 'https://iupoqaijpivcfhjvlbzj.supabase.co',
      // anonKey:
      //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml1cG9xYWlqcGl2Y2ZoanZsYnpqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzEwODUxNTUsImV4cCI6MjA0NjY2MTE1NX0.EbRGPVuIjLl5OiK1c0SwPX4b4O8Z5e4JqPblAgoGus4',
    );
    SupabaseClient sb = Supabase.instance.client;
    SupabaseRepo sbRepo = SupabaseRepo._init(sb);
    return sbRepo;
  }

  final SupabaseClient _sb;

  @override
  Future<void> signUp(String name, String email, String password) async {
    await _sb.auth.signUp(
      data: {
        'name': name,
      },
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signIn(String email, String password) async {
    print('tut1');
    var a = await _sb.auth.signInWithPassword(
      email: email,
      password: password,
    );
    print('tut2');
    print(a.user?.userMetadata?['name']);
  }

  @override
  Future<void> trySignOut() async {
    await _sb.auth.signOut();
  }

  @override
  Future<void> signInOtp(String email) async {
    await _sb.auth.signInWithOtp(email: email);
  }

  @override
  Future<void> verifyOtp(String email, String otpCode) async {
    await _sb.auth.verifyOTP(
      type: OtpType.email,
      email: email,
      token: otpCode,
    );
  }

  void info() {
    print(_sb.accessToken);
    print(_sb.auth.currentUser?.userMetadata?['name']);
  }
}
