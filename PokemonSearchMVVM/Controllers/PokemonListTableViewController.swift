//
//  PokemonListTableViewController.swift
//  PokemonSearchMVVM
//
//  Created by IwasakIYuta on 2022/1/5.
//

import UIKit

class PokemonListTableViewController: UITableViewController {

    private var pokemonListViewModel = PokemonListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        pokemonListViewModel.numberOfRows(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonTableViewCell
        
        let pokemonVM = pokemonListViewModel.modelAt(indexPath.row)
        cell.configure(pokemonVM)
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

}


extension PokemonListTableViewController: AddPokemonDelegate {
    //ここで表示させる
    func addPokemonDidSave(vm: PokemonViewModel) {
        pokemonListViewModel.addPokemonViewModel(vm)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
        if segue.identifier == "PokemonSearchViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        }
        
    }
    
    func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
 
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
 
        guard let pokemonSearchViewController = nav.viewControllers.first as? PokemonSearchViewController else {
            fatalError("PokemonSearchViewController not found")
        }
        
        pokemonSearchViewController.delegate = self
    }
    
}

