//
//  QuestionViewController.swift
//  Personality Quiz
//
//  Created by MXC Swift on 9/26/20.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    
    @IBOutlet weak var multiSwitch2: UISwitch!
    
    @IBOutlet weak var multiSwitch3: UISwitch!
    
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    
    
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var rangedLabel3: UILabel!
    
    @IBOutlet weak var rangedLabel4: UILabel!
    
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    //I DISCOVERED ALOT OF MY CODE DID NOT SAVE WHEN XCODE WAS CRASHING 9/29 I FORGOT THIS CODE IS IN THE QUESTION SWIFT FILE DELETE LATER//
    
    /*struct Question {
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
            switch self {
            case .fish:
                return "You are"
            case .lion:
                return "The eye of the tiger"
            case .scorpion:
                return ""
            case . ram:
                return ""
            }
        }
    }*/
    
    
    var questions: [Question] = [
        Question(text: "What sound do you make when upset or angry?",
        type: .single,
        answers: [
            Answer(text: "Humming", type: .fish),
            Answer(text: "Grunting", type: .lion),
            Answer(text: "Sighing", type: .scorpion),
            Answer(text: "High Pitched", type: .ram),
      ]
    ),
        
        Question(text: "What temperature are you the most comfortable?",
                 type: .multiple,
        answers: [
            Answer(text: "25°", type: .lion),
            Answer(text: "80° - 90°", type: .scorpion),
            Answer(text: "75° - 80°", type: .fish),
            Answer(text: "60° - 75°", type: .ram),
     ]
    ),
        
        Question(text: "What characteristic makes you feel confident?",
        type: .ranged,
        answers: [
            Answer(text: "Intelligence", type: .fish),
            Answer(text: "Being Persistent", type: .ram),
            Answer(text: "Strong", type: .lion),
            Answer(text: "Being Powerful", type: .scorpion),
            
            ]
)]
    var questionIndex = 0
            
    var answerChosen: [Answer] = []
            
        override func viewDidLoad() {
        super.viewDidLoad()
        updateUI ()
            
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Results" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answerChosen }
        
        }
    
    
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answerChosen.append(currentAnswers[0])
        case singleButton2:
            answerChosen.append(currentAnswers[1])
        case singleButton3:
            answerChosen.append(currentAnswers[2])
        case singleButton4:
            answerChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion ()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        if multiSwitch1.isOn {
            answerChosen.append(currentAnswers[0])
        }
    
        if multiSwitch2.isOn {
            answerChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answerChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answerChosen.append(currentAnswers[3])
        }
        nextQuestion ()
}
    
    @IBAction func rangedAnswerButtonPressed() {
        
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answerChosen.append(currentAnswers[index])
        
        
        
        nextQuestion()
        
    }
    
    func nextQuestion () {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }
    
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder)
    }
    
    func updateUI() {
            singleStackView.isHidden = true
            multipleStackView.isHidden = true
            rangedStackView.isHidden = true
            
            //navigationItem.title = "Question #\(questionIndex + 1)"
            
            let currentQuestion = questions [questionIndex]
            let currentAnswers = currentQuestion.answers
            let totalProgress = Float(questionIndex) /
                Float(questions.count)
            
            navigationItem.title = "Question #\(questionIndex + 1)"
            questionLabel.text = currentQuestion.text
            questionProgressView.setProgress(totalProgress, animated: true)
            
            switch currentQuestion.type {
            case .single:
                updateSingleStack(using: currentAnswers)
                //singleStackView.isHidden = false
                
                //updatesingleStack(using: currentAnswers)
                
            case .multiple:
                //multipleStackView.isHidden = false
                
              updateMultipleStack(using: currentAnswers)
            case .ranged:
                //rangedStackView.isHidden = false
                updateRangedStack(using: currentAnswers)
                
            }
        }
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers[1].text
        rangedLabel3.text = answers[2].text
        rangedLabel4.text = answers.last?.text

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
