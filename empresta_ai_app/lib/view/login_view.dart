import 'package:empresta_ai_app/controllers/itens_controller.dart';
import 'package:empresta_ai_app/controllers/sessao_controller.dart';
import 'package:empresta_ai_app/theme/tema.dart';
import 'package:flutter/material.dart';
import 'package:empresta_ai_app/view/inicio_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, required this.sessao, required this.itens});

  final SessaoController sessao;
  final ItensController itens;
  
  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final _apartamento = TextEditingController();
  final _senha = TextEditingController();
  bool _senhaEscondida = true;

  void _entrar(){
    if (!_formKey.currentState!.validate()) return;
    if (!widget.sessao.entrar(_apartamento.text, _senha.text)) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => InicioView(sessao: widget.sessao, itens: widget.itens),
      ),
    );
  }

  @override
  void dispose() {
    _apartamento.dispose();
    _senha.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;
    final textos = Theme.of(context).textTheme;

   return Scaffold(
    body: SafeArea(child: Center(
    //Evita que o teclado cubra os campos
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
              ),
              SizedBox(height: TemaEmprestaAi.espacoG),

              TextFormField(
                controller: _apartamento, 
                textCapitalization: TextCapitalization.characters,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Bloco e apartamento",
                  hintText: "EX.: A-302",
                  prefixIcon: Icon(Icons.apartment) 
                ),
                validator: widget.sessao.validarApartamento,
              ),
              SizedBox(height: TemaEmprestaAi.espacoM),

              TextFormField(
                controller: _senha,
                obscureText: _senhaEscondida,
                textCapitalization: TextCapitalization.characters,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Senha",
                  hintText: "EX.: 1234",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    tooltip: "tooltip",
                    onPressed: (){
                      setState(() {
                        _senhaEscondida = !_senhaEscondida;
                      });
                    },
                    icon: Icon(_senhaEscondida ? Icons.visibility : Icons.visibility_off),
                  )
                ),
                validator: widget.sessao.validarSenha,
              ),
              SizedBox(height: TemaEmprestaAi.espacoG),
              FilledButton(
                onPressed: _entrar, 
                child: Text("Entrar"))
            ],
          )),
        ),
      ),
    ));
  }

}