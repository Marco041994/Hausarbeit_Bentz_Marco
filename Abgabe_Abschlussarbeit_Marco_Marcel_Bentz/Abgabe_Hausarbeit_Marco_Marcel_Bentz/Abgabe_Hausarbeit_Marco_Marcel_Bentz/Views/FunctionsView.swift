//
//  FunctionsView.swift
//  Abgabe_Hausarbeit_Marco_Marcel_Bentz
//
//  Created by Marco Bentz on 09.06.21.
//

// View zur Gestaltung
import SwiftUI

// Anlegen einer Struktur der Form View
struct NameView: View {
// Anlegen von Variablen, welche die Funktionen annehmen
    @StateObject var speichern = save()
    @StateObject var auslesen = load()
    @StateObject var löschen = delete()
    @StateObject var modifizieren = modify()
    
    var body: some View {
        
        NavigationView {
// Anlegen eines VStack zur Platzierung von Elementen in der vertikalen
            VStack {
// Ausgabe eines Text mit Funktion und Prüfung, ob das Ergebnis ein String is
                Text("Personennamen: \(auslesen.name ?? "")")
//                TextField("Personennamen", text: $auslesen)
// Setzen des Titels auf Test
            }.navigationTitle("Test")
        }
// Beim Ausführen der View sollen die Funktionen geladen und ausgeführt werden
        .onAppear(perform: {speichern.save(); löschen.delete(); auslesen.load(); modifizieren.modify()})
    }
}
