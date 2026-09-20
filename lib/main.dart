// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text('Hello World!'),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(const LockIn());
}

class LockIn extends StatelessWidget {
  const LockIn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage ({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> goals = [];

  void addGoal() {
    // I will add the goal system here
  }

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lock In 🔒"),
      ),

      body: Column(
        children: [

          const Text(
            "My Goals",
            style: TextStyle(fontSize: 25),
          ),

          // Goals will go here

          ElevatedButton(
            onPressed: addGoal,
            child: const Text("Add Goal"),
          ),

        ],
      ),
    );
  }
}
