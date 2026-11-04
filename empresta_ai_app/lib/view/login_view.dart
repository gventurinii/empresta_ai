import 'package:empresta_ai_app/theme/tema.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;
    final textos = Theme.of(context).textTheme;

   return SafeArea(
    //Evita que o teclado cubra os campos
    child: Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(TemaEmprestaAi.espacoG),
        child: Form( 
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.volunteer_activism, size: 72, color: cores.primary),
              SizedBox(height: TemaEmprestaAi.espacoM),
              Text("Empresta Aí",
                textAlign: TextAlign.center,
                style: textos.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: cores.primary
                ),
              ),
              SizedBox(height: TemaEmprestaAi.espacoP),
              Text("Peça emprestado aos seus vizinhos de condomínio",
                textAlign: TextAlign.center,
                style: textos.bodyLarge,
              )
            ],
          )),
      ),
    ));
  }

}