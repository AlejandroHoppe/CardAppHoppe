//
//  PerfilEditarViewController.swift
//  CardAppFinal
//
//  Created by APPS2T on 9/2/22.
//

import UIKit

class PerfilEditarViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var nombre: UITextField!
    @IBOutlet var contraseña: UITextField!
    @IBOutlet var descripcion: UITextField!
    @IBOutlet var telefono: UITextField!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var elegirButton: UIButton!
    @IBOutlet weak var confirmarButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    let saveUser = UserDefaults.standard
    
    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        elegirButton.layer.cornerRadius = 15
        confirmarButton.layer.cornerRadius = 15
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            if let imageSave = UserDefaults.standard.object(forKey: "imagenSave") as? Data{
                let image = UIImage(data: imageSave)
                self.userImageView.image = image
        
            }
            if let nombreSave = self.saveUser.string(forKey: "nombreSave"){
                self.nombre.text = nombreSave
            }
            if let contraseñaSave = self.saveUser.string(forKey: "contraseñaSave"){
                self.contraseña.text = contraseñaSave
            }
            if let descripcionSave = self.saveUser.string(forKey: "descripcionSave"){
                self.descripcion.text = descripcionSave
            }

            if let telefonoSave = self.saveUser.string(forKey: "telefonoSave"){
                self.telefono.text = telefonoSave
            }
            
            self.userImageView.layer.cornerRadius = self.userImageView.frame.height / 2.0
            self.userImageView.layer.borderWidth = 4.0
            self.userImageView.layer.borderColor = #colorLiteral(red: 1, green: 0.8057073951, blue: 0, alpha: 1)
        }
       
        
      
        
        
        //INTEGER
        /*if let telefonoSave = saveUser.integer(forKey: "telefonoSave"){
            telefono.text = telefonoSave
        }*/
    }
    
    @IBAction func confirmarCambiosButton(_ sender: Any) {
        
        DispatchQueue.main.async {
            let imagenSave = self.userImageView.image
        if imagenSave != nil{
            self.saveUser.set(imagenSave?.pngData(), forKey: "imagenSave")
        }
        
            let nombreSave = self.nombre.text
        if nombreSave != nil{
            self.saveUser.set(nombreSave, forKey: "nombreSave")
        }

            let contraseñaSave = self.contraseña.text
        if contraseñaSave != nil{
            self.saveUser.set(contraseñaSave, forKey: "contraseñaSave")
        }
        
        
            let descripcionSave = self.descripcion.text
        if descripcionSave != nil{

            self.saveUser.set(descripcionSave, forKey: "descripcionSave")
        }
        
            let telefonoSave = self.telefono.text
        if telefonoSave != nil{

            self.saveUser.set(telefonoSave, forKey: "telefonoSave")
        }
            self.dismiss(animated: true, completion: nil)
    }
}
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonElegir() {

        
        let alertController = UIAlertController(title: "Seleccione una opción", message: "para seleccionar una foto", preferredStyle: .actionSheet)
    
        
        let galeriaAction = UIAlertAction(title: "Galeria", style: .default){
            action in
            
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                print("Galeria pulsada")

                self.imagePicker.delegate = self
                self.imagePicker.sourceType = .photoLibrary
                self.imagePicker.allowsEditing = false

                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
        
        let camaraAction = UIAlertAction(title: "Cámara", style: .default) {
            action in
            
                print("Camara pulsada")

                self.imagePicker.delegate = self
                self.imagePicker.sourceType = .camera
            
                self.present(self.imagePicker, animated: true)
            
            }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) {
            action in }
        
        alertController.addAction(camaraAction)
        alertController.addAction(cancelAction)
        alertController.addAction(galeriaAction)

        self.present(alertController, animated: true, completion: nil)
        }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        self.dismiss(animated: true, completion: { () -> Void in

        })
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else{
            return
        }
        
        print("He clickado imagen")
        userImageView.image = image
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
    
}
