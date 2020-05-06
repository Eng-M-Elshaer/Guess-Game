//
//  GameEndVC.swift
//  Guess Game
//
//  Created by Mohamed Elshaer on 5/2/20.
//  Copyright © 2020 Mohamed Elshaer. All rights reserved.
//

import UIKit

class GameEndVC: UIViewController {

    
    @IBOutlet weak var stackViewOne: UIStackView!
    @IBOutlet weak var stackViewTwo: UIStackView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "You're Lucky by \(score)%"
    }
    
    private func goToScoreVC(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ScoresVC") as! ScoresVC
//        self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)

    }
   
    private func goToSelectDifficultyVC(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SelectDifficultyVC") as! SelectDifficultyVC
//        self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    @IBAction func nameBtnPressed(_ sender: UIButton) {
        stackViewOne.isHidden = true
        stackViewTwo.isHidden = false
    }
    @IBAction func viewScoresBtnPressed(_ sender: UIButton) {
        goToScoreVC()
    }
    @IBAction func playAginPressed(_ sender: UIButton) {
        goToSelectDifficultyVC()
    }
    
}
