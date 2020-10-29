//
//  Store.swift
//  PokeMaster
//
//  Created by LvesLi on 2020/10/23.
//

import Foundation
import Combine

class Store: ObservableObject {
    @Published var appState = AppState()
    
    var anyCancel: AnyCancellable?
    
    func dispatch(_ action: AppAction) {
        #if DEBUG
        print("[ACTION]: \(action)")
        #endif
        let result = Store.reduce(state: appState, action: action)
        appState = result.0
        if let command = result.1 {
            #if DEBUG
            print("[COMMAND]: \(command)")
            #endif
            self.anyCancel = command.execute(in: self)
        }
    }
    
    static func reduce(state: AppState, action: AppAction) -> (AppState, AppCommand?) {
        var appState = state
        var appCommand: AppCommand?
        
        switch action {
        case .login(let email, let passowrd):
            guard !appState.settings.loginRequesting else {
                break
            }
            appState.settings.loginRequesting = true
            appCommand = LoginAppCommand(email: email, password: passowrd)
        case .accountBehaviorDone(result: let result):
            appState.settings.loginRequesting = false
            appState.settings.password = ""
            switch result {
            case .success(let user):
                appState.settings.loginUser = user
            case .failure(let error):
                appState.settings.loginError = error
            }
        case .logout:
            appState.settings.loginUser = nil
        }
        return (appState, appCommand)
    }
}
