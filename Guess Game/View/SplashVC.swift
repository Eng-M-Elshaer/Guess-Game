//
//  SplashVC.swift
//  Guess Game
//
//  Created by Mohamed Elshaer on 5/7/20.
//  Copyright © 2020 Mohamed Elshaer. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.setBackgroundColor(vc: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        sleep(2)
        goToSelectVC()

    }

    private func goToSelectVC(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SelectDifficultyVC")
        navigationController?.pushViewController(vc, animated: true)
    }
}
