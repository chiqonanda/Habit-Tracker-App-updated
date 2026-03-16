import 'package:flutter/material.dart';
import '../services/habit_service.dart';
import '../services/auth_service.dart';

class AddHabitPage extends StatefulWidget {
  const AddHabitPage({super.key});

  @override
  State<AddHabitPage> createState() => _AddHabitPageState();
}

class _AddHabitPageState extends State<AddHabitPage> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final HabitService habitService = HabitService();
  final AuthService authService = AuthService();

  String selectedCategory = "Kesehatan";

  final List<String> categories = [
    "Kesehatan",
    "Kebugaran",
    "Pikiran",
    "Produktivitas"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Kebiasaan Baru",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 10),

            const Center(
              child: Column(
                children: [
                  Icon(Icons.edit_calendar,
                      size: 60,
                      color: Color(0xFF2ECC71)),
                  SizedBox(height: 10),
                  Text(
                    "Buat Kebiasaan Baru",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Consistency is the key to success.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text("NAMA KEBIASAAN",
                style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 1.2,
                    color: Colors.grey)),

            const SizedBox(height: 8),

            _roundedTextField(
              titleController,
              hint: "e.g. Read for 30 mins",
            ),

            const SizedBox(height: 25),

            const Text("Deskripsi",
                style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 1.2,
                    color: Colors.grey)),

            const SizedBox(height: 8),

            _roundedTextField(
              descController,
              hint: "Why is this habit important?",
              maxLines: 3,
            ),

            const SizedBox(height: 30),

            const Text("KATEGORI",
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
                    if (titleController.text.isEmpty ||
                        descController.text.isEmpty) {
                      return;
                    }

                    final userId = authService.getCurrentUserId();

                    if (userId == null) return;

                    await habitService.addHabit({
                      'user_id': userId,
                      'title': titleController.text,
                      'description': descController.text,
                      'category': selectedCategory,
                      'is_completed': false,
                    });

                    Navigator.pop(context, true);
                  },
                child: const Text(
                  "Simpan Kebiasaan",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _roundedTextField(
    TextEditingController controller, {
    int maxLines = 1,
    String? hint,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}