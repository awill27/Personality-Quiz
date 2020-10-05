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
            return "Fish - Pisces♓️ You are very sociable and a leader. You tend to supress your feelings. When stressed you will hide. Very intelligent. Capable of emotions, fear, joy and playfulness. Sometimes eager or bold. Observing and an recognize when being watched and will alter your behavior accordingly. You are also a dreamer, mysterious, imaginative, and idealistic. You adapt to any situation. On the other hand you can be overly trusting and always fighting for the underdog."
        case .lion:
            return "Lion - Leo♌️ You are energetic and strong. Moreover, you are very protective of your territory and will fight if necessary. Laziness is a characteristic but you are quick on your feet. You are loyal and prefer large groups and perfectly comfortable with commanding the stage. Futhermore, you are confident. Your warm personality and charasmatic traits makes your personality shine. You possess a big heart and you are an achiever."
            
        case .scorpion:
            return "Scorpion - Scorpio♏️ Well guarded and versatile. The scorpion loves different temperatures but mostly warm to hot. Adaptable to a variety of environments. You are highly emotional and have a demanding personality. You are also a leader. In addition, you are very determined and will not stop until you achieve it. You are very focused and brave. You will bite if necessary to protect yourself you never show your vulnerability."
        case .ram:
            return "Ram - Aries♈️ You are very strong and persistent. Also, easy going until agitated. Confrontation about territory decides who will be the dominating one. You love warm tempeartures and you command leadership and authority. You strive for power and you are very brave. You are determined and get easily frustrated. Also, you have the characteristics of a fearless warrior wanting to command their army. Bold impulsive, yet aggressive"
        }
        
        }
    }




