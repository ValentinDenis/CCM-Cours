//
//  CarTableViewCell.swift
//  CCM Cours
//
//  Created by Valentin Denis on 18/01/2022.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var modeleLabel: UILabel!
    
    //Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        carImageView.contentMode = .scaleAspectFill
        self.backgroundColor = .black
        carImageView.alpha = 0.5
        modeleLabel.numberOfLines = 0
        modeleLabel.textColor = .white
        modeleLabel.font = .systemFont(ofSize: 17, weight: .bold)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
