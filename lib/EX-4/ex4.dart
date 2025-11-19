import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(title: const Text("Score Bar Example")),
      body: const Center(child: SingleScoreBar()),
    ),
  ));
}

/// Stateful widget for one score bar
class SingleScoreBar extends StatefulWidget {
  const SingleScoreBar({super.key});

  @override
  State<SingleScoreBar> createState() => _SingleScoreBarState();
}

class _SingleScoreBarState extends State<SingleScoreBar> {
  int score = 5; // initial score
  final int maxScore = 10;

  void incrementScore() {
    setState(() {
      if (score < maxScore) score++;
    });
  }

  void decrementScore() {
    setState(() {
      if (score > 0) score--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "My score in Flutter",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Buttons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: decrementScore,
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: incrementScore,
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Progress bar
          SizedBox(
            height: 20,
            child: Stack(
              children: [
                // Background
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                // Filled part
                FractionallySizedBox(
                  widthFactor: score / maxScore,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "$score / $maxScore",
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
