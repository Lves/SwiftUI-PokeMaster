//
//  AppError.swift
//  PokeMaster
//
//  Created by LvesLi on 2020/10/27.
//

import Foundation

enum AppError: Error, Identifiable {
    var id: String { localizedDescription }
    case passwordWrong
}

extension AppError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .passwordWrong: return "密码错误"
        }
    }
}
