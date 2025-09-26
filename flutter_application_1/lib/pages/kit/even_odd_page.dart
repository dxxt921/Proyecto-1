import 'dart:math';
import 'package:flutter/material.dart';
import '../../widgets/app_scaffold.dart';

class EvenOddPage extends StatefulWidget { const EvenOddPage({super.key}); @override State<EvenOddPage> createState()=>_EvenOddPageState(); }
class _EvenOddPageState extends State<EvenOddPage> {
  final _rng=Random(); bool userEven=true; int user=0,cpu=0;
  void _play(int n){ final c=_rng.nextInt(6); final sum=n+c; final even=sum%2==0; final win=(even&&userEven)||(!even&&!userEven);
    setState(()=>win?user++:cpu++); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tú:$n • CPU:$c • Suma $sum → ${even?'Par':'Impar'} → ${win?'¡Ganaste!':'Perdiste'}'))); }
  void _reset(){ setState((){user=0;cpu=0;}); }

  @override Widget build(BuildContext context){
    return AppScaffold(
      title: 'Juego: Par o Impar',
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SegmentedButton<bool>(
            segments: const [
              ButtonSegment(value:true,  label: Text('Par'),   icon: Icon(Icons.exposure_plus_2)),
              ButtonSegment(value:false, label: Text('Impar'), icon: Icon(Icons.exposure_minus_1)),
            ], selected:{userEven}, onSelectionChanged:(s)=>setState(()=>userEven=s.first),
          ),
          const SizedBox(height: 12),
          Wrap(spacing: 10, runSpacing: 10, children: List.generate(6,(i)=>FilledButton(onPressed:()=>_play(i), child: Text('$i')))),
          const SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Chip(label: Text('Tú: $user')), const SizedBox(width: 8),
            Chip(label: Text('CPU: $cpu')), const SizedBox(width: 8),
            OutlinedButton.icon(onPressed:_reset, icon: const Icon(Icons.restart_alt), label: const Text('Reiniciar')),
          ])
        ]),
      ),
    );
  }
}
