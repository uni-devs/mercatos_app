import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mercatos/components/network/mercatos_network.dart';
import 'package:mercatos/features/auth/features/login/logic/login_form_bloc/login_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '../features/auth/features/login/data/repositories/login_repository.dart';
import '../features/auth/features/login/data/repositories/video_player_repository.dart';
import '../features/auth/features/login/logic/scrolling_cubit/scrolling_cubit.dart';

part 'bloc_providers.dart';
part 'repo_providers.dart';

/// Initialize dependencies for the project and inject them into context.

class DependencyInjection {
  const DependencyInjection._();

  static const DependencyInjection _singleton = DependencyInjection._();

  factory DependencyInjection() => _singleton;

  /// includes the initial setups for the project.
  Future<void> registerSingleton(
    Widget app,
  ) async {
    /// Register the [app] as a singleton.
    WidgetsFlutterBinding.ensureInitialized();

    ///////////////////////////////////////////////////////////////////////////

    /// for [HydratedBloc]
    final storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory(),
    );

    HydratedBlocOverrides.runZoned(
      () => runApp(app),
      storage: storage,
    );

    ///////////////////////////////////////////////////////////////////////////

    /// set language for the app.
    MercatosNetwork().setLanguage("en");
  }
}

class DependencySetup {
  const DependencySetup._();

  static const DependencySetup _singleton = DependencySetup._();

  factory DependencySetup() => _singleton;

  /// includes the list of repositories and blocs to be injected into the context.
  Widget setUp(MaterialApp materialApp) {
    return _listOfRepoProviders(
      _listOfBlocProviders(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, _) => materialApp,
        ),
      ),
    );
  }
}
