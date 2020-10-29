//
//  AppAction.swift
//  PokeMaster
//
//  Created by LvesLi on 2020/10/27.
//

import Foundation

enum AppAction {
    case login(email: String, passowrd: String)
    case accountBehaviorDone(result: Result<User, AppError>)
    case logout
}
