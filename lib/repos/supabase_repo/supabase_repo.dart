import 'package:flutter_application_1/repos/abstract_database_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRepo implements AbstractDatabaseRepo {
  SupabaseRepo._init(this.sb);

  static Future<SupabaseRepo> init() async {
    await Supabase.initialize(
      url: 'https://agihcsovydxctcrmhxsu.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFnaWhjc292eWR4Y3Rjcm1oeHN1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzEwMzk0OTAsImV4cCI6MjA0NjYxNTQ5MH0.GtMELO_g0XunjFxULkuTuExskl5IEoUhzvXZdjvmSmw',
    );
    SupabaseClient sb = Supabase.instance.client;
    SupabaseRepo sbRepo = SupabaseRepo._init(sb);
    return sbRepo;
  }

  late SupabaseClient sb;

  @override
  void signUp(String name, String email, String password) async {
    var resp = await sb.auth.signUp(
      data: {
        'name': name,
      },
      email: email,
      password: password,
    );

    print(resp.session!.accessToken);
  }
}
