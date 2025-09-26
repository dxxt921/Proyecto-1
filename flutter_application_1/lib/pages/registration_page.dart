import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';
import '../data/registration_store.dart';
import '../models/registration.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});
  @override State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _mail = TextEditingController();
  final _pass = TextEditingController();
  final _confirm = TextEditingController();
  AutovalidateMode _auto = AutovalidateMode.disabled;
  bool _ob1 = true, _ob2 = true;
  bool _terms = false;

  @override void dispose(){ _name.dispose(); _mail.dispose(); _pass.dispose(); _confirm.dispose(); super.dispose(); }

  String? _vName(String? v){
    final t = v?.trim() ?? '';
    if(t.isEmpty) return 'Requerido';
    if(t.length < 3) return 'Mínimo 3 caracteres';
    return null;
  }
  String? _vMail(String? v){
    final t = v?.trim() ?? '';
    if(t.isEmpty) return 'Requerido';
    final ok = RegExp(r'^[\w\.\-]+@[\w\-]+\.[\w\.\-]+$').hasMatch(t);
    return ok ? null : 'Email inválido';
  }
  String? _vPass(String? v){
    final t = v ?? '';
    if(t.isEmpty) return 'Requerido';
    if(t.length < 6) return 'Mínimo 6 caracteres';
    return null;
  }
  String? _vConfirm(String? v){
    if(v != _pass.text) return 'Las contraseñas no coinciden';
    return null;
  }

  void _send(){
    setState(()=>_auto=AutovalidateMode.onUserInteraction);
    if(!_terms){ ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Debes aceptar términos'))); return; }
    if(!_form.currentState!.validate()) return;

    final r = Registration(name: _name.text.trim(), email: _mail.text.trim());
    RegistrationStore.instance.add(r);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Registrado: ${r.name} (${r.email})'))
    );
    _reset();
  }

  void _reset(){
    _form.currentState?.reset();
    _name.clear(); _mail.clear(); _pass.clear(); _confirm.clear();
    setState(()=>_auto=AutovalidateMode.disabled);
    setState(()=>_terms=false);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Registro',
      actions: [
        TextButton.icon(
          onPressed: ()=>Navigator.pushNamed(context, '/p/lista'),
          icon: const Icon(Icons.remove_red_eye_outlined),
          label: const Text('Ver registros'),
        )
      ],
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Form(
              key: _form,
              autovalidateMode: _auto,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(child: TextFormField(
                        controller: _name,
                        decoration: const InputDecoration(labelText:'Nombre', prefixIcon: Icon(Icons.person)),
                        validator: _vName,
                        textInputAction: TextInputAction.next,
                      )),
                      const SizedBox(width: 12),
                      Expanded(child: TextFormField(
                        controller: _pass,
                        obscureText: _ob1,
                        decoration: InputDecoration(
                          labelText:'Contraseña',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(_ob1?Icons.visibility:Icons.visibility_off),
                            onPressed: ()=>setState(()=>_ob1=!_ob1),
                          ),
                        ),
                        validator: _vPass,
                      )),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: TextFormField(
                        controller: _mail,
                        decoration: const InputDecoration(labelText:'Email', prefixIcon: Icon(Icons.email)),
                        keyboardType: TextInputType.emailAddress,
                        validator: _vMail,
                        textInputAction: TextInputAction.next,
                      )),
                      const SizedBox(width: 12),
                      Expanded(child: TextFormField(
                        controller: _confirm,
                        obscureText: _ob2,
                        decoration: InputDecoration(
                          labelText:'Confirmar contraseña',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(_ob2?Icons.visibility:Icons.visibility_off),
                            onPressed: ()=>setState(()=>_ob2=!_ob2),
                          ),
                        ),
                        validator: _vConfirm,
                      )),
                    ],
                  ),
                  const SizedBox(height: 12),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: _terms,
                    onChanged: (v)=>setState(()=>_terms=v??false),
                    title: const Text('Acepto términos'),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  Row(
                    children: [
                      Expanded(child: FilledButton.icon(
                        onPressed: _send,
                        icon: const Icon(Icons.send),
                        label: const Text('Enviar'),
                      )),
                      const SizedBox(width: 12),
                      Expanded(child: OutlinedButton.icon(
                        onPressed: _reset,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Limpiar'),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
