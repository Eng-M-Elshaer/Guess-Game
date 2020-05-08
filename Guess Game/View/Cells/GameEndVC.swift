//
//  GameEndVC.swift
//  Guess Game
//
//  Created by Mohamed Elshaer on 5/2/20.
//  Copyright © 2020 Mohamed Elshaer. All rights reserved.
//

import UIKit
import SQLite

class GameEndVC: UIViewController {

    @IBOutlet weak var stackViewOne: UIStackView!
    @IBOutlet weak var stackViewTwo: UIStackView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.setBackgroundColor(vc: self)
        scoreLabel.text = "You're Lucky by \(score)%"
        DatabaseManger.shared.setDatabaseTable()
        DatabaseManger.shared.createTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func goToScoreVC(){
        let sb = UIStoryboard(name: R.storyboard.main.name, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: R.storyboard.main.scoresVC.identifier) as! ScoresVC
        self.navigationController?.pushViewController(vc, animated: true)

    }
   
    private func goToSelectDifficultyVC(){
        let sb = UIStoryboard(name: R.storyboard.main.name, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: R.storyboard.main.selectDifficultyVC.identifier) as! SelectDifficultyVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func nameBtnPressed(_ sender: UIButton) {
        if nameTextField.text == "" {
            Helper.showAlert(view: self, title: "Error", message: "Please Enter Your Name")
        } else {
            stackViewOne.isHidden = true
            stackViewTwo.isHidden = false
            DatabaseManger.shared.insertInTable(name: nameTextField.text!, score: "\(score)")
        }
    }
    @IBAction func viewScoresBtnPressed(_ sender: UIButton) {
        goToScoreVC()
    }
    @IBAction func playAginPressed(_ sender: UIButton) {
        goToSelectDifficultyVC()
    }
    
}
