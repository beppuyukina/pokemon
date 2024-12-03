//
//  ContentView.swift
//  Pokemon
//
//  Created by  beppu yukina on 2024/11/25.
//

import SwiftUI
import Foundation

struct ContentView: View {
    //初期化
    @StateObject var pokemonData = PokemonData()
    
    
    //    var i = 0
    var body: some View {
        
        NavigationStack {
        
        //        NavigationView {
        //
        //            NavigationLink(destination: NavigationView()) {
        
        //        if let url = URL(string: urlString) {
        //
        //        }
        
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                
                
                
                ForEach(0..<pokemonData.pokemonList.count, id: \.self) { i in
                    
                    
                        
                        ZStack {
                            
                            
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                            
                            Rectangle()
                                .foregroundColor(.red)
                                .frame(width: 300, height: 100)
                                .position(x: 50, y: 50)
                                .clipShape(Circle())
                            
                            VStack {
                                //配列アクセス方法　1番目はこれ。。。何番目のID
//                                Text("\(pokemonData.pokemonList[i].id)")
//                                    .font(.body)
//                                    .foregroundColor(.black)
//                                
//                                
//                                Text("\(pokemonData.pokemonList[i].name)")
//                                    .font(.body)
//                                    .foregroundColor(.black)
                                
                                NavigationLink {
                                    NaviView(NaviPoke: pokemonData.pokemonList[i])
                                }label: {
                                    let url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(i+1).png"
                                    AsyncImage(url: URL(string: url))
                                    
                                }
                            }
                        }
                        
                        .overlay{
                            Circle()
                                .stroke(Color.black, lineWidth: 1)
                                .frame(width:200, height:200)
                            
                            
                        }
                    }
                    
        
                }
            }
            
        }
    }
    
}
