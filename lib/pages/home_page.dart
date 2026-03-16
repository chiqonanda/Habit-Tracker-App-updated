import 'package:flutter/material.dart';
import '../models/habit_model.dart';
import '../widgets/habit_card.dart';
import 'add_habit_page.dart';
import 'edit_habit_page.dart';
import '../widgets/progress_section.dart';
import '../services/habit_service.dart';
import '../services/auth_service.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  List<Habit> habits = [];
  final HabitService habitService = HabitService();
  final AuthService authService = AuthService();

  Future<void> fetchHabits() async {
  final userId = authService.getCurrentUserId();

  if (userId == null) return;

  final data = await habitService.getHabits(userId);

  setState(() {
    habits = data.map((h) => Habit(
      id: h['id'],
      title: h['title'],
      description: h['description'],
      category: h['category'],
      isCompleted: h['is_completed'] ?? false,
    )).toList();
  });
}

  double get progress {
    if (habits.isEmpty) return 0;
    int completed =
        habits.where((habit) => habit.isCompleted).length;
    return completed / habits.length;
  }

  void addHabit(Habit habit) {
    setState(() {
      habits.add(habit);
    });
  }

  

  void updateHabit(int index, Habit updatedHabit) {
    setState(() {
      habits[index] = updatedHabit;
    });
  }

    Future<void> deleteHabit(String id) async {
      await habitService.deleteHabit(id);
      fetchHabits();
    }

  @override
void initState() {
  super.initState();
  fetchHabits();
}

  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: const Text("Daily Habit Tracker"),
    centerTitle: true,
    actions: [
      IconButton(
        icon: const Icon(Icons.dark_mode),
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false)
              .toggleTheme();
        },
      ),
      IconButton(
        icon: const Icon(Icons.logout),
        onPressed: () async {
          await authService.signOut();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const LoginPage(),
            ),
          );
        },
      ),
    ],
  ),

  floatingActionButton: FloatingActionButton(
    backgroundColor: const Color(0xFF2ECC71),
    child: const Icon(Icons.add),
    onPressed: () async {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const AddHabitPage(),
        ),
      );

      if (result == true) {
        fetchHabits();
      }
    },
  ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ProgressSection(
              totalHabits: habits.length,
              completedHabits:
                  habits.where((h) => h.isCompleted).length,
            ),
            const SizedBox(height: 20),
              Expanded(
        child: habits.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.track_changes, size: 60, color: Colors.grey),
                    SizedBox(height: 10),
                    Text(
                      "Belum ada kebiasaan",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Tambahkan kebiasaan baru dengan tombol +",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: habits.length,
                itemBuilder: (context, index) {
                  return HabitCard(
                    habit: habits[index],
                    onChanged: (value) {
                      setState(() {
                        habits[index].isCompleted = value!;
                      });
                    },
                    onEdit: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              EditHabitPage(habit: habits[index]),
                        ),
                      );

                      if (result == "delete") {
                        deleteHabit(habits[index].id);
                      } else if (result == true) {
                        fetchHabits();
                      }
                    },
                    onDelete: () => deleteHabit(habits[index].id),
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