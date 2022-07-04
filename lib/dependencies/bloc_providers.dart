part of 'dependencies.dart';

MultiBlocProvider _listOfBlocProviders(Widget child) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
      ),
      BlocProvider<RegistrationBloc>(
        create: (context) => RegistrationBloc(
          basicInformationCubit: BasicInformationCubit(),
          setPasswordCubit: SetPasswordCubit(),
          userTypeCubit: UserTypeCubit(),
          sportInformationCubit: SportInformationCubit(),
          reportInformationCubit: ReportInformationCubit(),
        ),
      ),
      BlocProvider<ScrollingCubit>(
        create: (context) => ScrollingCubit(),
      ),
    ],
    child: child,
  );
}
