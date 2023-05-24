//
//  VaciosViewController.swift
//  CardAppFinal
//
//  Created by Cesar Martinez on 20/2/22.
//
import UIKit

class SearchResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var backButton: UIButton!
    
    var card: Carta?
    var collectionDeck: [Carta] = []
    var collectionUser: [Carta] = []
    
    var deckPokemon: [Carta] = MockData.shared.loadCardPokemon()
    var deckYugi: [Carta] =  MockData.shared.loadCardYugi()
    var deckMagic: [Carta] = MockData.shared.loadCardMagic()
    private var selectedDeck = 0
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return collectionDeck.count
        return collectionDeck.count
    }
    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath) as? SearchCell {
            
            cell.card = collectionDeck[indexPath.row]
            return cell
        }
        else {
            return UITableViewCell()
        }
    }

    
  
    
    
    
    @IBAction func backButtonTapped( sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    
}
