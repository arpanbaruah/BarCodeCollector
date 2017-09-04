//
//  ViewController.swift
//  BarCodeCollector
//
//  Created by ARPAN BARUAH on 8/31/17.
//  Copyright © 2017 ARPAN BARUAH. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,
                        UITableViewDelegate{
    
    var games: [Game] = []
    
    @IBAction func addTapped(_ sender: Any) {
    }

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as!
            AppDelegate).persistentContainer.viewContext
        do {
            try games =  context.fetch(Game.fetchRequest())
            tableView.reloadData()
            
        } catch  {
            
        }
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let game = games[indexPath.row]
        cell.textLabel?.text = game.textlabel
        cell.imageView?.image = UIImage(data : game.image! as Data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let game = games[indexPath.row]
        performSegue(withIdentifier: "showGame", sender: game)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! AddImageViewController
        nextVC.game = sender as? Game
    }
    
    

}

