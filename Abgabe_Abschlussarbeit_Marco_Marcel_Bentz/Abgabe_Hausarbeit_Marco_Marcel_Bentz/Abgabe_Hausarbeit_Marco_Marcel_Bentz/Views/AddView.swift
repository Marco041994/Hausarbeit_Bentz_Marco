//
//  AddView.swift
//  Abgabe_Hausarbeit_Marco_Marcel_Bentz
//
//  Created by Marco Bentz on 09.06.21.
//

// View zur Gestaltung
import SwiftUI

struct AddView: View{
    @State private var newweight = ""
    @State private var newheight = ""
    @State private var newsystolischbloodpressure = ""
    @State private var newdiastolischbloodpressure = ""
    var body: some View {

        NavigationView{
            Form{
                Section(header: Text("Eingabe neuer Daten")){
                    TextField("Gewicht",text: $newweight)
                    TextField("Größe",text: $newheight)
                    TextField("systolischer Blutdruck",text: $newsystolischbloodpressure)
                    TextField("diastolischer Blutdruck",text: $newdiastolischbloodpressure)
                    
                }
                Button{
                    print("Daten speichern")
                    UserDefaults.standard.set($newweight.wrappedValue, forKey: "newgrowth")
                    UserDefaults.standard.set($newheight.wrappedValue, forKey: "newweight")
                    UserDefaults.standard.set($newdiastolischbloodpressure.wrappedValue, forKey: "newdiastolischbloodpressure")
                    UserDefaults.standard.set($newsystolischbloodpressure.wrappedValue, forKey: "newsystolischbloddpressure")
                    
                
                } label: {
                    Text("Speichern")
                        .padding()
                        //.background(Color.black)
                        .foregroundColor(.green)
                }
            }
            .navigationTitle("Add")
            
        }
        
    }
}
