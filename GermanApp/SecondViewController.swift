//
//  SecondViewController.swift
//  GermanApp
//
//  Created by Seric on 2/8/17.
//  Copyright © 2017 Alper. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    var german = [String]()
    var english = [String]()
    
    var randomIndex: Int = 0
    
    
    @IBOutlet weak var TextView: UILabel!
    @IBOutlet weak var TextView2: UILabel!
    
    
    @IBAction func Answer(_ sender: Any) {
        
        TextView2.text = german[randomIndex]
        
    }
    
    
    
    @IBAction func Next(_ sender: Any) {
        
        randomIndex = Int(arc4random_uniform(UInt32(english.count)))
        TextView.text = english[randomIndex]
        TextView2.text = ""

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let path = Bundle.main.path(forResource: "familie", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                var temp = [String]()
                
                for i in 0...(myStrings.count-2){
                    
                    temp = myStrings[i].components(separatedBy: ",")
                    german.append(temp[0])
                    english.append(temp[1])
                }
                
                randomIndex = Int(arc4random_uniform(UInt32(english.count)))
                TextView.text = english[randomIndex]
                
            } catch {
                print(error)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
