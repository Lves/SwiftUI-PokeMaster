//
//  PokemonInfoPanel.swift
//  PokeMaster
//
//  Created by LvesLi on 2020/10/22.
//

import SwiftUI

struct PokemonInfoPanel: View {
    let model: PokemonViewModel
    @State var style: UIBlurEffect.Style = .systemMaterial
    
    var abilities: [AbilityViewModel] {
        AbilityViewModel.sample(pokemonID: model.id)
    }
    
    var topIndicator: some View {
        RoundedRectangle(cornerRadius: 3)
            .frame(width: 40, height: 6)
            .opacity(0.2)
    }
    
    var pokemonDescription: some View {
        Text(model.descriptionText)
            .font(.callout)
            .foregroundColor(Color(hex: 0x666666)) .fixedSize(horizontal: false, vertical: true)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                if style == .systemMaterial {
                    style = .systemMaterialDark
                } else {
                    style = .systemMaterial
                }
            }) {
                Text("切换模糊效果")
            }
            topIndicator
            Header(model: model)
            pokemonDescription
            Divider()
            AbilityList(model: model, abilityModels: abilities)
        }
        .padding(
            EdgeInsets(
            top: 12,
            leading: 30,
            bottom: 30,
            trailing: 30)
        )
//        .background(Color.white)
        .blurBackground(style: $style)
        .cornerRadius(20)
        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
    

}

extension PokemonInfoPanel {
    struct Header: View {
        let model: PokemonViewModel
        var body: some View {
            HStack(spacing: 18) {
                pokemonIcon
                nameSpecies
                Rectangle()
                    .frame(width: 1, height: 44)
                    .foregroundColor(Color(hex: 0x000000, alpha: 0.1))
                bodyStatus
            }
        }
        
        var pokemonIcon: some View {
            Image("Pokemon-\(model.id)")
                .resizable()
                .frame(width: 68, height: 68)
        }
        var nameSpecies: some View {
            VStack {
                Text(model.name)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(model.color)
                Text(model.nameEN)
                    .font(.system(size: 13, weight: .bold))
                    .padding(.bottom, 10)
                    .foregroundColor(model.color)
                Text(model.genus)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.gray)
                
            }
        }
        var bodyStatus: some View {
            VStack {
                //
                VStack(alignment: .leading) {
                    HStack{
                        Text("身高")
                            .font(.system(size: 11))
                            .foregroundColor(.gray)
                        Text(model.height)
                            .font(.system(size: 11))
                            .foregroundColor(model.color)
                    }
                    HStack{
                        Text("体重")
                            .font(.system(size: 11))
                            .foregroundColor(.gray)
                        Text(model.weight)
                            .font(.system(size: 11))
                            .foregroundColor(model.color)
                    }
                }
                // types
                HStack {
                    ForEach(model.types) { t in
                        ZStack {
                            RoundedRectangle(cornerRadius: 7)
                                .frame(width: 36, height: 14)
                                .foregroundColor(t.color)
                            Text(t.name)
                                .font(.system(size: 11))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
}

struct PokemonInfoPanel_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoPanel(model: PokemonViewModel.sample(id: 1))
    }
}
