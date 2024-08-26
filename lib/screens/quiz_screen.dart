import 'package:flutter/material.dart';
import 'result_screen.dart'; // Import the ResultScreen

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? _selectedAnswer;
  int _currentQuestionIndex = 0;
  int _score = 0; // Track the score

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the capital of France?',
      'answers': ['Berlin', 'Madrid', 'Paris', 'Rome'],
      'correct': 2,
    },
    {
      'question': 'What is the largest ocean?',
      'answers': ['Atlantic', 'Indian', 'Arctic', 'Pacific'],
      'correct': 3,
    },
     {
    'question': 'Who is known as the Father of the Nation in India?',
    'answers': ['Jawaharlal Nehru', 'Mahatma Gandhi', 'Subhas Chandra Bose', 'Sardar Patel'],
    'correct': 1,
  },
  {
    'question': 'Which river is considered the holiest in India?',
    'answers': ['Yamuna', 'Ganges', 'Brahmaputra', 'Godavari'],
    'correct': 1,
  },
  {
    'question': 'What is the capital of India?',
    'answers': ['Mumbai', 'Kolkata', 'New Delhi', 'Bengaluru'],
    'correct': 2,
  },
  {
    'question': 'Who was the first Prime Minister of India?',
    'answers': ['Indira Gandhi', 'Mahatma Gandhi', 'Jawaharlal Nehru', 'Lal Bahadur Shastri'],
    'correct': 2,
  },
  
  {
    'question': 'Which Indian festival is known as the Festival of Lights?',
    'answers': ['Holi', 'Diwali', 'Eid', 'Christmas'],
    'correct': 1,
  },
  {
    'question': 'Which state in India is known as the Land of Five Rivers?',
    'answers': ['Punjab', 'Rajasthan', 'Gujarat', 'Maharashtra'],
    'correct': 0,
  },
  {
    'question': 'Which monument is known as the symbol of love in India?',
    'answers': ['Qutub Minar', 'Red Fort', 'Taj Mahal', 'India Gate'],
    'correct': 2,
  },
  {
    'question': 'Who was the first President of India?',
    'answers': ['Rajendra Prasad', 'Sarvepalli Radhakrishnan', 'Zakir Husain', 'V. V. Giri'],
    'correct': 0,
  },
  
  {
    'question': 'Which city is known as the Silicon Valley of India?',
    'answers': ['Hyderabad', 'Pune', 'Mumbai', 'Bengaluru'],
    'correct': 3,
  },
  {
    'question': 'Which is the largest state in India by area?',
    'answers': ['Madhya Pradesh', 'Maharashtra', 'Rajasthan', 'Uttar Pradesh'],
    'correct': 2,
  },
  {
    'question': 'Which freedom fighter is known for his slogan "Give me blood, and I shall give you freedom"?',
    'answers': ['Bhagat Singh', 'Subhas Chandra Bose', 'Mahatma Gandhi', 'Lala Lajpat Rai'],
    'correct': 1,
  },
  {
    'question': 'In which city is the Gateway of India located?',
    'answers': ['Chennai', 'Mumbai', 'Kolkata', 'New Delhi'],
    'correct': 1,
  },
  {
    'question': 'Which is the highest civilian award in India?',
    'answers': ['Padma Shri', 'Bharat Ratna', 'Padma Bhushan', 'Padma Vibhushan'],
    'correct':1,
}

    // More questions here...
  ];

  void _submitAnswer() {
    if (_selectedAnswer != null) {
      bool isCorrect = _selectedAnswer == _questions[_currentQuestionIndex]['correct'];
      
      if (isCorrect) {
        _score++; // Increase the score if the answer is correct
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(isCorrect ? 'Correct!' : 'Incorrect'),
            content: Text(isCorrect ? 'Well done!' : 'Try again.'),
            actions: <Widget>[
              TextButton(
                child: Text('Next'),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _selectedAnswer = null;
                    if (_currentQuestionIndex < _questions.length - 1) {
                      _currentQuestionIndex++;
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            score: _score,
                            totalQuestions: _questions.length,
                          ),
                        ),
                      );
                    }
                  });
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      // Add background color here
      body: Container(
        color: const Color.fromARGB(255, 102, 143, 170), // Light background color
        child: _questions.isEmpty
            ? Center(child: Text('No questions available'))
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _questions[_currentQuestionIndex]['question'],
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 20),
                    ..._questions[_currentQuestionIndex]['answers']
                        .asMap()
                        .entries
                        .map((entry) {
                      int index = entry.key;
                      String answer = entry.value;
                      return RadioListTile<int?>(
                        title: Text(answer),
                        value: index,
                        groupValue: _selectedAnswer,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedAnswer = value;
                          });
                        },
                      );
                    }).toList(),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitAnswer,
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
