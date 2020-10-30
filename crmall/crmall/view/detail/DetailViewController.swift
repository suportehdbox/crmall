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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    
        originalTitleLabel.text = Variables.originalTitle
        
        genresNameLabel.text = Variables.genresName
             
        overViewLabel.text = Variables.overview
             
         
        voteAverageLabel.text =  Variables.voteAverage
        voteCounteLabel.text = Variables.voteCount

        
              var path = "https://image.tmdb.org/t/p/w500"+Variables.posterPath
              
              print(path)
              
              
              let url = URL(string:path)
              let data = try? Data(contentsOf: url!)
              let image: UIImage = UIImage(data: data!)!
               
               
              posterImage.image = image
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
