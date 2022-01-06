//
//  PokemonListViewModel.swift
//  PokemonSearchMVVM
//
//  Created by IwasakIYuta on 2022/1/5.
//

import Foundation

class PokemonListViewModel {
    //
    private var PokemonViewModels = [PokemonViewModel]()
    
    //PokemonViewModelsにデータを追加する処理
    func addPokemonViewModel(_ vm: PokemonViewModel) {
        PokemonViewModels.append(vm)
    }
    //これでデータの数を取得
    func numberOfRows(_ section: Int) -> Int {
        return PokemonViewModels.count
    }
    //これで特定の情報の取得に成功する
    func modelAt(_ index: Int) -> PokemonViewModel {
        return PokemonViewModels[index]
    }
}

//一つのボケモンデータを作成する
class PokemonViewModel {
    
    let pokemon: PokemonResponse
    
    //初期化にPokemonResponseが必要(JSONがswiftに変更されたクラス)
    init(pokemon: PokemonResponse ) {
        
        self.pokemon = pokemon
        
    }
    //pokemonプロパティを使ってそれぞれのプロパティを作成↓
    var name: String {
        pokemon.name
    }
    
    var pokemonImageUrl: URL? {
        return URL(string: pokemon.sprites.frontDefault)
    }
    
    var types: String? {
        
        if pokemon.types.count > 1 {
            return pokemon.types.first!.type.name +  "  ,\(pokemon.types.last!.type.name)"
        }
        return pokemon.types.first?.type.name
    }
}
