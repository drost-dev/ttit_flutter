import 'package:flutter/material.dart';
import 'package:flutter_application_1/repos/supabase_repo/supabase_repo.dart';
import 'package:flutter_application_1/router/router.dart';
import 'package:flutter_application_1/themes/default.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  usePathUrlStrategy();
  SupabaseRepo supabaseRepo = await SupabaseRepo.init();
  GetIt.I.registerSingleton<SupabaseRepo>(supabaseRepo);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    final _router = $AppRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: defaultTheme,
      routerConfig: _router.config(),
    );
  }
}