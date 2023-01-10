import 'package:brasileirao/controllers/theme_controller.dart';
import 'package:brasileirao/models/times.dart';
import 'package:brasileirao/pages/time_pages.dart';
import 'package:brasileirao/repositories/times_repository.dart';
import 'package:brasileirao/widgets/brasao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = ThemeController.instancia;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brasileirão'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: ListTile(
                leading: Obx(() => controller.isDark.value
                    ? const Icon(Icons.brightness_7)
                    : const Icon(Icons.brightness_2)),
                title: Obx(() => controller.isDark.value
                    ? const Text('Light')
                    : const Text('Dark')),
                onTap: () {
                  controller.changeTheme();
                },
              ))
            ],
          ),
        ],
      ),
      body: Consumer<TimesRepository>(
        builder: (context, repositorio, child) {
          return ListView.separated(
            itemCount: repositorio.times.length,
            itemBuilder: (BuildContext contexto, int time) {
              final List<Time> tabela = repositorio.times;
              return ListTile(
                leading: Brasao(
                  image: tabela[time].brasao,
                  width: 40,
                ),
                title: Text(tabela[time].nome),
                subtitle: Text('Titulos: ${tabela[time].titulos?.length}'),
                trailing: Text(
                  tabela[time].pontos.toString(),
                ),
                onTap: () {
                  Get.to(() => TimePage(
                        key: Key(tabela[time].nome),
                        time: tabela[time],
                      ));
                },
              );
            },
            separatorBuilder: (__, _) => const Divider(),
            padding: const EdgeInsets.all(16),
          );
        },
      ),
    );
  }
}
