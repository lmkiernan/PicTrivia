//
//  WelcomeView.swift
//  Liam HW 2
//
//  Created by Alexa Frost on 10/12/24.
//

import SwiftUI


struct WelcomeView: View {
    @EnvironmentObject var quizViewModel: QuizViewModel
    var body: some View{
        NavigationStack {
            VStack {
                VStack {
                    Text("When Was This?")
                        .font(.title)
                        .bold()
                    Text("A Sports Trivia Game")
                        .italic()
                    Spacer().frame(height: 70)
                    Text("1950 - 2024")
                        .font(.system(size: 60))
                    Spacer().frame(height: 70)
                    NavigationLink(destination: QuestionView()) {
                        Text("Start Game")
                            .font(.headline)
                            .bold()
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }
                    Spacer().frame(height: 50)
                    
                }
                HStack {
                    Button (action: ({
                        quizViewModel.sport = .basketball})){
                        Image(systemName: "basketball")
                            .padding()
                            .background(quizViewModel.sport == .basketball ? Color.orange : Color.white)
                            .foregroundColor(quizViewModel.sport == .basketball ? .white : .black)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }
                    Button (action: ({quizViewModel.sport = .baseball})){
                        Image(systemName: "baseball")
                            .padding()
                            .background(quizViewModel.sport == .baseball ? Color.red : Color.white)
                            .foregroundColor(quizViewModel.sport == .baseball ? .white : .black)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }
                    Button (action: ({quizViewModel.sport = .football})) {
                        Image(systemName: "football")
                            .padding()
                            .background(quizViewModel.sport == .football ? Color.brown : Color.white)
                            .foregroundColor(quizViewModel.sport == .football ? .white : .black)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }
                }
                Spacer().frame(height: 30)
                Text("Press on your desired sport and start playing!")
                Spacer().frame(height: 15)
                Text("Initially Basketball is selected, but you can press to change your sport")
                    .italic()
                    .font(.system(size: 10))
            }
        }
    }
}

struct WelcomeView_previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
        .environmentObject(QuizViewModel())
    }
}
