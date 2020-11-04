//
//  ViewController.swift
//  crmall
//
//  Created by Marcio on 29/10/20.
//  Copyright © 2020 Marcio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tvShows: [TVShow] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var selectedTVShow: TVShow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Service.shared.gettvShows { tvShows in
            Service.shared.getTvShowsGenres {
                self.tvShows = tvShows
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let nextViewController = segue.destination as? DetailViewController {
                nextViewController.tvShow = self.selectedTVShow
            }
        }
    }
  
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tvShows.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 237
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell
        cell.setup(tvShow: self.tvShows[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.selectedTVShow = self.tvShows[indexPath.row]
        self.performSegue(withIdentifier: "toDetail", sender: nil)
//        Variables.originalTitle = DataSource.dataSourceCode[indexPath.row][0]
//        Variables.genresName = DataSource.dataSourceCode[indexPath.row][1]
//        Variables.overview = DataSource.dataSourceCode[indexPath.row][2]
//        Variables.posterPath = DataSource.dataSourceCode[indexPath.row][3]
//        Variables.voteAverage = DataSource.dataSourceCode[indexPath.row][4]
//        Variables.voteCount = DataSource.dataSourceCode[indexPath.row][5]
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        self.present(newViewController, animated: true, completion: nil)
    }
    
}
