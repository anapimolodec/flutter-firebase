import "package:ff/models/shared/constants.dart";
import "package:ff/models/shared/loading.dart";
import "package:ff/models/user.dart";
import "package:ff/services/database.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3'];

  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            UserData userdata = snapshot.data!;
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
                        initialValue: _currentName ?? userdata.name,
                        validator: (value) =>
                            value!.isEmpty ? 'Enter your name' : userdata.name,
                        onChanged: (value) => setState(() {
                          _currentName = value;
                        }),
                        decoration: coffeeDecoration,
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField(
                        value: _currentSugars ?? userdata.sugars,
                        items: sugars.map((sugar) {
                          return DropdownMenuItem(
                              value: sugar, child: Text('$sugar sugars'));
                        }).toList(),
                        onChanged: (val) => setState(() {
                          _currentSugars = val;
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
                        value:
                            (_currentStrength ?? userdata.strength).toDouble(),
                      ),
                      ElevatedButton(
                        onPressed: () async {},
                        child: const Text('Update'),
                      )
                    ],
                  ),
                ));
          } else {
            return const Loading();
          }
        });
  }
}
