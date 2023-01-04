import 'package:brasileirao/models/times.dart';
import 'package:brasileirao/pages/edit_titulo_page.dart';
import 'package:brasileirao/repositories/times_repository.dart';
import 'package:brasileirao/widgets/brasao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_titulo_page.dart';
import 'package:get/get.dart';

class TimePage extends StatefulWidget {
  final Time? time;
  const TimePage({super.key, this.time});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  tituloPage() {
    Get.to(
      () => AddTituloPage(time: widget.time!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.time?.cor,
          title: Text(widget.time!.nome),
          actions: [
            IconButton(icon: const Icon(Icons.add), onPressed: tituloPage)
          ],
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.stacked_line_chart),
              text: 'Estatística',
            ),
            Tab(
              icon: Icon(Icons.emoji_events, color: Colors.amber),
              text: 'Títulos',
            ),
          ], indicatorColor: Colors.white),
        ),
        body: TabBarView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Brasao(
                  image: widget.time!.brasao,
                  width: 250,
                ),
              ),
              Text(
                'Pontos: ${widget.time?.pontos}',
                style: const TextStyle(fontSize: 22),
              ),
            ],
          ),
          titulos(),
        ]),
      ),
    );
  }

  Widget titulos() {
    final time = Provider.of<TimesRepository>(context)
        .times
        .firstWhere((t) => t.nome == widget.time?.nome);
    final quantidade = time.titulos.length;

    return quantidade == 0
        ? const Center(
            child: Text('Nenhum Título!'),
          )
        : ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(
                  Icons.emoji_events,
                  color: Colors.amber,
                ),
                title: Text(
                  time.titulos[index].campeonato,
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: Text(
                  time.titulos[index].ano,
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Get.to(
                      EditTituloPage(
                        titulo: time.titulos[index],
                      ),
                      fullscreenDialog: true);
                },
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: quantidade,
          );
  }
}
