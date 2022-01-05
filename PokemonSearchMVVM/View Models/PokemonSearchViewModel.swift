//
//  PokemonSearchViewModel.swift
//  PokemonSearchMVVM
//
//  Created by IwasakIYuta on 2022/1/5.
//

import Foundation

class AddPokemonViewModel {
  
    func addPokemon(for id: String, completion: @escaping (PokemonViewModel) -> Void) {
    

        let pokemonURL = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)")
//let weatherResource = Resource<WeatherResponse>(url: weatherURL,parse: (Data) -> T?)
            let pokemonResource = Resource<PokemonResponse>(url: pokemonURL!) { data in
            let pokemonResponse = try? JSONDecoder().decode(PokemonResponse.self, from: data)
            return pokemonResponse
        }
        
       //JSON形式をエンコードするswiftに変更する処理をする
        
        Webservice().load(resource: pokemonResource) { (result) in

            if let pokemonResource = result {
              //ここで単一のPokemonViewModelをListTableViewに渡して表示させる
                let vm = PokemonViewModel(pokemon: pokemonResource)
                completion(vm)
            }

        }
        
    }
}
