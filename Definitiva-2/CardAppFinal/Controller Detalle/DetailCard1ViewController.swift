//
//  DetailCard1ViewController.swift
//  CardAppFinal
//
//  Created by APPS2T on 8/3/22.
//

import UIKit

class DetailCard1ViewController: UIViewController{
    
    @IBOutlet weak var imageViewDetailCard1: UIImageView!
    
    @IBOutlet weak var rareTextField: UILabel!
    @IBOutlet weak var numberTextField: UILabel!
    @IBOutlet weak var edtionTextField: UILabel!
    @IBOutlet weak var cheapTextField: UILabel!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var sellersButton: UIButton!
    
    var card: Carta?
    var collectionDeck: [Carta] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sellersButton.layer.cornerRadius = 15
        
        rareTextField.text = card?.name
        numberTextField.text = String(card?.id ?? 0)
        edtionTextField.text = card?.edicion
        cheapTextField.text = String(card?.price ?? 0) + "€"
        descriptionTextField.text = card?.description
        imageViewDetailCard1.image = UIImage(named: card?.imageURL ?? "placeholder")
        
        /* guard let carta = card  else {return}
        
       NetworkManager.shared.getImageFrom(imageUrl: card!.imageURL){ image in
            DispatchQueue.main.async {
                self.ImageViewDetailCard1.image = image
            }
        }*/
        
        func renderUI(){
            guard let carta = card else { return }
        
            rareTextField.text = carta.name
            numberTextField.text = String(carta.id)
            edtionTextField.text = carta.edicion
            cheapTextField.text = String(carta.price)
            descriptionTextField.text = carta.description
            
        }
    }
    @IBAction func buttonGoDetailCard2(_ sender: Any) {
        if let navCon = storyboard?.instantiateViewController(identifier: "DetailViewController2Card") as? DetailCard2ViewController{
            print("Funciona este boton")
            
            navCon.modalPresentationStyle = .fullScreen
            navCon.modalTransitionStyle = .crossDissolve
            
            present(navCon, animated: true, completion: nil)
            print("O no?")
            navigationController?.pushViewController(navCon, animated: true)
           
          
    
        }
    }
    
    @IBAction func buttonReturntCard(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
