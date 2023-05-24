
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    let saveUser = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 20
        
        
    }

    @IBAction func registerButtonTapped(_ sender: Any) {
        
        if let navCon = storyboard?.instantiateViewController(identifier: "RegisterIdentifier") as? RegisterViewController{
            
            
            navCon.modalPresentationStyle = .fullScreen
            navCon.modalTransitionStyle = .flipHorizontal
            
            present(navCon, animated: true, completion: nil)
           
          
    
        }
   }
    
    @IBAction func loginButtonTapped( sender: Any){
        
        
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
        
        if correo != saveUser.string(forKey: "correoSave"){
            let alertController = UIAlertController(title: "No existe usuario", message: "",  preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        if correo == saveUser.string(forKey: "correoSave") && contraseña != saveUser.string(forKey: "contraseñaSave"){
            let alertController = UIAlertController(title: "Contraseña incorrecta", message: "",  preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
        }


        

        if correo.isEmpty == false && contraseña.isEmpty == false && correo == saveUser.string(forKey: "correoSave") && contraseña == saveUser.string(forKey: "contraseñaSave"){
            print("funciona el registro")
            
            let correoSave = self.emailTextField.text
            if correoSave != nil{
                self.saveUser.set(correoSave, forKey: "correoSave")
            }

            let contraseñaSave = self.passwordTextField.text
            if contraseñaSave != nil{
                self.saveUser.set(contraseñaSave, forKey: "contraseñaSave")
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
