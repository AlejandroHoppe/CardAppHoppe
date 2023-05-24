import UIKit
class PerfilAjenoViewController: UIViewController {

    
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userImageView.layer.cornerRadius = userImageView.frame.height / 2.0
        userImageView.layer.borderWidth = 4.0
        userImageView.layer.borderColor = #colorLiteral(red: 1, green: 0.8057073951, blue: 0, alpha: 1)
        
    }


}
