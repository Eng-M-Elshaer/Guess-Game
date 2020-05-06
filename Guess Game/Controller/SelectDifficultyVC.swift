//
//  SelectDifficultyVC.swift
//  Guess Game
//
//  Created by Mohamed Elshaer on 5/2/20.
//  Copyright © 2020 Mohamed Elshaer. All rights reserved.
//

import UIKit

class SelectDifficultyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func goToVC(level:Int){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainVC") as! MainVC
        vc.level = level
        self.navigationController?.pushViewController(vc, animated: true)
//        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func selectDifficultyBtnPressed(_ sender: UIButton) {
        
        let btnTitle = sender.titleLabel?.text
        
        switch btnTitle {
        case "Easy":
            goToVC(level: 1)
        case "Medium":
            goToVC(level: 2)
        case "Hard":
            goToVC(level: 3)
        default:
            print("Error in title Button")
        }
        
    }
    
}
