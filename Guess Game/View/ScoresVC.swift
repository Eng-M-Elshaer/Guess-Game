//
//  ScoresVC.swift
//  Guess Game
//
//  Created by Mohamed Elshaer on 5/2/20.
//  Copyright © 2020 Mohamed Elshaer. All rights reserved.
//

import UIKit
import SQLite

class ScoresVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let scoreData = DatabaseManger.shared.getDataFromDatabase()!
    var scoreArray = DatabaseManger.shared.scoreArray
    var nameArray = DatabaseManger.shared.nameArray
    fileprivate let cellIdentifier = "ScoreCell"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.setBackgroundColor(vc: self)
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavBarStyle()
    }
    
    private func setNavBarStyle(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

extension ScoresVC:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ScoreCell
            else {
            return UITableViewCell()
        }
        let index = indexPath.row
        cell.configCell(number: "\(index+1)-", name: nameArray[index], score: "\(scoreArray[index])%")
        
        return cell
    }
    
}
