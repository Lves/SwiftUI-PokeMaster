//
//  AppCommand.swift
//  PokeMaster
//
//  Created by LvesLi on 2020/10/27.
//

import Foundation
import Combine

protocol AppCommand {
    func execute(in store: Store) -> AnyCancellable
}

struct LoginAppCommand: AppCommand {
    let email: String
    let password: String
    
    
    func execute(in store: Store) -> AnyCancellable {
         return LoginRequest(email: email, password: password)
            .publisher
            .sink(receiveCompletion: { complete in
                if case .failure(let error) = complete {
                    store.dispatch(.accountBehaviorDone(result: .failure(error)))
                }
            }, receiveValue: { (user) in
                store.dispatch(.accountBehaviorDone(result: .success(user)))
            })
    }
}
