//
//  MenuView.swift
//  Abgabe_Hausarbeit_Marco_Marcel_Bentz
//
//  Created by Marco Bentz on 09.06.21.
//

// View zur Gestaltung der Sidebar
import SwiftUI

struct MenuView: View {
    @State private var dark = false
    
    var body: some View {
        VStack(spacing: 25){
            Button(action: {
                
            }) {
                VStack{
                    VStack(spacing: 8){
                        Button(action: {
// Aufruf der Variable dark und Änderung des Boolean
                            self.dark.toggle()
// Änderung der Variable dark bei Ausführung des Buttons für den Dark Mode an- bzw auszuschalten
                            UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = self.dark ? .dark : .light
                        }) {
                            Image(systemName: "sun.max")
                                .font(.title)
                                .rotationEffect(.init(degrees: self.dark ? 180 : 0))
                        }
                        Text("Dark Mode")
                    }
                    VStack(spacing: 8){
                        Image(systemName: "plus.circle")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 55, height: 55)
                        Text("New Profile")
                    }
                    VStack(spacing: 8){
                        Image(systemName: "arrow.left.arrow.right.circle")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 55, height: 55)
                        Text("Change Profile")
                    }
                    VStack(spacing: 8){
                        Image(systemName: "percent")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 55, height: 55)
                        Text("Percentage")
                    }
//                    VStack(spacing: 8){
//                        NavigationView{
// Anlegen eines Navigationslinks zur ProfileView
//                            NavigationLink(destination: ProfileView(), label: {
//                                Text("Link zum ProfilView")
//                            })
//                        }
//                    }
                }
            }
            Spacer(minLength: 15)
        }.padding(35)
        .foregroundColor(.black)
        .background(Color(.yellow)
        .edgesIgnoringSafeArea(.bottom))
    }
}
