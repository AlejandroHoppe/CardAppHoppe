import UIKit

class DetailCardCell: UITableViewCell {
    
    
    var oferta: Oferta? {
        didSet { renderUI() }
    }
    
    /*var carta: Carta? {
        didSet { renderUI() }
    }*/
    static let identifier = "DetailCardCellID"
    
    var delegate: DataCollectionProtocol?
    
    @IBOutlet var name: UILabel!
    @IBOutlet var situationCard: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var nameButton: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
   private func renderUI() {
        guard let oferta = oferta else { return }
        
        name.text = oferta.name
        situationCard.text = oferta.state
        price.text = "$" + String(oferta.price)
        
        
        
    }
    
   /* private func renderUI() {
         guard let carta = carta else { return }
         
        name.text = carta.vendedor
         situationCard.text = carta.state
         price.text = String(carta.price)
     }*/
}
