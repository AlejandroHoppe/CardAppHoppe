//
//  UpLoadCard1ViewControllar.swift
//  CardAppFinal
//
//  Created by APPS2T on 7/2/22.
//

import UIKit

class UpCard1ViewController: UIViewController, UISearchBarDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var imagenLogo: UIImageView!
    @IBOutlet weak var nameSegmentedController: UISegmentedControl!
    @IBOutlet var pickerEstado: UIPickerView!
    @IBOutlet var pickerIdioma: UIPickerView!
    @IBOutlet var searchtableView: UITableView!
    @IBOutlet var precioTextField: UITextField!
    @IBOutlet var descripcionTextField: UITextField!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var subirButton: UIButton!

    var card: Carta?
    var oferta: Oferta?
    var deck: [Carta] = []
    var collectionUser: [Carta] = []
    var filteredDeck  = [Carta]()
    var deckPokemon: [Carta] = MockData.shared.loadCardPokemon()
    var deckYugi: [Carta] =  MockData.shared.loadCardYugi()
    var deckMagic: [Carta] = MockData.shared.loadCardMagic()
    var deckPokemonUser: [Carta] = []
    var deckYugiUser: [Carta] = []
    var deckMagicUser: [Carta] = []
    var busqueda: String = "Nada"
    var precio: Double = 0.0
    private var selectedCard: Carta?
    
    private var selectedDeck = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        subirButton.layer.cornerRadius = 15
        pickerEstado.dataSource = self
        pickerEstado.delegate = self
        pickerIdioma.dataSource = self
        pickerIdioma.delegate = self
        searchtableView.delegate = self
        searchtableView.dataSource = self
        searchtableView.isHidden = true
        searchBar.delegate = self
        deck = deckPokemon
        filteredDeck = deck
    }
    struct Idioma {
        var valor: String
        
    }
    struct Estado {
        var valor: String
    }
    let opcion = [
        Estado(valor: "Nuevo"),
        Estado(valor: "Usado"),
        Estado(valor: "Seminuevo")
    ]
    let opcion2 = [
        Idioma(valor: "Español"),
        Idioma(valor: "Japonés"),
        Idioma(valor: "Inglés"),
        Idioma(valor: "Alemán"),
        Idioma(valor: "Chino"),
        Idioma(valor: "Francés"),
        Idioma(valor: "Italiano"),
        Idioma(valor: "Portugués"),
        Idioma(valor: "Ruso")
    ]
    
    @IBAction func subirButtonTapped( sender: Any){
        
        
        
        guard let precio = precioTextField.text, !precio.isEmpty else {
            let alertController = UIAlertController(title: "Rellene el campo de precio", message: "",  preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        


        if precio.isEmpty == false{
            print("funciona la subida")
            print(busqueda)
            if let navCon = storyboard?.instantiateViewController(identifier: "EsEstaCarta") as? EsEstaCartaViewController{
                
                navCon.card = selectedCard
                navCon.selectedDeck = nameSegmentedController.selectedSegmentIndex
                //navCon.card?.price = precio
                //navCon.card?.estado = opcion
                //navCon.card?.idioma = opcion2
                navCon.card?.price = Double(precio)!
                
                //navCon
                navCon.modalPresentationStyle = .fullScreen
                navCon.modalTransitionStyle = .coverVertical
                
                present(navCon, animated: true, completion: nil)
        }
    }
    }
    
    
    
 

    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        
        switch nameSegmentedController.selectedSegmentIndex {
        case 0:
            imagenLogo.image = UIImage(named: "Pokémon.svg")
            deck = deckPokemon
            //deck = deckPokemonUser
            searchBar.text = ""
            filteredDeck.removeAll()
            searchtableView.reloadData()
        case 1:
            imagenLogo.image = UIImage(named: "Magic-logo.svg")
            deck = deckMagic
            //deck = deckMagicUser
            searchBar.text = ""
            filteredDeck.removeAll()
            searchtableView.reloadData()
        case 2:
            imagenLogo.image = UIImage(named: "yu-gi-oh!.png")
            deck = deckYugi
            //deck = deckYugiUser
            searchBar.text = ""
            filteredDeck.removeAll()
            searchtableView.reloadData()
        default:
            imagenLogo.image = nil
        searchBar.text = ""
            filteredDeck.removeAll()
        searchtableView.reloadData()
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
                return opcion2.count
            } else {
                return opcion.count
            }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return "\(opcion2[row].valor)"
            } else {
                return "\(opcion[row].valor)"
            }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let idioma = opcion2[row]
            print(idioma.valor)
            } else {
                let estado = opcion[row]
                print(estado.valor)
            }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if pickerView.tag == 1 {
            return NSAttributedString(string: opcion2[row].valor, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        } else {
            return NSAttributedString(string: opcion[row].valor, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDeck.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = searchtableView.dequeueReusableCell(withIdentifier: "searchid", for: indexPath) as? SearchCell {
            cell.card = filteredDeck[indexPath.row]
            //busqueda = filteredDeck[indexPath.row]
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    //Esto para despues para subir la oferta
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if nameSegmentedController.selectedSegmentIndex == 0{
            
            selectedCard = filteredDeck[indexPath.row]
            busqueda = filteredDeck[indexPath.row].name
            searchBar.text = busqueda
        searchtableView.isHidden = true
        
        
        
        }
        if nameSegmentedController.selectedSegmentIndex == 1{
        
            selectedCard = filteredDeck[indexPath.row]
            busqueda = filteredDeck[indexPath.row].name
            searchBar.text = busqueda
        searchtableView.isHidden = true
        
        //performSegue(withIdentifier: "SubirCarta",sender: filteredDeck[indexPath.row])
        
        
    }
        if nameSegmentedController.selectedSegmentIndex == 2{
        
            selectedCard = filteredDeck[indexPath.row]
            busqueda = filteredDeck[indexPath.row].name
            searchBar.text = busqueda
        searchtableView.isHidden = true
        
        //performSegue(withIdentifier: "SubirCarta",sender: filteredDeck[indexPath.row])
        
        
    }
        
    
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        if segue.identifier == "SubirOferta" {
            let carta = sender as! Carta
            let detailVC = segue.destination as! EsEstaCartaViewController
            
            detailVC.card = carta        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        filteredDeck = []

        if searchText.isEmpty {
            searchtableView.isHidden = true
            filteredDeck = deck
        }
        else{
            searchtableView.isHidden = false
            filteredDeck = deck.filter({
                carta in
                //carta.name.lowercased().hasPrefix(searchText.lowercased())
                carta.name.lowercased().contains(searchText.lowercased())
            })
           
        }
        
        searchtableView.reloadData()
        
    
    }

}
