//
//  ScoreView.swift
//  Liam HW 2
//
//  Created by Alexa Frost on 10/12/24.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var quizViewModel: QuizViewModel
    var body: some View {
        VStack{
            Text("\(quizViewModel.score)/5")
                .bold()
                .font(.largeTitle)
            Text("Congratulations!! You Scored \(quizViewModel.score)/5 Points!!")
                .font(.headline)
            Spacer().frame(height: 80)
            Button (action: {quizViewModel.resetQuiz()}){
                Text("Reset")
                    .padding()
                    .background(quizViewModel.sport == .basketball ? Color.orange : quizViewModel.sport == .baseball ? Color.red : quizViewModel.sport == .football ? Color.brown : Color.white)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                    )
            }
            NavigationLink(destination: WelcomeView(), isActive: $quizViewModel.quizReset) {
                EmptyView()
            }
        }
    }
}


struct ScoreView_previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
        .environmentObject(QuizViewModel())
    }
}
