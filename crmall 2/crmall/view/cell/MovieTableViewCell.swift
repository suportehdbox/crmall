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

    
    var tvShow: TVShow?
    var genres: [Genre]?
    
    func setup(tvShow: TVShow) {
        self.originalTitleLabel.text = tvShow.name
        
        self.tvShow?.genreIDS?.forEach({
                  self.genreNameLabel.text = (self.getGenre(id: $0))
                  print(self.getGenre(id: $0))
              })
        
        sinopseLabel.text = self.tvShow?.overview
        voteAvaregeLabel.text = "\(self.tvShow?.voteAverage)"
        
        voteCountLabel.text = "\(self.tvShow?.popularity)"
        
        /*
        var path = "https://image.tmdb.org/t/p/w500/\(self.tvShow?.backdropPath)"
         
        path = "https://image.tmdb.org/t/p/w500//58PON1OrnBiX6CqEHgeWKVwrCn6.jpg"
        print(self.tvShow?.posterPath)
          let url = URL(string:path)
          let data = try? Data(contentsOf: url!)
          let image: UIImage = UIImage(data: data!)!
          posterImage.image = image
        */
        
    }
    
    func getGenre(id: Int) -> String {
          return Service.shared.genres.first(where: { $0.id == id})?.name ?? String()
      }
    
}
