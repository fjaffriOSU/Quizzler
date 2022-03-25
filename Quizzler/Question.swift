//
//  Question.swift
//  Quizzler
//
//  Created by Faisal Jaffri on 3/25/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation
class Question{
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
    }
    
    
}
