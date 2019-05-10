//
//  ViewController.swift
//  Guess Game
//
//  Created by Mohamed Elshaer on 2/28/19.
//  Copyright © 2019 Mohamed Elshaer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessRange: UILabel!
    @IBOutlet weak var guessField: UITextField!
    
    var theCount = 0
    let rangeArray = [3,6,9,15,20,25,30,35,40,45]
    var theGuesses = [Int]()
    
    func genrerateGuess(){
        theGuesses.removeAll()
        for i in 0 ... 9{
            let number = Int.random(in: 0 ... rangeArray[i])
            theGuesses.append(number)
        }
        print(theGuesses)
    }
    
    func win(){
        let alert = UIAlertController(title: "Your Luck", message: "You Are Lucky by 100% :D \n Play Again", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.again()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    func lose(num:Int){
        let alert = UIAlertController(title: "Your Luck", message: "You Are Lucky by \((num + 1) * 10)% :D \n Play Again", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.again()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func again(){
        theCount = 0
        guessRange.text = "Guess A Number Between 0 - 3"
        guessField.text = ""
        genrerateGuess()
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        guessRange.text = "Guess A Number Between 0 - 3"
        genrerateGuess()
    }
    
    @objc func dismissKeyboard() {view.endEditing(true)}

    @IBAction func guess(_ sender: Any) {
        if guessField.text == String(theGuesses[0]){
            theCount = theCount + 1
            guessRange.text = "Guess A Number Between 0 - \(rangeArray[theCount])"
            guessField.text = ""
        }else if guessField.text == String(theGuesses[9]){
            theCount = 0
            guessRange.text = "Guess A Number Between 0 - 45"
            guessField.text = ""
            win()
        }else if guessField.text == String(theGuesses[theCount]){
            theCount = theCount + 1
            guessRange.text = "Guess A Number Between 0 - \(rangeArray[theCount])"
            guessField.text = ""
        }else{
            lose(num: theCount)
             again()
        }
    }
    
}

