//
//  SaveCoreData.swift
//  Abgabe_Hausarbeit_Marco_Marcel_Bentz
//
//  Created by Marco Bentz on 09.06.21.
//

// Speichern in Core Data
import UIKit
import SwiftUI
import CoreData

class save: ObservableObject{
    @Published var name: String?
    
    func save (){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let entityName = "Users" // Tabellennamen im Datenmodell
        // Neuen Datensatz anlegen
        guard let newEntity = NSEntityDescription.entity(forEntityName: entityName, in: context) else {
            return
        }
        
        let newUser = NSManagedObject(entity: newEntity, insertInto: context)
        let name = "Marco Bentz"

        newUser.setValue(name, forKey: "name")
        
//        let userID = 1
//        let bloodpressure = false
//        let growth = false
//        let age = 29
//        let weight = 55.3
//        let height = 1.56
//
//        let readingdistance = 6
//        let stepcounthandicap = false
//        let name = "Hans Peter"
//
//        newUser.setValue(userID, forKey: "userID")
//        newUser.setValue(growth, forKey: "growth")
//        newUser.setValue(bloodpressure, forKey: "bloodpressure")
//        newUser.setValue(age, forKey: "age")
//        //Datepicker einbauen
//        newUser.setValue(height, forKey: "height")
//        newUser.setValue(weight, forKey: "weight")
//        newUser.setValue(readingdistance, forKey: "readingdistance")
//        newUser.setValue(stepcounthandicap, forKey: "stepcounthandicap")
//        newUser.setValue(name, forKey: "name")
        
        // Datensatz speichern
        do {
            try context.save()
            print ("Saved:\n Name: \(name)\n")
//            print ("Saved:\n UserID: \(userID) \n" ,
//                "Growth: \(growth)\n",
//                "Bloodpressure: \(bloodpressure)\n",
//                "Age: \(age)\n",
//                "Height: \(height)\n",
//                "Weight: \(weight)\n",
//                "Reading Distance: \(readingdistance)\n",
//                "StepCount Handicap: \(stepcounthandicap)\n",
//                "Name: \(name)\n")
        }
        catch {
            print (error)
        }
    }
}
