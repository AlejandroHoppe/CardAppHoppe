//
//  ContraseñaViewController.swift
//  CardAppFinal
//
//  Created by APPS2T on 17/2/22.
//
import UIKit

class ContraseñaViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    
    
    @IBOutlet weak var sendPasswordbutton: UIButton!
    let saveUser = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendPasswordbutton.layer.cornerRadius = 15
        
        
    }
    
    @IBAction func recuperarButtonTapped(_ sender: Any) {
    
  
guard let correo = emailTextField.text, !correo.isEmpty else {
    let alertController = UIAlertController(title: "Rellene el campo de correo", message: "",  preferredStyle: .actionSheet)
    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alertController, animated: true, completion: nil)
    
    return
}

        if correo != saveUser.string(forKey: "correoSave"){
        let alertController = UIAlertController(title: "No existe usuario con este correo", message: "",  preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
        return
        
    }
    

        if correo == saveUser.string(forKey: "correoSave"){
           
            //let contraseñaCambio = RandomNumberGenerator.self
            //self.saveUser.set(contraseñaCambio, forKey: "contraseñaSave")
            //saveUser.setValue(RandomNumberGenerator.self, forKey: "contraseñaSave")
            saveUser.setValue(12345678, forKey: "contraseñaSave")
            
            //print("Aqui la contraseña")
            //print(saveUser.string(forKey: "contraseñaSave"))
            
            let alertController = UIAlertController(title: "Se ha enviado a su correo la contraseña", message: "",  preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
                self.openLoginVC()
            }))
            self.present(alertController, animated: true, completion: nil)
            
            
    }
    
   
    
    
}
    func openLoginVC() {
        if let navCon = storyboard?.instantiateViewController(identifier: "LoginIdentifier") as? LoginViewController{
            
            
            navCon.modalPresentationStyle = .fullScreen
            navCon.modalTransitionStyle = .crossDissolve
            
            present(navCon, animated: true, completion: nil)
    }
    }

}
