import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentScreen extends StatefulWidget {

  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {

  final TextEditingController nameController = TextEditingController();

  final TextEditingController rollController = TextEditingController();

  final TextEditingController departmentController =
      TextEditingController();

  final CollectionReference students =
      FirebaseFirestore.instance.collection("students");

  Future<void> saveStudent() async {

    if (nameController.text.isEmpty ||
        rollController.text.isEmpty ||
        departmentController.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields"),
        ),
      );

      return;
    }

    await students.add({

      "name": nameController.text,

      "roll": rollController.text,

      "department": departmentController.text,

    });

    nameController.clear();
    rollController.clear();
    departmentController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Student Saved Successfully"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Firebase Student App"),
        centerTitle: true,
      ),

      body: Padding(

        padding: const EdgeInsets.all(15),

        child: Column(

          children: [

            TextField(

              controller: nameController,

              decoration: const InputDecoration(

                labelText: "Student Name",

                border: OutlineInputBorder(),

              ),

            ),

            const SizedBox(height: 15),

            TextField(

              controller: rollController,

              decoration: const InputDecoration(

                labelText: "Student Roll",

                border: OutlineInputBorder(),

              ),

            ),

            const SizedBox(height: 15),

            TextField(

              controller: departmentController,

              decoration: const InputDecoration(

                labelText: "Department",

                border: OutlineInputBorder(),

              ),

            ),

            const SizedBox(height: 20),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                onPressed: saveStudent,

                child: const Text("Save"),

              ),

            ),

            const SizedBox(height: 20),

            const Text(

              "Saved Students",

              style: TextStyle(

                fontSize: 22,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 10),

            Expanded(

              child: StreamBuilder<QuerySnapshot>(

                stream: students.snapshots(),

                builder: (context, snapshot) {

                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (!snapshot.hasData ||
                      snapshot.data!.docs.isEmpty) {

                    return const Center(
                      child: Text("No Student Found"),
                    );
                  }

                  final studentList = snapshot.data!.docs;

                  return ListView.builder(

                    itemCount: studentList.length,

                    itemBuilder: (context, index) {

                      final student = studentList[index];

                      return Card(

                        elevation: 4,

                        margin: const EdgeInsets.only(bottom: 10),

                        child: ListTile(

                          leading: const CircleAvatar(
                            child: Icon(Icons.person),
                          ),

                          title: Text(student["name"]),

                          subtitle: Column(

                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              Text("Roll : ${student["roll"]}"),

                              Text(
                                  "Department : ${student["department"]}"),

                            ],

                          ),

                        ),

                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}