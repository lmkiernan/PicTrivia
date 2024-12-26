//
//  QuizViewModel.swift
//  Liam HW 2
//
//  Created by Alexa Frost on 10/12/24.
//

import Foundation

enum SportState {
    case basketball, football, baseball
}


class QuizViewModel: ObservableObject {
    @Published var quizReset : Bool = false
    @Published var images: [String] = []
    @Published var selectedAnswers: [String] = ["", "", "", "", ""]
    @Published var questions: [SportState: [Questions]] = [.basketball: [
        Questions(question: "What year was this picture of Michael Jordan taken?",
                  imageName: "Jordan",
                  answers : ["2001", "1978", "1997", "1965"],
                  correctAnswer: "1993"),
        Questions(question: "What year was this picture of Kobe Bryant taken?",
                  imageName: "Bryant",
                  answers : ["1983", "1991", "2018", "2005"],
                  correctAnswer: "2005"),
        Questions(question: "What year was this picture of Bill Russell taken?",
                  imageName: "Russell",
                  answers : ["1959", "1982", "1966", "2005"],
                  correctAnswer: "1959"),
        Questions(question: "What year was this picture of Larry Bird taken?",
                  imageName: "Bird",
                  answers : ["1975", "1982", "1990", "1994"],
                  correctAnswer: "1982"),
        Questions(question: "What year was this picture of Kareem Abdul-Jabbar taken?",
                  imageName: "Abdul-Jabbar",
                  answers : ["1976", "1988", "1992", "1993"],
                  correctAnswer: "1976")
      ], .football: [
        Questions(question: "What year was this picture of Tom Brady taken?",
                  imageName: "Brady",
                  answers : ["1994", "2010", "2006", "1977"],
                  correctAnswer: "2006"),
        Questions(question: "What year was this picture of Jerry Rice taken?",
                  imageName: "Rice",
                  answers : ["1976", "1988", "1992", "1993"],
                  correctAnswer: "1992"),
        Questions(question: "What year was this picture of Mean Joe Greene taken?",
                  imageName: "Greene",
                  answers : ["1975", "1982", "1990", "1994"],
                  correctAnswer: "1975"),
        Questions(question: "What year was this picture of Brett Favre taken?",
                  imageName: "Favre",
                  answers : ["1986", "2014", "1993", "2001"],
                  correctAnswer: "2001"),
        Questions(question: "What year was this picture of Patrick Mahomes taken?",
                  imageName: "Mahomes",
                  answers : ["2022", "2006", "1994", "2015"],
                  correctAnswer: "2022")
      ], .baseball: [
        Questions(question: "What year was this picture of Derek Jeter taken?",
                  imageName: "Jeter",
                  answers : ["1986", "2014", "1993", "2001"],
                  correctAnswer: "2001"),
        Questions(question: "What year was this picture of Roberto Clemente taken?",
                  imageName: "Clemente",
                  answers : ["1950", "1970", "1992", "1988"],
                  correctAnswer: "1970"),
        Questions(question: "What year was this picture of Alex Rodriguez taken?",
                  imageName: "Rodriguez",
                  answers : ["1994", "2010", "2006", "1977"],
                  correctAnswer: "2006"),
        Questions(question: "What year was this picture of Clayton Kershaw taken?",
                  imageName: "Kershaw",
                  answers : ["2020", "2006", "1994", "2015"],
                  correctAnswer: "2020"),
        Questions(question: "What year was this picture of Barry Bonds taken?",
                  imageName: "Bonds",
                  answers : ["1998", "2008", "1990", "1984"],
                  correctAnswer: "1998")
      ]]
    @Published var currentQuestionIndex: Int = 0
    @Published var score: Int = 0
    @Published var quizFinished: Bool = false
    @Published var sport : SportState = .basketball


  init() {
      self.selectedAnswers = selectedAnswers
      self.quizFinished = false
  }

 
    func submitAnswer(answer: String) {
        selectedAnswers[currentQuestionIndex] = answer
      if currentQuestionIndex <= questions.count {
          currentQuestionIndex += 1
      } else {
          for i in 0..<5 {
              if selectedAnswers[i] == questions[sport]![i].correctAnswer {
                  score += 1
              }
          }
          quizFinished = true
      }
  }
    


  /// Resets the quiz to its initial state for a new game.
  func resetQuiz() {
      quizReset = true
      selectedAnswers = ["", "", "", "", ""]
      currentQuestionIndex = 0
      score = 0
      quizFinished = false
  }
}
