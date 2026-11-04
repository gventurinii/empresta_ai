import 'package:empresta_ai_app/theme/tema.dart';
import 'package:empresta_ai_app/view/login_view.dart';
import 'package:flutter/material.dart';

class EmprestaAiApp extends StatelessWidget{
  const EmprestaAiApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Empresta Ai",
      debugShowCheckedModeBanner: false,
      theme: TemaEmprestaAi.claro(),
      darkTheme: TemaEmprestaAi.escuro(),
      home: LoginView()
    );
  }
  
}