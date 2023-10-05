import "package:ff/models/shared/constants.dart";
import "package:flutter/material.dart";

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3'];

  String _currentName = '';
  String _currentSugars = '0';
  int _currentStrength = 100;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Column(
            children: <Widget>[
              const Text("Update your coffee preferences",
                  style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) => value!.isEmpty ? 'Enter your name' : null,
                onChanged: (value) => setState(() {
                  _currentName = value;
                }),
                decoration: coffeeDecoration,
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField(
                value: _currentSugars,
                items: sugars.map((sugar) {
                  return DropdownMenuItem(
                      value: sugar, child: Text('$sugar sugars'));
                }).toList(),
                onChanged: (val) => setState(() {
                  _currentSugars = val ?? '0';
                }),
                decoration: coffeeDecoration,
              ),
              Slider(
                min: 100,
                max: 900,
                divisions: 8,
                activeColor: Colors.brown[_currentStrength ?? 100],
                inactiveColor: Colors.brown[100],
                onChanged: (value) => setState(() {
                  _currentStrength = value.round();
                }),
                value: (_currentStrength ?? 100).toDouble(),
              ),
              ElevatedButton(
                onPressed: () async {
                  print(_currentName);
                  print(_currentSugars);
                  print(_currentStrength);
                },
                child: const Text('Update'),
              )
            ],
          ),
        ));
  }
}
