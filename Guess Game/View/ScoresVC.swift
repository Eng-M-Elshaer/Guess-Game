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

    // MARK:- Outlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    let scoreData = SQLManger.shared().getDataFromDatabase()
    var scoreArray = SQLManger.shared().scoreArray
    var nameArray = SQLManger.shared().nameArray

    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.setBackgroundColor(self)
        tableView.register(UINib(nibName: R.nib.scoreCell.name, bundle: nil), forCellReuseIdentifier: R.nib.scoreCell.name)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavBarStyle()
    }
}

// MARK:- UITableViewDataSource
extension ScoresVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.scoreCell.name, for: indexPath) as? ScoreCell
            else {return UITableViewCell()}
        let index = indexPath.row
        cell.configCell(number: "\(index+1)-", name: nameArray[index], score: "\(scoreArray[index])%")
        return cell
    }
}

// MARK:- Praive Methods
extension ScoresVC {
    private func setNavBarStyle(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
