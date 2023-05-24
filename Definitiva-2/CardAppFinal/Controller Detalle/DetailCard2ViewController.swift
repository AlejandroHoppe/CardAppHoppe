import UIKit

class DetailCard2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var card: [Carta]?
    var oferta: [Oferta]?
    
    
    
    @IBOutlet weak var TableViewDetailCard: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableViewDetailCard.dataSource = self
        TableViewDetailCard.delegate = self


    }
  
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockData.shared.ofertas.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCardCellID", for: indexPath) as? DetailCardCell {
            cell.oferta = MockData.shared.ofertas[indexPath.row]
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Se pulso \(MockData.shared.ofertas[indexPath.row].name)")
        tableView.deselectRow(at: indexPath, animated: true)
        
        let alertController = UIAlertController(title: "¿Quiere comprar esta carta?", message: "Eliga una opción", preferredStyle: .actionSheet)
        
        let siAction = UIAlertAction(title: "No", style: .destructive) {
            action in}
        
        let noAction = UIAlertAction(title: "Si", style: .default) {
            action in
            
            /*if let listaVendidosVC = self.storyboard?.instantiateViewController(identifier: "PerfilAjenoViewController") {
                // Pasamos parámetros a listaVendidosVC
                self.present(listaVendidosVC, animated: true, completion: nil)*/
            
            let alertController2 = UIAlertController(title: "Correo   \(MockData.shared.personas[indexPath.row].email)", message: "Telefono   \(MockData.shared.personas[indexPath.row].telefono)",  preferredStyle: .actionSheet)
            alertController2.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController2, animated: true, completion: nil)
            
        }
            
        
        
        
        alertController.addAction(siAction)
        alertController.addAction(noAction)
        
        self.present(alertController, animated: true, completion: nil)
        //performSegue(withIdentifier: "ToPerfilAjeno", sender: MockData.shared.ofertas[indexPath.row])
    }
 
    
    
    @IBAction func buttonReturntCard(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
