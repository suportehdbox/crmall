//
//  DetailViewController.swift
//  crmall
//
//  Created by Marcio on 30/10/20.
//  Copyright © 2020 Marcio. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var genresNameLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var voteCounteLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    var tvShow: TVShow?
    var genres: [Genre]?
    var img : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let tvShow = self.tvShow else { return }
        self.originalTitleLabel.text = tvShow.originalName
        self.genresNameLabel.text = String()
        if let genreIDS = tvShow.genreIDS {
            for (index, tvShow) in genreIDS.enumerated() {
                self.genresNameLabel.text?.append(self.getGenre(id: tvShow))
                if index != genreIDS.count - 1 {
                    self.genresNameLabel.text?.append(", ")
                }
            }
        }
        overViewLabel.text = tvShow.overview
        voteAverageLabel.text = "\(tvShow.voteCount)"
        voteCounteLabel.text = "\(tvShow.popularity)"
       
        
        /*
        if let img = self.img {
            self.posterImage.image = img
            
        }
        */
        
        
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
