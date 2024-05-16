import 'package:calendario_orcamento/components/routes.dart';
import 'package:calendario_orcamento/providers/barra_tarefas.dart';
import 'package:calendario_orcamento/providers/provider_login.dart';
import 'package:calendario_orcamento/screens/login/login.dart';
import 'package:calendario_orcamento/screens/login/login_inicial.dart';
import 'package:calendario_orcamento/screens/orcamento/orcamento.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'screens/calendario/agenda.dart';
import 'screens/login/cadastro_usuario.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  initializeDateFormatting().then(
    (_) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<providerLogin>(create: (_) => providerLogin()),
          ChangeNotifierProvider<ProviderTarefas>(
              create: (_) => ProviderTarefas())
        ],
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            Routes().home: (context) => const LoginInicial(),
            Routes().login: (context) => const Login(),
            Routes().cadastro: (context) => const CadastroUsuario(),
            Routes().agenda: (context) => const Agenda(),
            Routes().orcamento: (context) => const Orcamento(),
          },
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: '/',
    );
  }
}
