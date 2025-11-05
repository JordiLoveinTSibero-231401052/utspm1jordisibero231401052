
import '../models/question.dart';

final List<Question> sampleQuestions = [
  Question(
    id: 'q1',
    text: 'Apa singkatan CPU dalam komputer?',
    options: ['Central Processing Unit', 'Central Program Unit', 'Computer Processing Unit', 'Control Processing Unit'],
    correctIndex: 0,
  ),
  Question(
    id: 'q2',
    text: 'Siapa yang menciptakan bahasa pemrograman C?',
    options: ['Dennis Ritchie', 'James Gosling', 'Bjarne Stroustrup', 'Guido van Rossum'],
    correctIndex: 0,
  ),
  Question(
    id: 'q3',
    text: 'Apa warna campuran merah dan biru?',
    options: ['Magenta', 'Hijau', 'Cyan', 'Kuning'],
    correctIndex: 0,
  ),
  Question(
    id: 'q4',
    text: 'Berapa bit dalam 1 byte?',
    options: ['8', '4', '16', '32'],
    correctIndex: 0,
  ),
  Question(
    id: 'q5',
    text: 'Apa singkatan dari HTTP?',
    options: ['HyperText Transfer Protocol', 'High Transfer Text Protocol', 'Hyperlink Transfer Text Protocol', 'HyperText Transmission Protocol'],
    correctIndex: 0,
  ),
];
