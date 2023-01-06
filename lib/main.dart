import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_app/bloc/payment/payment_bloc.dart';
import 'package:stripe_app/pages/home_page.dart';
import 'package:stripe_app/pages/successful_payment_card.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PaymentBloc>(create: (_) => PaymentBloc())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stripe App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomePage(),
        'success_payment': (_) => const SuccessfulPaymentPage()
      },
      theme: ThemeData.light().copyWith( 
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700),
              iconTheme: IconThemeData(color: Colors.black))),
    );
  }
}
