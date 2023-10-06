import UIKit

let myJSON = """
{
    "quiz": {
        "sport": {
            "q1": {
                "question": "Which one is correct team name in NBA?",
                "options": [
                    "New York Bulls",
                    "Los Angeles Kings",
                    "Golden State Warriros",
                    "Huston Rocket"
                ],
                "answer": "Huston Rocket"
            }
        },
        "maths": {
            "q1": {
                "question": "5 + 7 = ?",
                "options": [
                    "10",
                    "11",
                    "12",
                    "13"
                ],
                "answer": "12"
            },
            "q2": {
                "question": "12 - 8 = ?",
                "options": [
                    "1",
                    "2",
                    "3",
                    "4"
                ],
                "answer": "4"
            }
        }
    }
}
"""

struct Quiz: Codable {
    let quiz: [String: QuizCategory]
}

struct QuizCategory: Codable {
    let q1: Question
    let q2: Question?
}

struct Question: Codable {
    let question: String
    let options: [String]
    let answer: String
}



if let jsonData = myJSON.data(using: .utf8) {
    do {
        let quizData = try JSONDecoder().decode(Quiz.self, from: jsonData)
        
        if let sportQuiz = quizData.quiz["sport"] {
            print("Sport Quiz:")
            print("Question: \(sportQuiz.q1.question)")
            print("Options: \(sportQuiz.q1.options)")
            print("Answer: \(sportQuiz.q1.answer)")
        }
        
        if let mathsQuiz = quizData.quiz["maths"] {
            print("\nMaths Quiz:")
            print("Question 1: \(mathsQuiz.q1.question)")
            print("Options 1: \(mathsQuiz.q1.options)")
            print("Answer 1: \(mathsQuiz.q1.answer)")
            
            if let q2 = mathsQuiz.q2 {
                print("\nQuestion 2: \(q2.question)")
                print("Options 2: \(q2.options)")
                print("Answer 2: \(q2.answer)")
            }
        }
    } catch {
        print("Error decoding JSON: \(error)")
    }
}
