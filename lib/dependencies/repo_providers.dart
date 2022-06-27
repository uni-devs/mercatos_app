part of 'dependencies.dart';

MultiRepositoryProvider _listOfRepoProviders(Widget child) {
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider<LoginRepo>(
        create: (_) => LoginRepo(),
      )
    ],
    child: child,
  );
}
