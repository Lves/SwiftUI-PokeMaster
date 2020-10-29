//
//  AppState.swift
//  PokeMaster
//
//  Created by LvesLi on 2020/10/23.
//

import Foundation

struct AppState {
    var settings = Settings()
}

extension AppState {
    struct Settings {
        enum AccountBehavior: CaseIterable {
            case register, login
        }
        
        enum Sorting:Int, CaseIterable {
            case id, name, color, favorite
        }
        
        var accountBehavior = AccountBehavior.login
        var email = ""
        var password = ""
        var verifyPassword = ""
        @Storage(name: "showEnglishName", defaultValue: false)
        var showEnglishName: Bool
        var sorting: Sorting = .id
        @Storage(name: "showFavoriteOnly", defaultValue: false)
        var showFavoriteOnly: Bool
        var loginRequesting: Bool = false
        var loginError: AppError?
        @FileStorage(directory: .documentDirectory, fileName: "user.json")
        var loginUser: User?
        
    }
}
extension AppState.Settings.Sorting {
    var text: String {
        switch self {
        case .id: return "ID"
        case .name: return "名字"
        case .color: return "颜色"
        case .favorite: return "最爱"
        }
    }
}

extension AppState.Settings.AccountBehavior {
    var text: String {
        switch self {
        case .register: return "注册"
        case .login: return "登录"
        }
    }
}
