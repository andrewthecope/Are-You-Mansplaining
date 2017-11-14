//
//  ViewController.swift
//  Are You Mansplaining
//
//  Created by Andrew Cope on 11/8/17.
//  Copyright © 2017 Andrew Cope. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resultLabel.text = ""
    }
    
    @IBAction func areYouPressed(_ sender: Any) {
        
        isThisMansplaining(text: textView.text)
        
    }
    
    func isThisMansplaining(text: String) {
        
        let encodedText = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        let url = "https://hackdavis-iosworkshop.herokuapp.com/mansplain?text=%20\(encodedText!)%20"
        
        Alamofire.request(url).responseJSON { response in
            
            if let result = response.result.value {
                
                let json = JSON(result)
                let result = json["isMansplaining"].boolValue
                
                if result {
                    self.resultLabel.text = "YES. :("
                } else {
                    self.resultLabel.text = "YOU'RE GOOD. :)"
                }
                
            } else {
                self.resultLabel.text = "ERROR.  :/"
            }
        }
    }
        
    
    

    

}

