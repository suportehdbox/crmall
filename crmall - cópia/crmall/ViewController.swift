//
//  ViewController.swift
//  crmall
//
//  Created by Marcio on 29/10/20.
//  Copyright © 2020 Marcio. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DataSource.dataSourceCode.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 237
    }
    
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
         
         let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell;
                       
        cell.originalTitleLabel.text =  DataSource.dataSourceCode[indexPath.row][0]
        cell.genreNameLabel.text =  DataSource.dataSourceCode[indexPath.row][1]
        cell.sinopseLabel.text =  DataSource.dataSourceCode[indexPath.row][2]
        cell.voteAvaregeLabel.text =  DataSource.dataSourceCode[indexPath.row][4]
        cell.voteCountLabel.text =  DataSource.dataSourceCode[indexPath.row][5]
            
        
        var path = "https://image.tmdb.org/t/p/w500/"+DataSource.dataSourceCode[indexPath.row][3]
        
        print(path)
        
        
        let url = URL(string:(path))
        let data = try? Data(contentsOf: url!)
        let image: UIImage = UIImage(data: data!)!
         
         
        cell.posterImage.image = image
        
         
        
         return cell
         
        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                  tableView.deselectRow(at: indexPath, animated: true)
        
        
        Variables.originalTitle = DataSource.dataSourceCode[indexPath.row][0]
        Variables.genresName = DataSource.dataSourceCode[indexPath.row][1]
        Variables.overview = DataSource.dataSourceCode[indexPath.row][2]
        Variables.posterPath = DataSource.dataSourceCode[indexPath.row][3]
        Variables.voteAverage = DataSource.dataSourceCode[indexPath.row][4]
        Variables.voteCount = DataSource.dataSourceCode[indexPath.row][5]

        
        
         let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
             let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
             self.present(newViewController, animated: true, completion: nil)
    
        
        
    }
    
    
           

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Service.init()
        consomeJSON()
    }

    

      func consomeJSON() {
           
        
         
        DispatchQueue.global(qos: .userInitiated).async {
                          
            let urlConsome = "https://api.themoviedb.org/3/movie/550?api_key=e192829e986f423c338f524f0e725287&language=pt-BR"

                          print(urlConsome)
                          


            guard let url = URL(string:urlConsome ) else {return}
                          
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let dataResponse = data,
                    error == nil else {
                        print(error?.localizedDescription ?? "Response Error")
                        return }
                              
                              
                do {

                    let data = try? JSONDecoder().decode(Movie.self, from: dataResponse)

                                  //let counter = data!.cards.count
                                                               
                    DataSource.dataSourceCode.removeAll()
                                                               
                                                               
                                  //for i in 0..<counter {

                    var row = [String]()
                                         
                                      /*
                                      row.append(data!.cards[i].name)
                                      row.append(data!.cards[i].cardNumber)
                                      row.append(String(data!.cards[i].limit))
                                      */
                    // Título, Gêneros, Sinopse, Image do poster, Média de avaliação, Quatidade de avaliações;
                    
                    row.append(data!.originalTitle)
                    row.append(data!.genres[0].name)
                    row.append(data!.overview)
                    row.append(data!.posterPath)
                    row.append(String(data!.voteAverage))
                    row.append(String(data!.voteCount))
                    
                    
                    
                    
                    DataSource.dataSourceCode.append(row)
                                                                   
                                  //}



                    print(DataSource.dataSourceCode)
                    print("total \(DataSource.dataSourceCode.count)")
                                
                    DispatchQueue.main.async {
                                    
                                    self.tableView.reloadData()
                                             
                                      
                    }
                                  
                }
            }
            
            task.resume()
        }
                   
    }
             
        
    }



