//
//  LoadCoreData.swift
//  Abgabe_Hausarbeit_Marco_Marcel_Bentz
//
//  Created by Marco Bentz on 09.06.21.
//

// Laden aus Core Data
import UIKit
import SwiftUI
import CoreData

class load: ObservableObject{
    @Published var name: String?
    
    func load () {
        //Kontext identifizieren
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let entityName = "Users"
    //Anfrage stellen
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        do {
            let results = try context.fetch(request)
            
            for r in results{
                if let result = r as? NSManagedObject{
                    
                    guard let name = result.value(forKey: "name") as? String else {
                        return
                    }
                    
                    print ("Geladen:\n Name: \(name)\n")
                }
            }
            
            print ("Geladen: \(results.count) Ergebnisse")
        }
        catch {
            print (error)
        }
    }
}
