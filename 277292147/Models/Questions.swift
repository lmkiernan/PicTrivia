//
//  Questions.swift
//  Liam HW 2
//
//  Created by Alexa Frost on 10/12/24.
//

import Foundation

struct Questions {
    var question: String
    var imageName: String
    var answers : [String]
    var correctAnswer: String
    
    func getImageName() -> String {
        return imageName
    }
}
