import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

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
  }
}

class DependencySetup {
  const DependencySetup._();

  static const DependencySetup _singleton = DependencySetup._();

  factory DependencySetup() => _singleton;

  /// includes the list of repositories and blocs to be injected into the context.
  Widget setUp(Widget child) {
    return _listOfRepoProviders(
      _listOfBlocProviders(
        child,
      ),
    );
  }
}
