//
//  ResultViewController.swift
//  WorkCharacterTestAPP
//
//  Created by 姜又寧 on 2021/12/19.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var scoreRangeLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var toResolveTextView: UITextView!
    
//    var score : Int = 0
    
    var score: ResultInfo!
    
    init?(coder: NSCoder, score: ResultInfo) {
        self.score = score
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        switch score.result {
        case _ where score.result < 20:
            self.scoreRangeLabel.text = "少於20分：真材實料"
            self.scoreLabel.text = "\(score.result)分"
            self.toResolveTextView.text = toResolve[0]
        case _ where score.result >= 20 && score.result < 40:
            self.scoreRangeLabel.text = "30 － 40分：脫穎而出"
            self.scoreLabel.text = "\(score.result)分"
            self.toResolveTextView.text = toResolve[1]
        case _ where score.result >= 40:
            self.scoreRangeLabel.text = "高於40分：創意天才"
            self.scoreLabel.text = "\(score.result)分"
            self.toResolveTextView.text = toResolve[2]
        default:
            break
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
