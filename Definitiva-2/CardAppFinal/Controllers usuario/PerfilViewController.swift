//
//  PerfilViewController.swift
//  CardAppProyect
//
//  Created by APPS2T on 2/2/22.
//

import UIKit

class PerfilViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var buttonEditar: UIButton!
    @IBOutlet var buttonAjustes: UIButton!
    @IBOutlet var nameSegmentedController: UISegmentedControl!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var descripcionLabel: UILabel!
    @IBOutlet var telefonoLabel: UILabel!
    @IBOutlet var userImageView: UIImageView!
   
    var card: Carta?
    var collectionDeck: [Carta] = []
    var collectionUser: [Carta] = []
    
    var deckPokemon: [Carta] = MockData.shared.deckPokemon
    var deckYugi: [Carta] =  MockData.shared.deckYugi
    var deckMagic: [Carta] = MockData.shared.deckMagic
    
    
    
    private var selectedDeck = 0
    let saveUser = UserDefaults.standard
    
    private func index(for card: Carta) -> Int? {
        var index = 0
        for c in collectionDeck {
            if c.id == card.id { return index }
            index += 1
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonEditar.layer.cornerRadius = 15
        //DispatchQueue.main.async {
            self.collectionView?.dataSource = self
            self.collectionView?.delegate = self
            self.collectionDeck = self.deckPokemon
            self.collectionView?.reloadData()
            self.userImageView?.layer.cornerRadius = self.userImageView.frame.height / 2.0
            self.userImageView?.layer.borderWidth = 4.0
            self.userImageView?.layer.borderColor = #colorLiteral(red: 1, green: 0.8057073951, blue: 0, alpha: 1)
        //}
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        deckPokemon = MockData.shared.deckPokemon
        deckYugi =  MockData.shared.deckYugi
        deckMagic = MockData.shared.deckMagic
        
        if nameSegmentedController.selectedSegmentIndex == 0 {
            collectionDeck = deckPokemon
        }
        else if nameSegmentedController.selectedSegmentIndex == 1 {
            collectionDeck = deckMagic
        }
        else {
            collectionDeck = deckYugi
        }
        
        if let imageSave = UserDefaults.standard.object(forKey: "imagenSave") as? Data{
            let image = UIImage(data: imageSave)
            userImageView?.image = image
        }
               
        if let nombreSave = saveUser.string(forKey: "nombreSave"){
            usernameLabel?.text = nombreSave
        }
        if let descripcionSave = saveUser.string(forKey: "descripcionSave"){
            descripcionLabel?.text = descripcionSave
        }
        if let telefonoSave = saveUser.string(forKey: "telefonoSave"){
            telefonoLabel?.text = telefonoSave
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionDeck.count
        //return collectionUser.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCellId", for: indexPath) as? CardCell {
            cell.card = collectionDeck[indexPath.row]
            cell.delegate = self
            return cell
        }
        return UICollectionViewCell()
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = view.bounds
        let screenWidth: CGFloat = (screenSize.width - 12*2) - 80
        let itemWidth = screenWidth / 3.0
        let itemSize = CGSize(width: itemWidth, height: itemWidth * 350 / 240 )
        return itemSize
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        performSegue(withIdentifier: "PerfilToDetalle", sender: collectionDeck[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PerfilToDetalle" {
            let carta = sender as! Carta
            let detailVC = segue.destination as! DetailCard1ViewController
            
            detailVC.card = carta        }
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        selectedDeck = sender.selectedSegmentIndex
        switch nameSegmentedController.selectedSegmentIndex {
        case 0:
            collectionDeck = deckPokemon
            collectionView.reloadData()
            
            print("Hay esto en el array " + String(MockData.shared.collectionDeck.count))
            print("Hay esto en el array " + String(MockData.shared.loadCardYugi().count))
            //collectionDeck = deckPokemonUser
        case 1:
            collectionDeck = deckMagic
            collectionView.reloadData()
            
            //collectionDeck = deckMagicUser
        case 2:
            collectionDeck = deckYugi
            collectionView.reloadData()
            //collectionDeck = deckYugiUser
        default:
            collectionView.reloadData()
        }
    }
   
}

extension PerfilViewController: DataCollectionProtocol{
    
    func optionButtonTapped(on card: Carta) {
        openOptionsSheet(for: card)
    }
    
    
    func deleteData(indx: Int) {
        
        collectionDeck.remove(at: indx)
        print("funciona")
        collectionView.reloadData()
        
        switch selectedDeck {
        case 0:
            deckPokemon.remove(at: indx)
            
        case 1:
            deckMagic.remove(at: indx)
           
        case 2:
            deckYugi.remove(at: indx)
           
        default:
            break
        }
    }
    
    private func openOptionsSheet(for card: Carta) {
        let alertController = UIAlertController(title: "\(card.name)", message: "Seleccione una opción", preferredStyle: .actionSheet)
    
        let borrarAction = UIAlertAction(title: "Borrar", style: .destructive) {
            action in
            
            if let idx = self.index(for: card) {
                self.deleteData(indx: idx)
            }
        }
        
        let infoAction = UIAlertAction(title: "Info", style: .default) {
            action in
            
            if let listaVendidosVC = self.storyboard?.instantiateViewController(identifier: "ListaVendidosIdentifier") {
                // Pasamos parámetros a listaVendidosVC
                self.present(listaVendidosVC, animated: true, completion: nil)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) {
            action in }
        
        alertController.addAction(infoAction)
        alertController.addAction(cancelAction)
        alertController.addAction(borrarAction)
        
        //alertController.view.tintColor = .black
        self.present(alertController, animated: true, completion: nil)
    }
    
}

