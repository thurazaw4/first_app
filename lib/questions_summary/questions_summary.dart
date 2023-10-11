import 'package:flutter/material.dart';
import 'package:quiz/questions_summary/summary_item.dart';
// import 'package:quiz/questions_summary/questions_summary.dart';
// import 'package:quiz/questions_summary/question_identifier.dart';
// import 'package:google_fonts/google_fonts.dart';


class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return SummaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}
