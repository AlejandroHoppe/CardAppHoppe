import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var imageGame: UIImageView!
    @IBOutlet weak var chooseGame: UISegmentedControl!
    @IBOutlet weak var searchtableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchBtn: UIButton!
    
    var card: Carta?
    var deck: [Carta] = []
    var filteredDeck  = [Carta]()
    var deckPokemon: [Carta] = MockData.shared.loadCardPokemon()
    var deckYugi: [Carta] =  MockData.shared.loadCardYugi()
    var deckMagic: [Carta] = MockData.shared.loadCardMagic()
    private var selectedDeck = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchtableView.delegate = self
        searchtableView.dataSource = self
        searchBtn.layer.cornerRadius = 15
        searchBtn.isHidden = true
        searchtableView.isHidden = true
        searchBar.delegate = self
        deck = deckPokemon
        filteredDeck = deck
        
    }
    

    @IBAction func chooseGame(_ sender: Any) {
        switch chooseGame.selectedSegmentIndex {
            case 0:
                imageGame.image = UIImage(named: "Pokémon.svg")
                deck = deckPokemon
                searchBar.text = ""
                filteredDeck.removeAll()
                searchtableView.reloadData()
            case 1:
                imageGame.image = UIImage(named: "Magic-logo.svg")
                deck = deckMagic
                searchBar.text = ""
                filteredDeck.removeAll()
                searchtableView.reloadData()
            case 2:
                imageGame.image = UIImage(named: "yu-gi-oh!.png")
                deck = deckYugi
                searchBar.text = ""
                searchtableView.reloadData()
            default:
                imageGame.image = nil
                searchBar.text = ""
                filteredDeck.removeAll()
                searchtableView.reloadData()
        }
        
    }
    
    @IBAction func searchCard(_ sender: UIButton) {
        
        /*filteredDeck = []
        filteredDeck = deck.filter({
            carta in
            //carta.name.lowercased().contains(searchText.lowercased())
            carta.name.lowercased().hasPrefix(searchText.lowercased())
        })*/
        performSegue(withIdentifier: "BusquedaToLista", sender: searchBtn)
        //FILTERED DECK BUSCAR POR AHI
        
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredDeck = []
        //AY NO SE CAMBIA LA LISTA SI NO ESCRIBO AYUDA AAA AAA AAA
    
        

        if searchText.isEmpty {
            searchtableView.isHidden = true
            filteredDeck = deck
        }
        else{
            searchtableView.isHidden = false
            filteredDeck = deck.filter({
                carta in
                carta.name.lowercased().contains(searchText.lowercased())
                //carta.name.lowercased().hasPrefix(searchText.lowercased())
            })
           
        }
        searchtableView.reloadData()
        
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDeck.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = searchtableView.dequeueReusableCell(withIdentifier: "searchid", for: indexPath) as? SearchCell {
            cell.card = filteredDeck[indexPath.row]
            return cell
        }else {
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "BusquedaToDetalle", sender: filteredDeck[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BusquedaToDetalle" {
            let carta = sender as! Carta
            let detailVC = segue.destination as! DetailCard1ViewController
            
            detailVC.card = carta        }
        if segue.identifier == "BusquedaToLista" {
            //let carta = sender as! Carta
            let resultVC = segue.destination as! SearchResultViewController
            
            //resultVC.card = carta
            
        }
    }

}
