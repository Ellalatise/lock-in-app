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

// MAIN APP
class LockIn extends StatelessWidget {
  const LockIn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF5F0FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF8B5CF6),
          foregroundColor: Colors.white,
        ),
      ),

      home: const LoginPage(),
    );
  }
}

// SIGN UP PAGE
class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account ✨"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Join Lock In 🔒",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Your name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        userName: nameController.text,
                      ),
                    ),
                  );
                }
              },

              child: const Text("Create Account 🚀"),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}

// LOGIN PAGE
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "LOCK IN 🔒",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Welcome back! 💜",
              style: TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {
                if (emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {

                  String name = emailController.text.split("@")[0];

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        userName: name,
                      ),
                    ),
                  );
                }
              },

              child: const Text("Login ✨"),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupPage(),
                  ),
                );
              },

              child: const Text(
                "Don't have an account? Sign Up",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// GOAL INFORMATION
class Goal {
  String name;
  String priority;
  DateTime? deadline;
  double progress;

  Goal({
    required this.name,
    required this.priority,
    this.deadline,
    this.progress = 0,
  });
}

// HOME PAGE
class HomePage extends StatefulWidget {
  final String userName;

  const HomePage({
    super.key,
    required this.userName,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Goal> goals = [];

  String selectedMood = "Okay";
  int availableTime = 30;

  // GREETING
  String getGreeting() {
    int hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good morning ☀️";
    } else if (hour < 17) {
      return "Good afternoon 🌸";
    } else {
      return "Good evening 🌙";
    }
  }

  // ADD GOAL
  void addGoal() {
    String goalName = "";
    String priority = "Medium";
    DateTime? deadline;

    showDialog(
      context: context,

      builder: (context) {
        return StatefulBuilder(
          builder: (context, updatePopup) {
            return AlertDialog(
              title: const Text("Add a new goal 🎯"),

              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    TextField(
                      decoration: const InputDecoration(
                        labelText: "Goal name",
                      ),
                      onChanged: (value) {
                        goalName = value;
                      },
                    ),

                    const SizedBox(height: 15),

                    DropdownButton<String>(
                      value: priority,
                      isExpanded: true,

                      items: ["High", "Medium", "Low"]
                          .map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),

                      onChanged: (value) {
                        updatePopup(() {
                          priority = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 15),

                    ElevatedButton(
                      onPressed: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2035),
                        );

                        if (picked != null) {
                          updatePopup(() {
                            deadline = picked;
                          });
                        }
                      },

                      child: Text(
                        deadline == null
                            ? "Choose deadline 📅"
                            : "${deadline!.day}/${deadline!.month}/${deadline!.year}",
                      ),
                    ),
                  ],
                ),
              ),

              actions: [

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),

                ElevatedButton(
                  onPressed: () {
                    if (goalName.trim().isNotEmpty) {
                      setState(() {
                        goals.add(
                          Goal(
                            name: goalName.trim(),
                            priority: priority,
                            deadline: deadline,
                          ),
                        );
                      });

                      Navigator.pop(context);
                    }
                  },

                  child: const Text("Add Goal"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // OPEN GOAL
  void openGoal(Goal goal) {
    showDialog(
      context: context,

      builder: (context) {
        return StatefulBuilder(
          builder: (context, updatePopup) {
            return AlertDialog(
              title: Text(goal.name),

              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Importance: ${goal.priority}"),

                  const SizedBox(height: 10),

                  Text(
                    goal.deadline == null
                        ? "No deadline"
                        : "Deadline: ${goal.deadline!.day}/${goal.deadline!.month}/${goal.deadline!.year}",
                  ),

                  const SizedBox(height: 20),

                  const Text("Your progress"),

                  const SizedBox(height: 10),

                  LinearProgressIndicator(
                    value: goal.progress,
                    minHeight: 10,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "${(goal.progress * 100).toInt()}% completed",
                  ),

                  Slider(
                    value: goal.progress,
                    min: 0,
                    max: 1,
                    divisions: 10,

                    onChanged: (value) {
                      updatePopup(() {
                        goal.progress = value;
                      });

                      setState(() {});
                    },
                  ),
                ],
              ),

              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Done"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // PICK FOR ME
  void pickForMe() {
    if (goals.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Add a goal first! 🎯"),
        ),
      );
      return;
    }

    List<Goal> availableGoals = List.from(goals);

    availableGoals.shuffle();

    Goal selectedGoal = availableGoals.first;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Your next goal: ${selectedGoal.name} 🎲"),
      ),
    );
  }

  // HOME SCREEN
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Lock In 🔒"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            // WELCOME MESSAGE
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF8B5CF6),
                    Color(0xFFF472B6),
                  ],
                ),

                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "${getGreeting()}, ${widget.userName}!",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Ready to make today count? ✨",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "My Goals 🎯",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 15),

            // GOALS LIST
            Expanded(
              child: goals.isEmpty
                  ? const Center(
                      child: Text(
                        "No goals yet!\nLet's get locked in 🔒",
                        textAlign: TextAlign.center,
                      ),
                    )

                  : ListView.builder(
                      itemCount: goals.length,

                      itemBuilder: (context, index) {
                        Goal goal = goals[index];

                        return Card(
                          child: ListTile(
                            title: Text(goal.name),

                            subtitle: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [

                                Text(
                                  "Importance: ${goal.priority}",
                                ),

                                const SizedBox(height: 5),

                                LinearProgressIndicator(
                                  value: goal.progress,
                                  color: Colors.deepPurple,
                                  backgroundColor: Colors.purple.shade100,
                                ),

                                Text(
                                  "${(goal.progress * 100).toInt()}% completed",
                                ),
                              ],
                            ),

                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),

                            onTap: () {
                              openGoal(goal);
                            },
                          ),
                        );
                      },
                    ),
            ),

            const SizedBox(height: 10),

            // MOOD SELECTOR
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                const Text("How are you feeling?"),

                DropdownButton<String>(
                  value: selectedMood,

                  items: [
                    "Tired",
                    "Okay",
                    "Motivated",
                    "Stressed",
                  ].map((mood) {
                    return DropdownMenuItem(
                      value: mood,
                      child: Text(mood),
                    );
                  }).toList(),

                  onChanged: (value) {
                    setState(() {
                      selectedMood = value!;
                    });
                  },
                ),
              ],
            ),

            // FREE TIME SELECTOR
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                const Text("Free time:"),

                DropdownButton<int>(
                  value: availableTime,

                  items: [15, 30, 60, 120].map((time) {
                    return DropdownMenuItem(
                      value: time,
                      child: Text("$time min"),
                    );
                  }).toList(),

                  onChanged: (value) {
                    setState(() {
                      availableTime = value!;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 10),

            // PICK FOR ME BUTTON
            ElevatedButton(
              onPressed: pickForMe,
              child: const Text("🎲 Pick for Me"),
            ),

            const SizedBox(height: 8),

            // ADD GOAL BUTTON
            ElevatedButton(
              onPressed: addGoal,
              child: const Text("➕ Add Goal"),
            ),
          ],
        ),
      ),
    );
  }
}
