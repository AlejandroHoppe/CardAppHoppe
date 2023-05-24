import UIKit
class ListaVendidosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var vendedoresTable: UITableView!
    //@IBOutlet var cerrarButton: UIButton!
    
    var persona: Persona?
    var listaPersonas: [Persona] = MockData.shared.loadPersonas()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        vendedoresTable.dataSource = self
        vendedoresTable.delegate = self
        //vendedoresTable = listaPersonas
        vendedoresTable.reloadData()
 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return MockData.shared.personas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CellPersonas", for: indexPath) as? PersonasCell {
            
            cell.persona = MockData.shared.personas[indexPath.row]
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Se pulso celda")
        tableView.deselectRow(at: indexPath, animated: true)
        let alertController = UIAlertController(title: "Correo   \(MockData.shared.personas[indexPath.row].email)", message: "Telefono   \(MockData.shared.personas[indexPath.row].telefono)",  preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }

    @IBAction func buttonReturn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    


}
