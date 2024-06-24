//
//  TabView.swift
//  SwiftUIBeta
//
//  Created by Valentina Vera Paz on 22/06/24.
//

import SwiftUI

struct TabPageView: View {
    var body: some View {
        TabView {
            TabView{
                RoundedRectangle(cornerRadius: 20).padding().foregroundStyle(Color(.green))
                RoundedRectangle(cornerRadius: 20).padding().foregroundStyle(Color(.blue))
            }.tabViewStyle(PageTabViewStyle()).frame(height: 150)
                .tabItem {
                Image(systemName: "house.fill")
                Text("home")
            }
            ContentView().tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("profile")
            }
            DataList().tabItem {
                Image(systemName: "info.circle")
                Text("List")
            }
            NavigationView_NavigationLink().tabItem {
                Image(systemName: "gear")
                Text("Configuration")
            }
        }
        .accentColor(.indigo)
    }
}

#Preview {
    TabPageView()
}
