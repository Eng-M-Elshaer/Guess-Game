//
//  ViewController.swift
//  Guess Game
//
//  Created by Mohamed Elshaer on 2/28/19.
//  Copyright © 2019 Mohamed Elshaer. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var guessRange: UILabel!
    @IBOutlet weak var guessField: UITextField!
    
    var theCount = 0
    var level = 0
    var levelCounter = 1
    let rangeArray = [3,6,9,15,20,25,30,35,40,45]
    var theGuesses = [Int]()
    
    private func genrerateGuess(){
        
        theGuesses.removeAll()
        
        for i in 0 ..< rangeArray.count {
            let number = Int.random(in: 0 ... rangeArray[i])
            theGuesses.append(number)
        }
        
        print(theGuesses)
    }
    
    private func setDifficulty(level:Int){
        switch level {
        case 1:
            levelCounter = 5
        case 2:
            levelCounter = 3
        case 3:
            levelCounter = 1
        default:
            print("Error in difficulty func")
        }
    }
    
    private func setTimesLeft(){
        if levelCounter == 1 {
            goToVC(score: theCount)
            startOver()
        } else {
            self.levelCounter -= 1
            tryAgainAlert(number: levelCounter)
            guessField.text = ""
        }
    }
    
    private func setTheGame(level:Int){
        
        if guessField.text == String(theGuesses[9]){
            
            setLabelText(guessRange: "Guess A Number Between 0 - 45")
            goToVC(score: theCount)
            theCount = 0
            
        } else if guessField.text == String(theGuesses[0]) || guessField.text == String(theGuesses[theCount]){
          
                theCount = theCount + 1
                setLabelText(guessRange: "Guess A Number Between 0 - \(rangeArray[theCount])")
           
        } else {
            
            switch level {
            case 1:
                setTimesLeft()
            case 2:
                setTimesLeft()
            case 3:
                goToVC(score: theCount)
                startOver()
            default:
                print("Error in switch level")
            }
            
        }
    }
    
    private func tryAgainAlert(number:Int){
        
        let alert = UIAlertController(title: "Your Luck", message: "You have \(number) Time Left", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    private func goToVC(score:Int){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "GameEndVC") as! GameEndVC
        vc.score = (score + 1) * 10
        self.navigationController?.pushViewController(vc, animated: true)

//        self.present(vc, animated: true, completion: nil)
    }
    
    private func startOver(){
        theCount = 0
        setLabelText(guessRange: "Guess A Number Between 0 - 3")
        genrerateGuess()
    }
    
    private func setLabelText(guessRange:String){
        self.guessRange.text = guessRange
        guessField.text = ""
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.setDifficulty(level: level)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        guessRange.text = "Guess A Number Between 0 - 3"
        
        genrerateGuess()
    }
    
    @objc func dismissKeyboard() {view.endEditing(true)}

    @IBAction func guessBtnPressed(_ sender: UIButton) {
        
        setTheGame(level: level)
        
    }
    
}

