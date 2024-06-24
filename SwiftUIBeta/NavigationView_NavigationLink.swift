//
//  NavigationView_NavigationLink.swift
//  SwiftUIBeta
//
//  Created by Valentina Vera Paz on 22/06/24.
//

import SwiftUI

struct NavigationView_NavigationLink: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Option Menu 1",
                               destination: Text("Some information"))
                NavigationLink("Option Menu 2",
                               destination: Button("Tap me!", action: {
                                print("Hello iOS Developer")
                               }))
                Text("Option Menu 3")
                Text("Option Menu 4")
            }
            .navigationBarItems(trailing: Button("Done", action: {
                print("NavigationView Button")
            }))
            .navigationTitle("Configuration")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarHidden(false)
        }
    }
}

#Preview {
    NavigationView_NavigationLink()
}
