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
        self.tvShow = tvShow
        guard let tvShow = self.tvShow else { return }
        self.originalTitleLabel.text = tvShow.name
        self.genreNameLabel.text = String()
        if let genreIDS = tvShow.genreIDS {
            for (index, tvShow) in genreIDS.enumerated() {
                self.genreNameLabel.text?.append(self.getGenre(id: tvShow))
                if index != genreIDS.count - 1 {
                    self.genreNameLabel.text?.append(", ")
                }
            }
        }
        sinopseLabel.text = tvShow.overview
        voteAvaregeLabel.text = "\(tvShow.voteCount)"
        voteCountLabel.text = "\(tvShow.popularity)"
        if let posterPath = tvShow.posterPath {
            let path = "https://image.tmdb.org/t/p/w500/\(posterPath)"
            if let url = URL(string: path),
               let data = try? Data(contentsOf: url),
               let image: UIImage = UIImage(data: data) {
                posterImage.image = image
            }
        }
    }
    
    func getGenre(id: Int) -> String {
        return Service.shared.genres.first(where: { $0.id == id})?.name ?? String()
    }
    
}
