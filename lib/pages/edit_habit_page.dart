import 'package:flutter/material.dart';
import '../models/habit_model.dart';
import '../services/habit_service.dart';

class EditHabitPage extends StatefulWidget {
  final Habit habit;

  const EditHabitPage({super.key, required this.habit});

  @override
  State<EditHabitPage> createState() => _EditHabitPageState();
}

class _EditHabitPageState extends State<EditHabitPage> {
  late TextEditingController titleController;
  late TextEditingController descController;

  String selectedCategory = "Health";

  final List<String> categories = [
    "Health",
    "Fitness",
    "Mindfulness",
    "Productivity"
  ];

  final HabitService habitService = HabitService();

  @override
  void initState() {
    super.initState();
    titleController =
        TextEditingController(text: widget.habit.title);
    descController =
        TextEditingController(text: widget.habit.description);
    selectedCategory = widget.habit.category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Edit Habit",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () async {
              await habitService.deleteHabit(widget.habit.id);
              Navigator.pop(context, true);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text("HABIT NAME",
                style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 1.2,
                    color: Colors.grey)),

            const SizedBox(height: 8),

            _roundedTextField(titleController),

            const SizedBox(height: 25),

            const Text("DESCRIPTION",
                style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 1.2,
                    color: Colors.grey)),

            const SizedBox(height: 8),

            _roundedTextField(descController, maxLines: 3),

            const SizedBox(height: 30),

            const Text("CATEGORY",
                style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 1.2,
                    color: Colors.grey)),

            const SizedBox(height: 12),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: categories.map((category) {
                final bool isSelected =
                    selectedCategory == category;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 14),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFE8F8F0)
                          : Colors.grey[200],
                      borderRadius:
                          BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF2ECC71)
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? const Color(0xFF2ECC71)
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF2ECC71),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30),
                  ),
                ),
                onPressed: () async {
                  await habitService.updateHabit(
                    widget.habit.id,
                    {
                      'title': titleController.text,
                      'description': descController.text,
                      'category': selectedCategory,
                    },
                  );

                  Navigator.pop(context, true);
                },
                child: const Text(
                  "Update Habit",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _roundedTextField(
      TextEditingController controller,
      {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding:
            const EdgeInsets.symmetric(
                horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}