import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'medinices.dart';

List<String> medicamList = [];

class Messagepage extends StatefulWidget {
  const Messagepage({super.key});

  @override
  State<Messagepage> createState() => _MessagepageState();
}

class _MessagepageState extends State<Messagepage> {
  //! REQUET SUR LES MEDICAMENTS
  CollectionReference medicineRef =
      FirebaseFirestore.instance.collection('medicines');
  List<QueryDocumentSnapshot<Object?>> medicineDocs = [];
  List<MedicinesModel> medicineInstance = [];
  Future<List<MedicinesModel>> getMedicam() async {
    medicineInstance.clear();

    QuerySnapshot<Object?> medicineQuery = await medicineRef.get();
    medicineDocs = medicineQuery.docs;
    for (QueryDocumentSnapshot<Object?> medicam in medicineDocs) {
      Map<String, dynamic> medicamData = medicam.data() as Map<String, dynamic>;

      medicineInstance.add(MedicinesModel.fromJson(medicamData));
    }
    for (MedicinesModel medicam in medicineInstance) {
      medicamList.add(medicam.name);
    }

    return medicineInstance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("search"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ]),
            ),
          ),
          const SizedBox(height: 20),
          FutureBuilder(
            future: getMedicam(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("INTERNT PROBLEM"),
                );
              }
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: medicineInstance.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(medicineInstance[index].name),
                      leading: CircleAvatar(
                        radius: 9.5,
                        backgroundColor:
                            medicineInstance[index].available == true
                                ? Colors.green
                                : Colors.red,
                      ),
                      trailing: Text(
                        medicineInstance[index].available == true
                            ? 'available'
                            : 'unavailable',
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text("Unknown problem"));
              }
            },
          ),
        ],
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  // List<String> medicamList = ["medicam1", "medicam 2"];
  @override
  Widget? buildLeading(BuildContext context) =>
      IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back));

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (String medicam in medicamList) {
      if (medicam.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(medicam);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        String result = matchQuery[index];
        return ListTile(
          tileColor: Colors.white,
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (String medicam in medicamList) {
      if (medicam.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(medicam);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        String result = matchQuery[index];
        return ListTile(
          tileColor: Colors.white,
          title: Text(result),
        );
      },
    );
  }
}
