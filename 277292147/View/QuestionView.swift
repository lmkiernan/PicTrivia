//
//  QuestionView.swift
//  Liam HW 2
//
//  Created by Alexa Frost on 10/12/24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quizViewModel: QuizViewModel

    
    
    var body: some View {
        VStack{
            Text("\(quizViewModel.sport) question #\(quizViewModel.currentQuestionIndex + 1)/5".capitalized)
                .font(.title)
                .bold()
                .font(.system(size: 15))
            Spacer().frame(height: 100)
            Text(quizViewModel.questions[quizViewModel.sport]![quizViewModel.currentQuestionIndex].question)
            Image(quizViewModel.questions[quizViewModel.sport]![quizViewModel.currentQuestionIndex].imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
            Spacer().frame(height:70)
            HStack {
                Button (action: {quizViewModel.submitAnswer(answer: quizViewModel.questions[quizViewModel.sport]![quizViewModel.currentQuestionIndex].answers[0]); quizViewModel.quizReset = false}){
                    Text(quizViewModel.questions[quizViewModel.sport]![quizViewModel.currentQuestionIndex].answers[0])
                        .padding()
                        .background(quizViewModel.sport == .basketball ? Color.orange : quizViewModel.sport == .baseball ? Color.red : quizViewModel.sport == .football ? Color.brown : Color.white)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }
                Button (action: {quizViewModel.submitAnswer(answer: quizViewModel.questions[quizViewModel.sport]![quizViewModel.currentQuestionIndex].answers[1]); quizViewModel.quizReset = false}){
                    Text(quizViewModel.questions[quizViewModel.sport]![quizViewModel.currentQuestionIndex].answers[1])
                        .padding()
                        .background(quizViewModel.sport == .basketball ? Color.orange : quizViewModel.sport == .baseball ? Color.red : quizViewModel.sport == .football ? Color.brown : Color.white)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }
            }
            HStack{
                Button (action: {quizViewModel.submitAnswer(answer: quizViewModel.questions[quizViewModel.sport]![quizViewModel.currentQuestionIndex].answers[2]); quizViewModel.quizReset = false}){
                    Text(quizViewModel.questions[quizViewModel.sport]![quizViewModel.currentQuestionIndex].answers[2])
                        .padding()
                        .background(quizViewModel.sport == .basketball ? Color.orange : quizViewModel.sport == .baseball ? Color.red : quizViewModel.sport == .football ? Color.brown : Color.white)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }
                Button (action: {quizViewModel.submitAnswer(answer: quizViewModel.questions[quizViewModel.sport]![quizViewModel.currentQuestionIndex].answers[3]); quizViewModel.quizReset = false}){
                    Text(quizViewModel.questions[quizViewModel.sport]![quizViewModel.currentQuestionIndex].answers[3])
                        .padding()
                        .background(quizViewModel.sport == .basketball ? Color.orange : quizViewModel.sport == .baseball ? Color.red : quizViewModel.sport == .football ? Color.brown : Color.white)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }
            }
            NavigationLink(destination: ScoreView(), isActive: $quizViewModel.quizFinished) {
                EmptyView()
            }
        }
    }
}

struct QuestionView_previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
        .environmentObject(QuizViewModel())
    }
}

