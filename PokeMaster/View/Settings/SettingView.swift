//
//  SettingView.swift
//  PokeMaster
//
//  Created by LvesLi on 2020/10/22.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var store: Store
    var settingsBinding: Binding<AppState.Settings> {
        $store.appState.settings
    }
    var settings: AppState.Settings {
        store.appState.settings
    }
    
    var body: some View {
        Form {
            accountSection
            optionSection
        }
        .alert(item: settingsBinding.loginError) { error in
            Alert(title: Text(error.localizedDescription))
        }
    }
    
    
    var accountSection: some View {
        Section(header: Text("账户")) {
            if settings.loginUser == nil {
                Picker(selection: settingsBinding.accountBehavior, label: Text("")){
                    ForEach(AppState.Settings.AccountBehavior.allCases, id: \.self) {
                        Text($0.text)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                TextField("电子邮箱", text: settingsBinding.email)
                SecureField("密码", text: settingsBinding.password)
                if settings.accountBehavior == .register {
                    SecureField("确认密码", text: settingsBinding.verifyPassword)
                }
                if settings.loginRequesting {
                    HStack {
                        ActivityIndicatorView(isAnimation: settingsBinding.loginRequesting)
                    }
                } else {
                    Button(settings.accountBehavior.text) {
                        self.store.dispatch(.login(email: self.settings.email, passowrd: self.settings.password))
                    }
                }
            }else {
                Text(settings.loginUser?.email ?? "")
                Button("注销") {
                    self.store.dispatch(.logout)
                }
            }
        }
    }
    var optionSection: some View {
        Section(header: Text("选项")) {
            HStack {
                Text("显示英文名")
                Spacer()
                Toggle("", isOn: settingsBinding.showEnglishName)
            }
            Picker(selection: settingsBinding.sorting, label: Text("排序方式")){
                ForEach(AppState.Settings.Sorting.allCases,id: \.self) {
                    Text($0.text)
                }
            }
            HStack {
                Text("只显示收藏")
                Spacer()
                Toggle("", isOn: settingsBinding.showFavoriteOnly)
            }
        }
    }
    
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingView()
                .navigationBarTitle("设置")
                .environmentObject(Store())
        }
    }
}
