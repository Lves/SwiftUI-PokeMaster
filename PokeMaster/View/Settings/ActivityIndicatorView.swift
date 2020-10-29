//
//  ActivityIndicatorView.swift
//  PokeMaster
//
//  Created by LvesLi on 2020/10/29.
//

import Foundation
import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    @Binding var isAnimation: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView()
        view.tintColor = .black
        view.backgroundColor = .clear
        view.startAnimating()
        return view
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if isAnimation {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}
