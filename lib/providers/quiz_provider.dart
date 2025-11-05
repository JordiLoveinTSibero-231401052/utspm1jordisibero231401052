
import 'package:flutter/material.dart';
import '../models/question.dart';
import '../data/questions.dart';

class QuizProvider extends ChangeNotifier {
  String playerName = '';
  int currentIndex = 0;
  int score = 0;
  bool isDark = false;
  List<Question> questions = List.from(sampleQuestions);
  bool answered = false;

  void setName(String name) {
    playerName = name;
    notifyListeners();
  }

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  void answer(int optionIndex) {
    if (answered) return;
    answered = true;
    if (questions[currentIndex].correctIndex == optionIndex) {
      score += 10;
    }
    notifyListeners();
  }

  void next() {
    if (currentIndex < questions.length - 1) {
      currentIndex++;
      answered = false;
      notifyListeners();
    }
  }

  void reset() {
    playerName = '';
    currentIndex = 0;
    score = 0;
    answered = false;
    questions = List.from(sampleQuestions);
    notifyListeners();
  }
}
