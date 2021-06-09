//
//  DeleteCoreData.swift
//  Abgabe_Hausarbeit_Marco_Marcel_Bentz
//
//  Created by Marco Bentz on 09.06.21.
//

// Löschen in Core Data
import UIKit
import SwiftUI
import CoreData

// Anlegen einer Klasse als ObservableObject zur Übergabe von Variablen
class delete: ObservableObject{
// Veröffentlichen von Variablen zur Übergabe in ander Klassen/Strukturen und Prüfung, ob Variable ein String ist
    @Published var name: String?
// Anlegen einer Funktion
    func delete(){
// Prüfung, ob eine Verbidnung zur UIApplication hergestellt werden kann, für den PersistentContainer Context
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
// Anlegen des Kontext des PersistentContainer
        let context = appDelegate.persistentContainer.viewContext
// Anlegen einer Variable zur Eingabe der Entität im Core Data
        let entityName = "Users"
//Anfrage stellen
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        do {
// Auslesen der Inhalte des Kontext des Core Data und Übergabe in Variable Results
            let results = try context.fetch(request)
// Prüfung, ob in results Inhalte vorhanden sind
            guard results.count > 0 else{
                return
            }
// Anlegen einer Random Zahl zu Versuchzwecken zur Löschung
            let randomInt = Int.random(in: 0..<results.count)
// Prüfung, ob der Datensatz aus Results mit RandomInt als NSManagedObject konform ist und Zuweosung in randomEntity
            if let randomEntity = results[randomInt] as? NSManagedObject{
// Löschen in der Entität an der Stelle random Entity
                context.delete(randomEntity)
// Prüfung, ob es in der Entität Änderungen gab
                if context.hasChanges{
                    do{
// Versuch neuen context zu speichern, erst dann wird Kontextveränderung wirksam
                        try context.save()
// Ausgabe der Nummer des gelöschten Datensatzes in der Konsole in xCode zu Überprüfungszwecken
                        print("Gelöscht: Datensatz \(randomInt)")
                    }
// Abfangen eines möglichen Fehlers
                    catch {
// Ausgabe des Fehlers in der Konsole
                        print (error)
                    }
                }
            }
        }
        catch {
            print (error)
        }
    }
}
