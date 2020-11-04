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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.originalTitleLabel.text = self.tvShow?.originalName
        
        self.tvShow?.genreIDS?.forEach({
            
            self.genresNameLabel.text = (self.getGenre(id: $0))
            print(self.getGenre(id: $0))
        })
        
          overViewLabel.text = self.tvShow?.overview
          voteAverageLabel.text = "\(self.tvShow!.voteCount)"
        
        
          voteCounteLabel.text = "\(self.tvShow!.popularity)"
         
        
        var path = "https://image.tmdb.org/t/p/w500/\(self.tvShow?.backdropPath)"
         
        path = "https://image.tmdb.org/t/p/w500//58PON1OrnBiX6CqEHgeWKVwrCn6.jpg"
        print(self.tvShow?.posterPath)
          let url = URL(string:path)
          let data = try? Data(contentsOf: url!)
          let image: UIImage = UIImage(data: data!)!
          posterImage.image = image
    }
    
    func getGenre(id: Int) -> String {
        return Service.shared.genres.first(where: { $0.id == id})?.name ?? String()
    }
    
}
