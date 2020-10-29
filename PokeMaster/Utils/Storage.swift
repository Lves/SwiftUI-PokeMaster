//
//  Storage.swift
//  PokeMaster
//
//  Created by LvesLi on 2020/10/29.
//

import Foundation

@propertyWrapper
struct Storage<T> {
    var value: T
    var defaultValue: T
    var name: String
    
    init(name: String, defaultValue: T) {
        value = UserDefaults.standard.value(forKey: name) as? T ?? defaultValue
        self.name = name
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        set {
            value = newValue
            UserDefaults.standard.setValue(value, forKey: name)
        }
        get {
            value
        }
    }
    
}
