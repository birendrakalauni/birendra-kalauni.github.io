import 'package:birendra_portfolio/core/routing/app_router.dart';
import 'package:flutter/material.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Birendra Kalauni | Flutter Developer',
    debugShowCheckedModeBanner: false,
    routerConfig: appRouter,
    );
  }
}