//
//  Preferences.swift
//  Key Bound
//
//  Created by Justin Oakes on 10/24/20.
//

import SwiftUI

struct PreferencesView: View {
//    @ObservedObject var mapedValues = KeyBindingController.shared
    @State var showsInDock = true
    @State var showsInMenuBar = true
    @State var launchesAtLogin = true
    @State var showPrefsAtLaunch = true
    
    @ObservedObject var keyBindingsController = KeyBindingController.shared

    var body: some View {
        VStack {
            GroupBox(label: Text("Key binding preferences")
                        .bold()) {
                VStack {
                    ForEach(FunctionKey.allCases, id: \.self) {key in
                        HStack {
                            Text(key.rawValue.uppercased())
                            Spacer()
                                MenuButton(
                                    label: Text(key.mappedValue?.action.rawValue ?? "None"),
                                    content: /*@START_MENU_TOKEN@*/{
                                        ForEach(MappableAction.allCases, id: \.self) { boundAction in
                                            Button(boundAction.rawValue) {
                                                keyBindingsController.setAction(boundAction: boundAction, for: key)
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
                                    Toggle(isOn: $showsInDock) {
                                        Text("Show Preferences window on app launch")
                                    }
                                    Spacer()
                                }
                                HStack{
                                    Toggle(isOn: $showsInDock) {
                                        Text("Show in Dock")
                                    }
                                    Spacer()
                                }
                                HStack{
                                    Toggle(isOn: $showsInMenuBar) {
                                        Text("Show in MenuBar")
                                    }
                                    Spacer()
                                }
                                HStack{
                                    Toggle(isOn: $showsInDock) {
                                        Text("Launches at Login")
                                    }
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
