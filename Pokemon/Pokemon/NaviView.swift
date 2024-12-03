//
//  NavigationView.swift
//  Pokemon
//
//  Created by  beppu yukina on 2024/12/02.
//

import SwiftUI

struct NaviView: View {
    var NaviPoke : ResultJson
    
    
    var body: some View {
        VStack{
            Text("No.\(NaviPoke.id)")
                .font(.title)
                .fontWeight(.bold)
                
            AsyncImage(url: URL(string: NaviPoke.sprites.front_default)){ pokemon in
                pokemon.image?
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            
            Text("\(NaviPoke.name)")
                .fontWeight(.regular)
            

            
        }
        
    }
}
