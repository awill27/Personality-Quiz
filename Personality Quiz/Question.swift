//
//  Question.swift
//  Personality Quiz
//
//  Created by MXC Swift on 9/26/20.
//

import Foundation
struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}
struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case fish = "🐟", lion = "🦁", scorpion = "🦂", ram = "🐏"
    
    var definition: String {
        switch  self{
        case .fish:
            return ""
        case .lion:
            return ""
            
        case .scorpion:
            return ""
        case .ram:
            return ""
        }
        
        }
    }




