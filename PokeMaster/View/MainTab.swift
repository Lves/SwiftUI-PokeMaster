//
//  MainTab.swift
//  PokeMaster
//
//  Created by LvesLi on 2020/10/23.
//

import SwiftUI

struct MainTab: View {
    var body: some View {
            TabView {
                pokemonRootView
                settingRootView
            }
    }
    
    var pokemonRootView: some View {
        NavigationView {
            PokemonList()
                .navigationBarTitle(Text("宝可梦列表"))
                .navigationBarTitleDisplayMode(.inline)
        }
        .tabItem {
            Image(systemName: "list.bullet.below.rectangle")
            Text("列表")
        }
    }
    
    var settingRootView: some View {
        NavigationView {
            SettingView()
                .navigationBarTitle(Text("设置"))
                .navigationBarTitleDisplayMode(.inline)
        }
        .tabItem {
            Image(systemName: "gear")
            Text("设置")
        }
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
    }
}
