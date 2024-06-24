//
//  FullScreenCover_Sheet.swift
//  SwiftUIBeta
//
//  Created by Valentina Vera Paz on 22/06/24.
//

import SwiftUI

struct FullScreenCover_Sheet: View {
    @State var isPresented: Bool = false
    @State var isPresentedSheet: Bool = false
    var body: some View {
        VStack {
            Image("swiftui")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            Text("¡Suscríbete a SwiftBeta!")
                .bold()
                .font(.largeTitle)
                .padding(.horizontal, 16)
                .multilineTextAlignment(.center)
            Text("para aprender SwiftUI, Swift y Xcode")
                .font(.body)
                .padding(.vertical, 12)
            Button(action: { isPresented = true }, label: {
                Text("Suscribir")
                    .bold()
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.blue)
                    .cornerRadius(12)
                    
            })
        }.padding(.bottom, 300)
            .fullScreenCover(isPresented: $isPresented,
                 onDismiss: { isPresented = false },
                 content: {
                    ZStack {
                        Color.blue.ignoresSafeArea()
                        Button(action: { 
                            isPresented = false
                        }, label: {
                            Text("¡Bienvenido a\n SwiftBeta! 🎉")
                                .bold()
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding(12)
                                .background(Color.blue)
                                .cornerRadius(12)
                                
                        })
                        .padding(.top, -270)
                        Button(action: { isPresentedSheet = true }, label: {
                            Text("Suscribir")
                                .bold()
                                .foregroundColor(.white)
                                .padding(12)
                                .background(Color.blue)
                                .cornerRadius(12)
                                
                        }).sheet(isPresented: $isPresentedSheet,
                                 onDismiss: { isPresentedSheet = false},
                                 content:{
                            ZStack {
                                Color.red.ignoresSafeArea()
                            }
                        })
                    }
                    .onAppear {
                        print("¡Suscríbete a SwiftBeta!")
                    }
                 })
    }
}

#Preview {
    FullScreenCover_Sheet()
}
