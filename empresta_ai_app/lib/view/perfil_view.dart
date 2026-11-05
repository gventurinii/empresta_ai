import 'package:empresta_ai_app/controllers/sessao_controller.dart';
import 'package:empresta_ai_app/theme/tema.dart';
import 'package:flutter/material.dart';

class PerfilView extends StatelessWidget {
  const PerfilView ({super.key, required this.sessao});

  final SessaoController sessao;

  @override
  Widget build(BuildContext context) {

    final textos = Theme.of(context).textTheme;
    final apartamento = sessao.apartamento ?? '-';
    return ListView(
      padding: EdgeInsets.all(TemaEmprestaAi.espacoM),
      children: [
        CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
        SizedBox(height: TemaEmprestaAi.espacoM),
        Text(
          'Apartamento $apartamento',
          textAlign: TextAlign.center,
          style: textos.titleLarge,
        ),
        SizedBox(height: TemaEmprestaAi.espacoG),
        ListTile(
          leading: Icon(Icons.help_outline),
          title: Text('Ajuda'),
        ),
        ListTile(
          leading: Icon(Icons.description_outlined),
          title: Text('Regras de uso do condomínio'),
        ),
      ],
    );
  }
}