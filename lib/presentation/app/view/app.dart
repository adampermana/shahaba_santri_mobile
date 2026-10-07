import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_account_bloc/auth_account_bloc.dart';
import 'package:sahaba_mobile/business_logic/core_cubit/core_cubit.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/l10n/l10n.dart';
import 'package:sahaba_mobile/presentation/routers/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthAccountBloc>(
          lazy: false,
          create: (_) =>
              sl<AuthAccountBloc>()
                ..add(const AuthAccountEvent.checkAuthStatus()),
        ),
        BlocProvider<CoreCubit>(
          lazy: false,
          create: (context) => sl<CoreCubit>()..fetchOnBoarding(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => child!,
      ),
    );
  }
}
