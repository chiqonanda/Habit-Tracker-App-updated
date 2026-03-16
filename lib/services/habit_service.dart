import '../config/supabase_config.dart';

class HabitService {

  Future<List<dynamic>> getHabits(String userId) async {
    final data = await supabase
        .from('habits')
        .select()
        .eq('user_id', userId)
        .order('created_at');

    return data;
  }

  Future<void> addHabit(Map<String, dynamic> habit) async {
    await supabase.from('habits').insert(habit);
  }

  Future<void> updateHabit(String id, Map<String, dynamic> habit) async {
    await supabase
        .from('habits')
        .update(habit)
        .eq('id', id);
  }

  Future<void> deleteHabit(String id) async {
    await supabase
        .from('habits')
        .delete()
        .eq('id', id);
  }
}