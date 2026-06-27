import 'package:flutter/material.dart';

class Exzaminition extends StatelessWidget {
  Exzaminition({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text("Contact List 12345",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),

        /// 🔹 Form Added
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              /// 🔹 Input Field 1
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Hasan",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 10),

              /// 🔹 Input Field 2
              TextFormField(
                decoration: InputDecoration(
                  labelText: "82535342",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 10),

              /// 🔹 Button
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white60,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Added")),
                      );
                    }
                  },
                  child: Text("Add"),
                ),
              ),

              SizedBox(height: 20),

              /// 🔹 List / Card Section
              Expanded(
                child: ListView(
                  children: [

                    /// Card 1
                    Card(
                      elevation: 3,
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Mohan"),
                        subtitle: Text("82535342"),
                        trailing: Icon(Icons.phone),
                      ),
                    ),

                    /// Card 2
                    Card(
                      elevation: 3,
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Rahim"),
                        subtitle: Text("83647382"),
                        trailing: Icon(Icons.phone),
                      ),
                    ),

                    /// Card 3
                    Card(
                      elevation: 3,
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title:  Text("Karim"),
                        subtitle: Text("53535342"),
                        trailing: Icon(Icons.phone),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}