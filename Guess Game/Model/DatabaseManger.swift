//
//  DatabaseManger.swift
//  Guess Game
//
//  Created by Mohamed Elshaer on 5/7/20.
//  Copyright © 2020 Mohamed Elshaer. All rights reserved.
//

import Foundation
import SQLite

class DatabaseManger {
    
    static var shared = DatabaseManger()
    
    var database: Connection!
    
    let scoreTable = Table("scores")
    let idData = Expression<Int>("id")
    let nameData = Expression<String>("name")
    let scoreData = Expression<String>("score")
    
    var scoreArray = [String]()
    var nameArray = [String]()
    
    func setDatabaseTable(){
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("scores").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
        } catch {
            print(error)
        }
    }
    
    func createTable(){
        
        print("CREATE TAPPED")
        
        let createTable = self.scoreTable.create { (table) in
            table.column(self.idData, primaryKey: true)
            table.column(self.nameData)
            table.column(self.scoreData)
        }
        
        do {
            try self.database.run(createTable)
            print("Created Table")
        } catch {
            print(error)
        }
    }
    
    func insertInTable(name:String,score:String){
        
        print("INSERT TAPPED")
        
        let insertUser = self.scoreTable.insert(self.nameData <- name, self.scoreData <- score)
        
        do {
            try self.database.run(insertUser)
            print("INSERTED USER")
        } catch {
            print(error)
        }
        
    }
    
    private func clearArrayData(){
        scoreArray.removeAll()
        nameArray.removeAll()
    }
    
    func getDataFromDatabase() -> AnySequence<Row>? {
        
        print("Get Data")
        
        do {
            let scores = try self.database.prepare(self.scoreTable)
            clearArrayData()
            for score in scores {
                print("ID: \(score[self.idData]), name: \(score[self.nameData]), score: \(score[self.scoreData])")
                scoreArray.append(score[self.scoreData])
                nameArray.append(score[self.nameData])
            }
            return scores
        } catch {
            print(error)
        }
    return nil
    }
    
}
