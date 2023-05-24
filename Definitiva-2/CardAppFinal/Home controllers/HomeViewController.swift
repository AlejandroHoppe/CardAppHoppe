import UIKit


class HomeViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var chooseGame: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewVendidos: UICollectionView!
    @IBOutlet weak var collectionViewChollos: UICollectionView!
    @IBOutlet weak var pkmchollos: UIButton!
    @IBOutlet weak var pkmvendidos: UIButton!
    @IBOutlet weak var pkmcercanos: UIButton!
    @IBOutlet weak var magicCercanos: UIButton!
    @IBOutlet weak var magicVendidos: UIButton!
    @IBOutlet weak var magicChollos: UIButton!
    @IBOutlet weak var YugiCercanos: UIButton!
    @IBOutlet weak var YugiVendidos: UIButton!
    @IBOutlet weak var YugiChollos: UIButton!
    var card: Carta?
    var collectionDeck: [Carta] = []
    
    var deckPokemon: [Carta] = MockData.shared.loadCardPokemon()
    var deckYugi: [Carta] =  MockData.shared.loadCardYugi()
    var deckMagic: [Carta] = MockData.shared.loadCardMagic()
    
    
    
    private var selectedDeck = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionDeck = deckPokemon
        collectionView.reloadData()
        pkmchollos.isHidden = false
        pkmvendidos.isHidden = false
        pkmcercanos.isHidden = false
        magicCercanos.isHidden = true
        magicVendidos.isHidden = true
        magicChollos.isHidden = true
        YugiCercanos.isHidden = true
        YugiVendidos.isHidden = true
        YugiChollos.isHidden = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MockData.shared.loadCardPokemon().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid1", for: indexPath) as? CardCellgenerica {
            cell.card = collectionDeck[indexPath.row]
            cell.index = indexPath
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print(collectionDeck[indexPath.row].name)
        performSegue(withIdentifier: "HomeToDetalle", sender: collectionDeck[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HomeToDetalle" {
            let carta = sender as! Carta
            let detailVC = segue.destination as! DetailCard1ViewController
            
            detailVC.card = carta        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return MockData.shared.loadCardPokemon().count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid1", for: indexPath) as? CardCellgenerica {
                cell.card = collectionDeck[indexPath.row]
                cell.index = indexPath
                return cell
            }
            return UICollectionViewCell()
        }
        

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let screenSize = view.bounds
            let screenWidth: CGFloat = (screenSize.width - 12*2) - 80
            let itemWidth = screenWidth / 3.0
            let itemSize = CGSize(width: itemWidth, height: itemWidth * 350 / 240 )
            //print("Returning item size: \(itemSize)")
            return itemSize
        }
        

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0.0
        }
        
    }

    @IBAction func chooseGame(_ sender: UISegmentedControl) {
        selectedDeck = sender.selectedSegmentIndex
        switch chooseGame.selectedSegmentIndex {
        case 0:
            collectionView.reloadData()
            collectionViewVendidos.reloadData()
            collectionViewChollos.reloadData()
            collectionDeck = deckPokemon
            pkmchollos.isHidden = false
            pkmvendidos.isHidden = false
            pkmcercanos.isHidden = false
            magicCercanos.isHidden = true
            magicVendidos.isHidden = true
            magicChollos.isHidden = true
            YugiCercanos.isHidden = true
            YugiVendidos.isHidden = true
            YugiChollos.isHidden = true
        case 1:
            collectionView.reloadData()
            collectionViewVendidos.reloadData()
            collectionViewChollos.reloadData()
            collectionDeck = deckMagic
            pkmchollos.isHidden = true
            pkmvendidos.isHidden = true
            pkmcercanos.isHidden = true
            magicCercanos.isHidden = false
            magicVendidos.isHidden = false
            magicChollos.isHidden = false
            YugiCercanos.isHidden = true
            YugiVendidos.isHidden = true
            YugiChollos.isHidden = true
        case 2:
            collectionView.reloadData()
            collectionViewVendidos.reloadData()
            collectionViewChollos.reloadData()
            collectionDeck = deckYugi
            pkmchollos.isHidden = true
            pkmvendidos.isHidden = true
            pkmcercanos.isHidden = true
            magicCercanos.isHidden = true
            magicVendidos.isHidden = true
            magicChollos.isHidden = true
            YugiCercanos.isHidden = false
            YugiVendidos.isHidden = false
            YugiChollos.isHidden = false
        default:
            collectionView.reloadData()
        }
    }
}
