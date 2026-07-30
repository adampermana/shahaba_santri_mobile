import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_bloc.dart';
import 'package:sahaba_mobile/business_logic/news_bloc/news_bloc.dart';
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
          create: (context) =>
              sl<AuthBloc>()..add(const AuthEvent.getLocalUser()),
        ),
        BlocProvider(
          create: (_) => sl<ProductBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<NewsBloc>(),
        ),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            (previous.authDataHive == null && current.authDataHive != null) ||
            (!previous.successLoginGuest && current.successLoginGuest),
        listener: (context, state) {
          context.read<ProductBloc>().add(const ProductEvent.started());
          context.read<NewsBloc>().add(const NewsEvent.fetchNewsList());
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
