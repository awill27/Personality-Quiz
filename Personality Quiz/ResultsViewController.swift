//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by MXC Swift on 9/26/20.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    @IBOutlet weak var pictureResults: UIImageView!
    
    var responses:[Answer]!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        calcalutePersonalityResult()
    }
    
    func calcalutePersonalityResult () {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map {$0.type}
            
        

        for response in responseTypes {
        let newCount: Int
    

       if let oldCount = frequencyOfAnswers[response] {
              newCount = oldCount + 1
       } else {
              newCount = 1
            }
            
       frequencyOfAnswers[response] = newCount
            
    // I THINK I CAN SHORTEN THIS CODE. CHECK LATER
    }
    
       let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
    { (pair1, pair2) -> Bool in
        return pair1.value > pair2.value
    })
    
    let mostCommonAnswer = frequentAnswersSorted.first!.key
    

    resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        
    
        resultDefinitionLabel.text = mostCommonAnswer.definition
        
        switch mostCommonAnswer {
        case .fish:
            pictureResults.image = UIImage(named: "Pisces")
        case .lion:
            pictureResults.image = UIImage(named: "Lion")
        case .ram:
            pictureResults.image = UIImage(named: "Ram1")
        case .scorpion:
            pictureResults.image = UIImage(named: "Scorpion")
            
        }
        
        //pictureResults.image = UIImage(named: "Jasmine")
    
    }
    
        // Do any additional setup after loading the view.
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
