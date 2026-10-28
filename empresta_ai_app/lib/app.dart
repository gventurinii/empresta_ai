import 'package:empresta_ai_app/theme/tema.dart';
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
      home: Scaffold(
        body: Center(
          child: FilledButton(
            onPressed: (){}, // função vazia
            child: Text("Botão padrão do EmprestaAi")
          )
        ),
      ),
    );
  }

}