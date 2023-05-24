import UIKit

protocol DataCollectionProtocol {
    func optionButtonTapped(on card: Carta)
}

class CardCell: UICollectionViewCell {
    
    var card: Carta? {
        didSet { renderUI() }
    }
    
    var delegate: DataCollectionProtocol?
    
    @IBOutlet var name: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var imageURL: UIImageView!
    @IBOutlet var button: UIButton!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var flag: UIImageView!

    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func renderUI() {
        guard let card = card else { return }
    
        name.text = card.name
        price.text = "$\(card.price)"
        flag.image = UIImage(named: card.lang)
        state.text = card.state
        imageURL.image = UIImage(named: card.imageURL)
        button.layer.borderWidth = 4.0
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
    
    @IBAction func optionsButtonTapped(sender: Any) {
        guard let card = card else { return }
        delegate?.optionButtonTapped(on: card)
    }
    
}





