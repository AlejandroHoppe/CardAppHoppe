//
//  Tutorial2ViewController.swift
//  CardAppFinal
//
//  Created by user208320 on 3/27/22.
//

import UIKit


class Tutorial2ViewController: UIViewController{
   
    @IBOutlet weak var buttonPass2: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    override func viewDidLoad() {
       super.viewDidLoad()
        searchButton.layer.cornerRadius = 15
        buttonPass2.layer.cornerRadius = 15
       
    }
}
