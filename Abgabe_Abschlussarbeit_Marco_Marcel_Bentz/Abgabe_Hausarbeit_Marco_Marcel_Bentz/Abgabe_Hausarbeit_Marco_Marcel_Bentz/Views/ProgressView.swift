//
//  ProgressView.swift
//  Abgabe_Hausarbeit_Marco_Marcel_Bentz
//
//  Created by Marco Bentz on 09.06.21.
//

// View zur Gestaltung
import SwiftUI

struct ProgressView: View{
    @StateObject var progress = StepCounter()

    var body: some View {
        NavigationView{
            VStack{
                Text("Schritte: \(progress.steps ?? 0)")
                    .padding()
                //Text(distance != nil ? String(format: "%.2f Meter", distance!): "")
                Text("Distanz: \(progress.distance ?? 0.0 , specifier: "%.0f") m")
                    .padding()
                
                Text("\(UserDefaults.standard.object(forKey: "firstname") as? String ?? "")")
                    .padding()
                Text("\(UserDefaults.standard.object(forKey: "lastName") as? String ?? "")")
                    .padding()
                Text("\(UserDefaults.standard.object(forKey: "birthDate") as? Date ?? Date())")
                    .padding()
                Text("\(UserDefaults.standard.object(forKey: "height") as? String ?? "")")
                    .padding()
                Text("\(UserDefaults.standard.object(forKey: "weight") as? String ?? "")")
                    .padding()
                Text("\(UserDefaults.standard.object(forKey: "todaysteps") as? String ?? "")")
                    .padding()
//                Text("\(UserDefaults.standard.object(forKey: "gender") as? String ?? "")")
//                    .padding()
    
            }
            .navigationTitle("Progress")
        }
        .onAppear(perform: {
            progress.initializePedometer()
        })
        
    }
}
