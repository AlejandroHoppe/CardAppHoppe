//
//  SearchCell.swift
//  CardAppFinal
//
//  Created by APPS2T on 10/3/22.
//

import UIKit

class SearchCell: UITableViewCell {
    
    var card: Carta? {
        didSet { renderUI() }
    }
    
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var searchName: UILabel!
    @IBOutlet weak var searchEdition: UILabel!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func renderUI() {
        guard let card = card else { return }
        searchName.text = card.name
        searchEdition.text = card.edicion
        searchImage.image = UIImage(named: card.imageURL)
        
        
    }
}
