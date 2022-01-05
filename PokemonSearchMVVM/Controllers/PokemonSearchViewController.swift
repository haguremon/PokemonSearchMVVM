//
//  PokemonSearchViewController.swift
//  PokemonSearchMVVM
//
//  Created by IwasakIYuta on 2022/1/5.

import UIKit

protocol AddPokemonDelegate: AnyObject {
    func addPokemonDidSave(vm: PokemonViewModel)
}

class PokemonSearchViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    private var addPokemonVM = AddPokemonViewModel()
    
    weak var delegate: AddPokemonDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func searchButtonPressed() {
        
        if let pokemon = idTextField.text {
            addPokemonVM.addPokemon(for: pokemon) { (vm) in
                //デリゲートを使ってListに伝えるようにする
                self.delegate?.addPokemonDidSave(vm: vm)
                //セーブ押したときに戻る
                self.dismiss(animated: true, completion: nil)
            
            }
        }
        
        
    }
    
    @IBAction func close(_ sender: UIBarButtonItem) {
    
        dismiss(animated: true, completion: nil)
    
    }
    


}

