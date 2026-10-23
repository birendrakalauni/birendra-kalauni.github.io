import 'package:birendra_portfolio/core/routing/app_router.dart';
import 'package:birendra_portfolio/core/theme/app_theme.dart';
import 'package:birendra_portfolio/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp.router(
            title: 'Birendra Kalauni | Flutter Developer',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.dark,
            themeMode: themeProvider.themeMode,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
