//
//  Preferences.swift
//  Key Bound
//
//  Created by Justin Oakes on 10/24/20.
//

import SwiftUI

struct Preferences: View {
    @State var showsInDock = true
    @State var showsInMenuBar = true
    @State var launchesAtLogin = true

    var body: some View {
        VStack {
            GroupBox(label: Text("Keybound Preferences")
                        .bold()) {
                VStack {
                    HStack{
                        Text("Show in Dock")
                            .bold()
                        Spacer()
                        Toggle(isOn: $showsInDock) {
                            Text("Show in Dock")
                        }
                    }
                    .padding()
                    HStack{
                        Text("Show in MenuBar")
                            .bold()
                        Spacer()
                        Toggle(isOn: $showsInMenuBar) {
                            Text("Show in MenuBar")
                        }
                    }
                    .padding()
                    HStack{
                        Text("Launches at Login")
                            .bold()
                        Spacer()
                        Toggle(isOn: $showsInDock) {
                            Text("Launches at Login")
                        }
                    }
                    .padding()
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
        }
    }
}

struct Preferences_Previews: PreviewProvider {
    static var previews: some View {
        Preferences()
    }
}
