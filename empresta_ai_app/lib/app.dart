import 'package:empresta_ai_app/controllers/itens_controller.dart';
import 'package:empresta_ai_app/controllers/sessao_controller.dart';
import 'package:empresta_ai_app/theme/tema.dart';
import 'package:empresta_ai_app/view/login_view.dart';
import 'package:flutter/material.dart';

class EmprestaAiApp extends StatefulWidget{
  const EmprestaAiApp({super.key});

  @override
  State<EmprestaAiApp> createState() => _EmprestaAiAppState();
}

final _sessaoController = SessaoController();
final _itensController = ItensController();

class _EmprestaAiAppState extends State<EmprestaAiApp> {
  @override
  void dispose() {
    _sessaoController.dispose();
    _itensController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Empresta Ai",
      debugShowCheckedModeBanner: false,
      theme: TemaEmprestaAi.claro(),
      darkTheme: TemaEmprestaAi.escuro(),
      home: LoginView(sessao: _sessaoController, itens: _itensController,),
    );
  }
}