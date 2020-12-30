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
    
    // MARK:- Outlet
    @IBOutlet weak var stackViewOne: UIStackView!
    @IBOutlet weak var stackViewTwo: UIStackView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // MARK: - Properties
    var score = 0
    
    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.setBackgroundColor(self)
        scoreLabel.text = "You're Lucky by \(score)%"
        SQLManger.shared().setDatabaseTable()
        SQLManger.shared().createTable()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    //MARK:- Actions
    @IBAction func nameBtnPressed(_ sender: UIButton) {
        if nameTextField.text == "" {
            Helper.showAlert(view: self, title: "Error", message: "Please Enter Your Name")
        } else {
            stackViewOne.isHidden = true
            stackViewTwo.isHidden = false
            SQLManger.shared().insertInTable(name: nameTextField.text!, score: "\(score)")
        }
    }
    @IBAction func viewScoresBtnPressed(_ sender: UIButton) {
        goToScoreVC()
    }
    @IBAction func playAginPressed(_ sender: UIButton) {
        goToSelectDifficultyVC()
    }
}

//MARK:- Private Methods
extension GameEndVC {
    private func goToScoreVC(){
        let mainStoryboard = UIStoryboard(name: R.storyboard.main.name, bundle: nil)
        let scoresVC = mainStoryboard.instantiateViewController(withIdentifier: R.storyboard.main.scoresVC.identifier) as! ScoresVC
        self.navigationController?.pushViewController(scoresVC, animated: true)
    }
    private func goToSelectDifficultyVC(){
        let mainStoryboard = UIStoryboard(name: R.storyboard.main.name, bundle: nil)
        let selectDifficultyVC = mainStoryboard.instantiateViewController(withIdentifier: R.storyboard.main.selectDifficultyVC.identifier) as! SelectDifficultyVC
        self.navigationController?.pushViewController(selectDifficultyVC, animated: true)
    }
}
