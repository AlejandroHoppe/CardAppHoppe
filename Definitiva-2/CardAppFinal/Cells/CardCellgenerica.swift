import UIKit

/*protocol DataCollectionProtocol {
    func deleteData(indx: Int)
}*/
class CardCellgenerica: UICollectionViewCell{
    
    var card: Carta?{
        didSet { renderUI() }
    }
    
    var index: IndexPath?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var lenguageFlag: UIImageView!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var imageUrl: UIImageView!
    
//  var delegate: DataCollectionProtocol?
    
    
   
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    private func renderUI(){
        guard let card = card else { return }
    
        name.text = card.name
        price.text = "$\(card.price)"
        state.text = card.state
        lenguageFlag.image = UIImage(named: card.lang)
        imageUrl.image = UIImage(named: card.imageURL)
        
        
    }
    

}
