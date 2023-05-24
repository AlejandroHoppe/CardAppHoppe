//
//  Tutorial6ViewController.swift
//  CardAppFinal
//
//  Created by user208320 on 3/27/22.
//

import UIKit


class Tutorial6ViewController: UIViewController{
   
    @IBOutlet weak var pass6Button: UIButton!
    @IBOutlet weak var choiceCardButton: UIButton!
    
    override func viewDidLoad() {
       super.viewDidLoad()
        pass6Button.layer.cornerRadius = 15
        choiceCardButton.layer.cornerRadius = 15
       
       
    }
    @IBAction func buttonClose(_ sender: Any) {
        if let navCon = storyboard?.instantiateViewController(identifier: "TapBarIdentifier") as? UITabBarController{
            
            
            navCon.modalPresentationStyle = .fullScreen
            navCon.modalTransitionStyle = .crossDissolve
            
            present(navCon, animated: true, completion: nil)
    }
    }
}
