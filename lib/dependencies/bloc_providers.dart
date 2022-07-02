part of 'dependencies.dart';

MultiBlocProvider _listOfBlocProviders(Widget child) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
      ),
      BlocProvider<ScrollingCubit>(
        create: (context) => ScrollingCubit(),
      ),
    ],
    child: child,
  );
}
