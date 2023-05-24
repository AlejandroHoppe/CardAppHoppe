import UIKit

/*protocol DataCollectionProtocol {
    func deleteData(indx: Int)
}*/
class PersonasCell: UITableViewCell{
    
    var persona: Persona?{
        didSet { renderUI() }
    }
    
    @IBOutlet var nombre: UILabel!
    @IBOutlet var imagen: UIImageView!
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    private func renderUI(){
        guard let persona = persona else { return }
    
        nombre.text = persona.nombre
        
        imagen.image = UIImage(named: persona.imagen)
        
        
    }
    

}
