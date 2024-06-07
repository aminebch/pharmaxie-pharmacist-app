import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DataScreen(),
    );
  }
}

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  late Future<List<Map<String, dynamic>>> _data;

  @override
  void initState() {
    super.initState();
    _data = fetchData();
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    List<Map<String, dynamic>> data = [];
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('commande').get();
    for (var doc in snapshot.docs) {}
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Data'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error fetching data.'),
            );
          }
          List<Map<String, dynamic>>? data = snapshot.data;
          return ListView.builder(
            itemCount: data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index]['title']),
                subtitle: Text(data[index]['subtitle']),
              );
            },
          );
        },
      ),
    );
  }
}
