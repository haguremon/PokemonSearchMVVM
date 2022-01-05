//
//  PokemonTableViewCell.swift
//  PokemonSearchMVVM
//
// Created by IwasakIYuta on 2022/1/5.
//

import UIKit
import SDWebImage

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var imagenmaeLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var searchImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configure(_ vm: PokemonViewModel) {
        self.imagenmaeLabel.text = vm.name
        searchImage.sd_setImage(with: vm.pokemonImageUrl, completed: nil)
        typeLabel.text = vm.types
    }

}
