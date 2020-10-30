//
//  MovieTableViewCell.swift
//  crmall
//
//  Created by Marcio on 29/10/20.
//  Copyright © 2020 Marcio. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    @IBOutlet weak var originalTitleLabel: UILabel!
    
    @IBOutlet weak var genreNameLabel: UILabel!
        
    @IBOutlet weak var sinopseLabel: UILabel!
    
    @IBOutlet weak var voteAvaregeLabel: UILabel!
        
    @IBOutlet weak var voteCountLabel: UILabel!
    
    
    @IBOutlet weak var posterImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
