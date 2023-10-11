import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onRestart, required this.onExit});

  final List<String> chosenAnswers;
  final void Function() onRestart;
  final void Function() onExit;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answeer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
            style: GoogleFonts.ubuntu(
              color: Colors.white,
              fontSize: 20,
              fontWeight : FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30),

            TextButton.icon(
              onPressed: onRestart,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 18, 160, 51),
              ),
              icon: const Icon(Icons.refresh_rounded),
              label: const Text(
                'Restart Quiz',
                // style: TextStyle(
                //   fontSize: 18.0,
                // ),
              ),
            ),

            TextButton.icon(
              onPressed: onExit,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 18, 160, 51),
              ),
              icon: const Icon(Icons.arrow_right_alt_rounded),
              label: const Text(
                'Exit Quiz',
                // style: TextStyle(
                //   fontSize: 18.0,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
