import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_bloc.dart';
import 'package:sahaba_mobile/business_logic/product_bloc/product_bloc.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/l10n/l10n.dart';
import 'package:sahaba_mobile/presentation/routers/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<ProductBloc>()..add(const ProductEvent.started()),
        ),
        BlocProvider(
          create: (context) =>
              sl<AuthBloc>()..add(const AuthEvent.getLocalUser()),
        ),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            !previous.successLoginGuest && current.successLoginGuest,
        listener: (context, state) {
          context.read<ProductBloc>().add(const ProductEvent.started());
        },
        child: MaterialApp.router(
          routerConfig: router,
          // theme: AppTheme.lightTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) => child!,
        ),
      ),
    );
  }
}
