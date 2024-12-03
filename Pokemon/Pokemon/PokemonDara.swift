//
//  PokemonDara.swift
//  Pokemon
//
//  Created by  beppu yukina on 2024/11/26.
//

import Foundation

//ポケモンの情報をまとめる構造体
struct ResultJson: Codable {
    let id : Int
    let name: String
    let sprites: ResultPokemon
  
}
struct ResultPokemon: Codable {
    let front_default: String
}

//ポケモンデータ取得クラスを定義
@MainActor
public class PokemonData:ObservableObject {
    

    
    
    //ポケデータのリスト
    @Published var pokemonList: [ResultJson] = []
    
   
    
    init()  {
        
        //メソッドを実行
        Pokemon()
    }
    
    //関数定義
    
    
    private func Pokemon() {
        for N in 1...151 {
            

            let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(N)")!
            //            print(url)
            
            Task{
                do {
                    //リクエストURLからダウンロード
                    let (data , datas) = try await URLSession.shared.data(from: url)
                    //JSONDecoderのインスタンス取得
                    let decoder = JSONDecoder()
                    //受け取ったJSONデータをパース
                    let pokemon = try decoder.decode(ResultJson.self ,from: data)
                    
                    //ポケモンリストという配列にRJ型のポケモンをくっつけた。
                    pokemonList.append(pokemon)
                    
                    //ソート、0,1は比較なので変わらぬ値。（RJ型の中の、id(Int型)）
                    pokemonList.sort{$0.id < $1.id}
                    
                    print(pokemon)
                    
                }
                
            }
            
        }
        
    }
}
