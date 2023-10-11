import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),

           const SizedBox(
            height: 80),

           Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.quicksand(
              color:const Color.fromARGB(255, 188, 70, 70),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: 30),

          OutlinedButton.icon(
            onPressed: startQuiz, 
            style: OutlinedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 18, 160, 51),
            ),
           
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz',
            // style: TextStyle(
            //   fontSize: 18.0,
            // ),
            ),
          ),

            // const SizedBox(
            // height: 20),
        ],
      ),
    );
  }
}