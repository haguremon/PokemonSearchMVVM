//
//  PokemonSearchViewController.swift
//  PokemonSearchMVVM
//
//  Created by IwasakIYuta on 2022/1/5.

import UIKit

class PokemonSearchViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func searchButtonPressed() {
        
        
    }
    
    @IBAction func close(_ sender: UIBarButtonItem) {
    
        dismiss(animated: true, completion: nil)
    
    }
    


}

