import 'package:brasileirao/pages/home_page.dart';
import 'package:brasileirao/repositories/times_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(create: (context)=> TimesRepository(),
  child: const Brasileirao(),));
}

class Brasileirao extends StatelessWidget {
  const Brasileirao({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}