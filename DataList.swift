//
//  DataList.swift
//  SwiftUIBeta
//
//  Created by Valentina Vera Paz on 2/06/24.
//

import SwiftUI

struct Device {
    let title: String
    let imageName: String
}

let house = [
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv")
]

let work = [
    Device(title: "iPhone", imageName: "iphone"),
    Device(title: "iPad", imageName: "ipad"),
    Device(title: "Airpods", imageName: "airpods"),
    Device(title: "Apple Watch", imageName: "applewatch")
]

struct DataList: View {
    @State var showingFirstSection = true
    @State var showingSecondSection = true
    var body: some View {
        List {
            Section("Home", isExpanded: $showingFirstSection, content: {
                ForEach(house, id: \.title) { option in
                    Label(option.title, systemImage: option.imageName)
                }
            })
            Section("Work", isExpanded: $showingSecondSection, content: {
                ForEach(work, id: \.title) { option in
                    Label(option.title, systemImage: option.imageName)
                }
            })
        }
        .listStyle(.sidebar)
    }
}

#Preview {
    DataList()
}
