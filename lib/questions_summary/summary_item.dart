import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/questions_summary/question_identifier.dart';
// import 'package:quiz/questions_summary/questions_summary.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrextAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      QuestionIdentifier(
        isCorrectAnswer: isCorrextAnswer,
        questionIndex: itemData['question_index'] as int,
      ),
      const SizedBox(
        width: 20,
      ),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            itemData['question'] as String,
            style: GoogleFonts.ubuntu(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5,
          ),
          Text(
            itemData['user_answer'] as String,
            style: const TextStyle(
              color: Color.fromARGB(255, 202, 171, 252),
            ),
          ),
          Text(
            itemData['correct_answer'] as String,
            style: const TextStyle(
            color: Color.fromARGB(255, 181, 254, 246),
            ),
          ),
        ],
      ),
      ),
    ],
    );
  }
}
