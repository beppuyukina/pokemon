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
  
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
          ForEach(0..<pokemonData.pokemonList.count, id: \.self) { i in
            
            NavigationLink {
                NaviView(naviPoke: pokemonData.pokemonList[i])
            }label: {
            
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
                AsyncImage(url: URL(string: pokemonData.pokemonList[i].sprites.front_default))
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

