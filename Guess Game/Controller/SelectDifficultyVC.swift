//
//  SelectDifficultyVC.swift
//  Guess Game
//
//  Created by Mohamed Elshaer on 5/2/20.
//  Copyright © 2020 Mohamed Elshaer. All rights reserved.
//

import UIKit

enum Difficulty: String {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}

class SelectDifficultyVC: UIViewController {

    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.setBackgroundColor(self)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK:- Private Methods
    private func goToMainVC(level: Int){
        let mainStoryboard = UIStoryboard(name: R.storyboard.main.name, bundle: nil)
        let mainVC = mainStoryboard.instantiateViewController(withIdentifier: R.storyboard.main.mainVC.identifier) as! MainVC
        mainVC.level = level
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
    
    // MARK:- Action
    @IBAction func selectDifficultyBtnPressed(_ sender: UIButton) {
        
        let btnTitle = sender.titleLabel?.text
        
        switch btnTitle {
        case Difficulty.easy.rawValue:
            goToMainVC(level: 1)
        case Difficulty.medium.rawValue:
            goToMainVC(level: 2)
        case Difficulty.hard.rawValue:
            goToMainVC(level: 3)
        default:
            print("Error in title Button")
        }
    }
}
