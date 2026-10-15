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
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF10111F),
        primaryColor: const Color(0xFF7C4DFF),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF17182B),
          foregroundColor: Colors.white,
        ),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7C4DFF),
          brightness: Brightness.dark,
        ),
      ),

      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 

  List<String> goals = [
    "Study French",
    "Finish homework",
    "Exercise",
  ];

  String selectedMood = "😊 Good";

  void addGoal() {
    // TODO: Create a popup for adding a new goal
  }

  void pickForMe() {
    // TODO: Choose a goal based on mood, time and priority
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Lock In 🔒",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Ready to lock in?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Choose what you want to work on today.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // Mood section

            const Text(
              "How are you feeling?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                moodButton("😴 Tired"),
                moodButton("😊 Good"),
                moodButton("🔥 Motivated"),
              ],
            ),

            const SizedBox(height: 25),

            // Pick for me button

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                onPressed: pickForMe,

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7C4DFF),
                  foregroundColor: Colors.white,
                ),

                child: const Text(
                  "🎲 Pick for Me",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "My Goals",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: goals.length,

                itemBuilder: (context, index) {

                  return Card(
                    color: const Color(0xFF1A1B30),

                    child: ListTile(
                      leading: const Icon(
                        Icons.flag,
                        color: Color(0xFF7C4DFF),
                      ),

                      title: Text(
                        goals[index],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),

                      subtitle: const Text(
                        "Tap to view goal",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      onTap: () {
                        // TODO: Open goal details
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF7C4DFF),

        onPressed: addGoal,

        child: const Icon(Icons.add),
      ),
    );
  }

  Widget moodButton(String mood) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 5),

        child: ElevatedButton(
          onPressed: () {
            setState(() {
              selectedMood = mood;
            });
          },

          child: Text(
            mood,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}