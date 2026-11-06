import 'package:flutter/material.dart';
import '../models/item.dart';
import 'icone_categoria.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item, required this.aoTocar});
  
  final Item item;
  final VoidCallback aoTocar;

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;
    final situacao = item.disponivel ? 'Disponível' : 'Emprestado';

    return Semantics(
      button: true,
      label: '${item.nome}, de ${item.dono}, $situacao',
      excludeSemantics: true,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: aoTocar,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: cores.primaryContainer,
                  child: Icon(iconeDaCategoria(item.categoria),
                    color: cores.onPrimaryContainer),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.nome,
                        style: Theme.of(context).textTheme.titleMedium),
                      Text('${item.dono} · ${item.apartamento}'),
                    ],
                  ),
                ),
                Chip(
                  label: Text(situacao),
                  backgroundColor: item.disponivel
                    ? cores.secondaryContainer
                    : cores.errorContainer,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}