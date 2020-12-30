//
//  ViewController.swift
//  Guess Game
//
//  Created by Mohamed Elshaer on 2/28/19.
//  Copyright © 2019 Mohamed Elshaer. All rights reserved.
//

import UIKit
import AVFoundation

class MainVC: UIViewController {

    // MARK:- Outlet
    @IBOutlet weak var guessRange: UILabel!
    @IBOutlet weak var guessField: UITextField!
    
    // MARK: - Properties
    var theCount = 0
    var level = 0
    var levelCounter = 1
    let rangeArray = [3,6,9,15,20,25,30,35,40,45]
    var theGuesses = [Int]()
    var player = AVAudioPlayer()
    
    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.setBackgroundColor(self)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.setDifficulty(level: level)
        genrerateGuess()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK:- Actions
    @IBAction func guessBtnPressed(_ sender: UIButton) {
        if guessField.text == "" {
            Helper.showAlert(view: self, title: "Error", message: "Plasae Enter A Number")
        } else {
            setTheGame(level: level)
        }
    }
}

// MARK:- Private Methods
extension MainVC {
    private func playSound(toneName: String){
        let audioPath = Bundle.main.path(forResource: toneName, ofType: "mp3")
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath:audioPath!))
        } catch {
            print("Error In Playing Sounds")
        }
        player.prepareToPlay()
        player.play()
    }
    private func genrerateGuess(){
        theGuesses.removeAll()
        var i = 0
        while i < rangeArray.count {

            let randomNuber = Int.random(in: 0 ... rangeArray[i])
            if !theGuesses.contains(randomNuber){
                theGuesses.append(randomNuber)
                i+=1
            }
        }
        print(theGuesses)
    }
    private func setDifficulty(level: Int){
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
            goToEndGameVC(score: theCount)
            startOver()
        } else {
            self.levelCounter -= 1
            Helper.showAlert(view: self, title: "Your Luck", message: "You have \(levelCounter) Time Left")
            playSound(toneName: R.file.loseMp3.name)
            guessField.text = ""
        }
    }
    private func setTheGame(level: Int){
        if guessField.text == String(theGuesses[9]){
            playSound(toneName: R.file.winMp3.name)
            goToEndGameVC(score: theCount)
            startOver()
        } else if guessField.text == String(theGuesses[theCount]){
            playSound(toneName: R.file.winMp3.name)
            theCount = theCount + 1
            setLabelText(guessRange: "Guess A Number Between 0 - \(rangeArray[theCount])")
        } else {
            switch level {
            case 1:
                setTimesLeft()
            case 2:
                setTimesLeft()
            case 3:
                goToEndGameVC(score: theCount)
                startOver()
            default:
                print("Error in switch level")
            }
        }
    }
    private func goToEndGameVC(score: Int){
        let mainStoryboard = UIStoryboard(name: R.storyboard.main.name, bundle: nil)
        let gameEndVC = mainStoryboard.instantiateViewController(withIdentifier: R.storyboard.main.gameEndVC.identifier) as! GameEndVC
        gameEndVC.score = (score + 1) * 10
        self.navigationController?.pushViewController(gameEndVC, animated: true)
    }
    private func startOver(){
        theCount = 0
        setLabelText(guessRange: "Guess A Number Between 0 - 3")
        genrerateGuess()
    }
    private func setLabelText(guessRange: String){
        self.guessRange.text = guessRange
        guessField.text = ""
    }
}
