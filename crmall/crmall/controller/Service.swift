//
//  Service.swift
//  CooperCard
//
//  Created by Mac on 23/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class Service {

    init() {
 
        consomeJSON()
    }
    
 

    func consomeJSON() {
         
      
       
          DispatchQueue.global(qos: .userInitiated).async {
                        
            let urlConsome = "https://api.themoviedb.org/3/movie/550?api_key=e192829e986f423c338f524f0e725287"

                        


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
                                    row.append(data!.originalTitle)
                                    DataSource.dataSourceCode.append(row)
                                                                 
                                //}



                                print(DataSource.dataSourceCode)
                              
                                DispatchQueue.main.async {
                                           
                                    
                                }
                                
                            }
                        }
                        task.resume()
                            
                            
                        }
                 
               }
           
      
  }
