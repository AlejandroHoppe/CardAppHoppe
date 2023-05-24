import UIKit

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    let saveUser = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.layer.cornerRadius = 15
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        if let navCon = storyboard?.instantiateViewController(identifier: "LoginIdentifier") as? LoginViewController{
            
            
            navCon.modalPresentationStyle = .fullScreen
            navCon.modalTransitionStyle = .flipHorizontal
            
            present(navCon, animated: true, completion: nil)
    
        }
    
  }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        

            guard let nombre = userTextField.text, !nombre.isEmpty else {
                let alertController = UIAlertController(title: "Rellene el campo de usuario", message: "",  preferredStyle: .actionSheet)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
                return
            }
        guard let correo = emailTextField.text, !correo.isEmpty else {
            let alertController = UIAlertController(title: "Rellene el campo de correo ", message: "",  preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
            guard let contraseña = passwordTextField.text, !contraseña.isEmpty else {
                let alertController = UIAlertController(title: "Rellene el campo de contraseña", message: "",  preferredStyle: .actionSheet)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
                return
            }
            
            guard let repetirContraseña = confirmPassTextField.text, !repetirContraseña.isEmpty else {
                let alertController = UIAlertController(title: "Rellene el campo de repetir contraseña", message: "",  preferredStyle: .actionSheet)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
                return
            }
            
            if contraseña != repetirContraseña{
                let alertController = UIAlertController(title: "Las contraseñas no coinciden", message: "",  preferredStyle: .actionSheet)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
                return
                
            }
            

            if nombre.isEmpty == false && contraseña.isEmpty == false && repetirContraseña.isEmpty == false && contraseña == repetirContraseña{
                print("funciona el registro")
                
                let nombreSave = self.userTextField.text
                if nombreSave != nil{
                    self.saveUser.set(nombreSave, forKey: "nombreSave")
                }

                let contraseñaSave = self.passwordTextField.text
                if contraseñaSave != nil{
                    self.saveUser.set(contraseñaSave, forKey: "contraseñaSave")
                }
                
                let correoSave = self.emailTextField.text
                if correoSave != nil{
                    self.saveUser.set(correoSave, forKey: "correoSave")
                }
                
                let telefonoSave = self.phoneTextField.text
                if telefonoSave != nil{

                    self.saveUser.set(telefonoSave, forKey: "telefonoSave")
                }
                self.openHomeVC()
            
                
            }
            
            
        
    
  }
    
    func openHomeVC() {
        if let navCon = storyboard?.instantiateViewController(identifier: "TapBarIdentifier") as? UITabBarController{
            
            
            navCon.modalPresentationStyle = .fullScreen
            navCon.modalTransitionStyle = .crossDissolve
            
            present(navCon, animated: true, completion: nil)
    }
    }
    
    

}
 
