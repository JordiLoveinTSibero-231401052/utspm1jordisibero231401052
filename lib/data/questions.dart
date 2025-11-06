
import '../models/question.dart';

final List<Question> sampleQuestions = [
  Question(
    id: 'q1',
    text: 'Apa yang dimaksud dengan Flutter?',
    options: ['Game engine', 'Web library', 'Framework multi-platform', 'Animasi library'],
    correctIndex: 2,
  ),
  Question(
    id: 'q2',
    text: 'Bagaimana perintah untuk menjalankan App?',
    options: ['flutter run', 'flutter go', 'flutter start', 'flutter build'],
    correctIndex: 0,
  ),
  Question(
    id: 'q3',
    text: 'Bahasa pemrograman apakah yang digunakan Flutter?',
    options: ['Java', 'Phyton', 'Kolin', 'Dart'],
    correctIndex: 3,
  ),
  Question(
    id: 'q4',
    text: 'Widget apa yang digunakan untuk menampilkan teks?',
    options: ['Text', 'Button', 'Label', 'String'],
    correctIndex: 0,
  ),
  Question(
    id: 'q5',
    text: 'Widget apa yang digunakan untuk menampilkan Gambar',
    options: ['Text', 'image', 'Button', 'Label'],
    correctIndex: 1,
  ),
];
