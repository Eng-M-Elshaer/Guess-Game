//
//  Helper.swift
//  
//
//  Created by Mohamed Elshaer on 5/7/20.
//

import UIKit

class Helper {
    
    static func showAlert(view:UIViewController,title:String,message:String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        view.present(alert, animated: true)
    }
    
    static func setBackgroundColor(vc:UIViewController){
        vc.view.setBackgroundColor(colorOne: .purple, colorTwo: .blue)
    }
    
}
