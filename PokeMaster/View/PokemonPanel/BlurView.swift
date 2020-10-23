//
//  BlurView.swift
//  PokeMaster
//
//  Created by LvesLi on 2020/10/22.
//

import SwiftUI
import UIKit

struct BlurView: UIViewRepresentable {
    @Binding var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
//        let view = UIView(frame: .zero)
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(blurView)
//        NSLayoutConstraint.activate([
//            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
//            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
//        ])
        return blurView
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

extension View {
    func blurBackground(style: Binding<UIBlurEffect.Style>) -> some View {
        ZStack {
            BlurView(style: style)
            self
        }
    }
}

