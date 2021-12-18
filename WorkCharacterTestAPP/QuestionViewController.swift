//
//  QuestionViewController.swift
//  WorkCharacterTestAPP
//
//  Created by 姜又寧 on 2021/12/19.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var qustionLabel: UILabel!
    
    @IBOutlet var answerButtonLabel: [UIButton]!
    
    @IBOutlet weak var questionImage: UIImageView!
    
    
    var score : Int = 0
    
    var answerIndex : Int = 1
    
    var questionIndex: Int = 0 {
        didSet{
            self.qustionLabel.text = "\(qustion[questionIndex])"
            self.questionImage.image = UIImage(named: "\(questionIndex)")
            for index in 0...self.answerButtonLabel.count - 1{
                let answer = answer[answerIndex] ?? []
                self.answerButtonLabel[index].setTitle("\(answer[index])", for: .normal)
            }
            answerIndex += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.questionIndex = 0
    }
    
    func resetData() {
        self.score = 0
        self.answerIndex = 1
        self.questionIndex = 0
    }
    
    @IBAction func answerButtonClicked(_ sender: UIButton) {
        switch sender.tag{
        case 0:
            self.score += 1
        case 1:
            self.score += 3
        case 2:
            self.score += 5
        default:
            break
        }
        if questionIndex == (qustion.count - 1) {
            performSegue(withIdentifier: "ResultViewController", sender: nil)
            resetData()
        }else{
            self.questionIndex += 1
        }
    }
    
    @IBSegueAction func resultViewController(_ coder: NSCoder) -> ResultViewController? {
        ResultViewController(coder: coder, score: ResultInfo(result: self.score))
    }
}
