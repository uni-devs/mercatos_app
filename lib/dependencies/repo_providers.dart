part of 'dependencies.dart';

MultiRepositoryProvider _listOfRepoProviders(Widget child) {
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider<LoginRepo>(
        create: (_) => LoginRepo(),
      ),
      RepositoryProvider<VideoPlayerRepo>(
        create: (context) => VideoPlayerRepo(DefaultCacheManager()),
      ),
    ],
    child: child,
  );
}
