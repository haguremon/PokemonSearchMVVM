//
//  WebService.swift
//  PokemonSearchMVVM
//
//  Created by IwasakIYuta on 2021/12/15.
//

import Foundation


struct Resource<T> {
    let url: URL
    let parse: (Data) -> T? //データ型を引数にとって成功時にT失敗時にnilを返すクロージャーを作成
}
//継承とオーバーライドできない
final class Webservice {
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> () ) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let data = data {
                
                print(data)
                //通信が完了してからUIの切り替えをする
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
                
            } else {
                completion(nil)
            }
        
        }.resume()
        

    }
    
    
}
