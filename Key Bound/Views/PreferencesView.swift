//
//  Preferences.swift
//  Key Bound
//
//  Created by Justin Oakes on 10/24/20.
//

import LaunchAtLogin
import SwiftUI

struct PreferencesView: View {
    @EnvironmentObject var keyBindingController: KeyBindingController
    @ObservedObject var settingsController = SettingsController()


    var body: some View {
        VStack {
            GroupBox(label: Text("Key binding preferences")
                        .bold()) {
                VStack {
                    ForEach(keyBindingController.bindings, id: \.self) {binding in
                        HStack {
                            Text(binding.key.rawValue.uppercased())
                            Spacer()
                                MenuButton(
                                    label: Text(binding.mappedValue?.actionName ?? "None"),
                                    content: /*@START_MENU_TOKEN@*/{
                                        ForEach(MappableActionNames.allCases, id: \.self) { action in
                                            Button(action.rawValue) {
                                                binding.mappedValue = action.value
                                                keyBindingController.objectWillChange.send()
                                            }
                                        }
                                    }/*@END_MENU_TOKEN@*/
)
                            .frame(width: 250, alignment: .center)
                        }
                    }
                }
                
            }
            .padding()
            GroupBox(label: Text("App preferences")
                        .bold(), content: {
                            VStack {
                                HStack{
                                    Toggle(isOn: $settingsController.showPrefsAtLaunch) {
                                        Text("Show Preferences window on app launch")
                                    }
                                    Spacer()
                                }
                                HStack{
                                    Toggle(isOn: $settingsController.showDockIcon) {
                                        Text("Show in Dock")
                                    }
                                    Spacer()
                                }
                                HStack{
                                    Toggle(isOn: $settingsController.showInMenu) {
                                        Text("Show in MenuBar")
                                    }
                                    Spacer()
                                }
                                HStack{
                                    LaunchAtLogin.Toggle()
                                    Spacer()
                                }
                            }
            })
                .padding()
            Spacer()
        }
    }
}

struct Preferences_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
