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
    
    private func genrerateGuess(){
        theGuesses.removeAll()
        
        for i in 0 ..< rangeArray.count {
            let number = Int.random(in: 0 ... rangeArray[i])
            theGuesses.append(number)
        }
        
        print(theGuesses)
    }
    
    private func gameEnd(number:Int){
        
        let alert = UIAlertController(title: "Your Luck", message: "You Are Lucky by \((number + 1) * 10)% 😁 \n Play Again", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { action in
            self.again()
        }))
        
        self.present(alert, animated: true)
    }
    
    private func again(){
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
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        guessRange.text = "Guess A Number Between 0 - 3"
        
        genrerateGuess()
    }
    
    @objc func dismissKeyboard() {view.endEditing(true)}

    @IBAction func guess(_ sender: Any) {
        if guessField.text == String(theGuesses[9]){
            setLabelText(guessRange: "Guess A Number Between 0 - 45")
            gameEnd(number: theCount)
            theCount = 0
        }else if guessField.text == String(theGuesses[0]) || guessField.text == String(theGuesses[theCount]){
            theCount = theCount + 1
            setLabelText(guessRange: "Guess A Number Between 0 - \(rangeArray[theCount])")
        }else{
            gameEnd(number: theCount)
            again()
        }
    }
    
}

