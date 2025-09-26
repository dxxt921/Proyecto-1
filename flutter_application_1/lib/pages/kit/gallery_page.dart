import 'package:flutter/material.dart';
import '../../widgets/app_scaffold.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});
  // 👇 CAMBIA ESTA LISTA
  static List<String> get imgs => [
    'assets/images/charmander.png',
    'assets/images/gengar.png',
    'assets/images/pika.webp',
    'assets/images/pingu.webp',
    'assets/images/psyduck.png',
  ];
  @override
  Widget build(BuildContext context) {
    final cols = MediaQuery.of(context).size.width > 900 ? 4 : 2;
    return AppScaffold(
      title: 'Galería local',
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: GridView.count(
          crossAxisCount: cols, crossAxisSpacing: 12, mainAxisSpacing: 12,
          children: imgs.map((p)=>InkWell(
            onTap: ()=>showDialog(context: context, builder: (_)=>Dialog(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Image.asset(p, fit: BoxFit.cover),
                const SizedBox(height:8),
                Padding(padding: const EdgeInsets.only(bottom:8), child: Text(p.split('/').last))
              ]),
            )),
            child: ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset(p, fit: BoxFit.cover)),
          )).toList(),
        ),
      ),
    );
  }
}
