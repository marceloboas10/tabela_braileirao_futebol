import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:brasileirao/repositories/times_repository.dart';
import 'package:brasileirao/models/titulo.dart';

class EditTituloPage extends StatefulWidget {
  final Titulo? titulo;
  const EditTituloPage({super.key, this.titulo});

  @override
  State<EditTituloPage> createState() => _EditTituloPageState();
}

class _EditTituloPageState extends State<EditTituloPage> {
  final _campeonato = TextEditingController();
  final _ano = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _ano.text = widget.titulo!.ano;
    _campeonato.text = widget.titulo!.campeonato;
  }

  editar() {
    Provider.of<TimesRepository>(context, listen: false).editTitulo(
        titulo: widget.titulo, campeonato: _campeonato.text, ano: _ano.text);

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Título'),
        //backgroundColor: Colors.grey[800],
        actions: [
          IconButton(onPressed: editar, icon: const Icon(Icons.check)),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextFormField(
                controller: _ano,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Ano'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o ano do título';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: TextFormField(
                controller: _campeonato,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Campeonato'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o Campeonato';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
