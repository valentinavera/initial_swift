//
//  ContentView.swift
//  SwiftUIBeta
//
//  Created by Valentina Vera Paz on 1/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var followers: Int = 200
    @State var isFollowed = false
    @State var isPresented = false
    @State var isPresedPhoto = false
    
    var body: some View {
        VStack(content: {
            HStack(content: {
                Image(systemName: "chevron.left")
                Spacer()
                Text("Marry Wilson").font(.title2)
                Spacer()
                Image(systemName: "ellipsis")
            }).padding(.horizontal, 20)
            Image("profileImage").resizable().scaledToFit().clipShape(Circle()).frame(width: 140)
                .overlay(
                    Circle().stroke(.gray.opacity(0.2), style: StrokeStyle(lineWidth: 2))
                    .padding(-4)
                )
                .onTapGesture {
                    isPresedPhoto = true
                }.actionSheet(isPresented: $isPresedPhoto, content: {
                    ActionSheet(title: Text("Cambia tu foto de perfil"),
                                message: Text("Elige la opción que quieras:"),
                                buttons: [.default(Text("Cámara"),
                                                   action: {
                                                    print("Camara")
                                                   }),
                                          .default(Text("Galeria")),
                                          .destructive(Text("Cancelar"))])
                })
            Text("@Marry_wil").bold().font(.title3)
                .padding(.bottom, 12)
            HStack{
                ContentInfo(title: "Following", info: 29)
                Spacer()
                ContentInfo(title: "Followers", info: followers)
                Spacer()
                ContentInfo(title: "Likes", info: 100)
            }.padding(.horizontal, 30)
            HStack{
                Button(action: {
                    if(!isFollowed){
                        self.followers += 1
                        self.isFollowed = true
                    }else{
                        self.isPresented = true
//                        self.followers -= 1
                    }
                    
//                    self.isFollowed = !self.isFollowed
                }) {
                    Text(isFollowed ? "Unfollow" : "Follow")
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .foregroundColor(.white)
                    .background(isFollowed ? .gray : .green)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
                    .font(.headline)
                }
                
                Button(action: {
                    
                }, label: {
                    Circle().fill(Color(.gray.opacity(0.4))).frame(width: 40)
                        .overlay(content: {
                            Image(systemName: "tray")
                                .foregroundStyle(Color(.black.opacity(0.5)))
                        })
                })
            }.padding(.vertical, 15)
        }).padding()
            .alert(isPresented: $isPresented, content: {
                Alert(title: Text("Alerta"), 
                      message: Text("Esta seguro ?"),
                      primaryButton: Alert.Button.default(Text("Aceptar"),
                     action: {
                    self.isFollowed = false
                    self.followers -= 1
                }), secondaryButton: .destructive(Text("Cancelar")))
            })
    }
}

struct ContentInfo: View {
    var title: String
    var info: Int
    
    var body: some View {
        VStack(spacing: 10, content: {
            Text("\(info)")
            Text(title)
        })
    }
}

#Preview {
    ContentView()
}
