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
    
    // TODO: these will probably be observed objects at some point
    @State var f1Selection: MappableAction
    @State var f2Selection: MappableAction
    @State var f3Selection: MappableAction
    @State var f4Selection: MappableAction
    @State var f5Selection: MappableAction
    @State var f6Selection: MappableAction
    @State var f7Selection: MappableAction
    @State var f8Selection: MappableAction
    @State var f9Selection: MappableAction
    @State var f10Selection: MappableAction
    @State var f11Selection: MappableAction
    @State var f12Selection: MappableAction

    var body: some View {
        VStack {
            GroupBox(label: Text("Key binding preferences")
                        .bold()) {
                VStack {
                    ForEach(FunctionKeys.allCases, id: \.self) {key in
                        HStack {
                            Text(key.rawValue.uppercased())
                            Spacer()
                                MenuButton(
                                    label: Text(key.mappedValue?.action.rawValue ?? "None"),
                                    content: /*@START_MENU_TOKEN@*/{
                                        ForEach(MappableAction.allCases, id: \.self) { boundAction in
                                            Button(boundAction.rawValue) {
                                                f1Selection = boundAction
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
        PreferencesView( f1Selection: .volumeUp,
                         f2Selection: .volumeDown,
                         f3Selection: .none,
                         f4Selection: .none,
                         f5Selection: .none,
                         f6Selection: .none,
                         f7Selection: .none,
                         f8Selection: .none,
                         f9Selection: .none,
                         f10Selection: .none,
                         f11Selection: .none,
                         f12Selection: .none)
    }
}
