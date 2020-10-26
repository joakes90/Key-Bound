//
//  Preferences.swift
//  Key Bound
//
//  Created by Justin Oakes on 10/24/20.
//

import SwiftUI

struct PreferencesView: View {
    @State var showsInDock = true
    @State var showsInMenuBar = true
    @State var launchesAtLogin = true
    @State var showPrefsAtLaunch = true

    var body: some View {
        VStack {
            GroupBox(label: Text("Key binding preferences")
                        .bold()) {
                VStack {
                    Text("Key Bindings")
                        .bold()
                    ForEach(Range(1...12)) {number in
                        HStack{
                            Text("F\(number)")
                            Spacer()
                            MenuButton(label: Text("none")) {
                                Text("Volume Up")
                                Text("Volume Down")
                                Text("Display Brightness Up")
                                Text("Display Brightness Down")
                            } .frame(width: 250, alignment: .center)
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
