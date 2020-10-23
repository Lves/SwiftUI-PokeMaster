//
//  PokemonList.swift
//  PokeMaster
//
//  Created by LvesLi on 2020/10/22.
//

import SwiftUI

struct PokemonList: View {
    @State var expandingIndex: Int?
    @State var searchKey: String = ""
    var body: some View {
        ScrollView() {
            TextField("搜索", text: $searchKey)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
            ForEach(PokemonViewModel.all) { pokemon in
                PokemonInfoRow(model: pokemon, expanded: self.expandingIndex == pokemon.id)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .onTapGesture{
                        if self.expandingIndex == pokemon.id {
                            self.expandingIndex = nil
                        } else {
                            self.expandingIndex = pokemon.id
                        }
                    }
            }
        }
        .onAppear(){
            UITableView.appearance().separatorStyle = .none
        }
//        .overlay(
//            VStack {
//                    Spacer()
//            PokemonInfoPanel(model: .sample(id: 1)) }.edgesIgnoringSafeArea(.bottom)
//        )
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
