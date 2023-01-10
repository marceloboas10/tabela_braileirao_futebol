import 'package:brasileirao/models/titulo.dart';
import 'package:brasileirao/repositories/times_repository.dart';
import 'package:flutter/material.dart';
import '../models/times.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class AddTituloPage extends StatefulWidget {
  const AddTituloPage({super.key, required this.time});

  final Time time;

  @override
  State<AddTituloPage> createState() => _AddTituloPageState();
}

class _AddTituloPageState extends State<AddTituloPage> {
  final _campeonato = TextEditingController();
  final _ano = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  save() {
    Provider.of<TimesRepository>(context, listen: false).addTitulo(
      time: widget.time,
      titulo: Titulo(
        campeonato: _campeonato.text,
        ano: _ano.text,
      ),
    );

    Get.back();

    Get.snackbar('', '',
        backgroundColor: Colors.grey[100],
        colorText: Colors.black,
        messageText: const Text(
          'Título Cadastrado',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Título'),
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
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.all(24),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      save();
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.check),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Salvar',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
