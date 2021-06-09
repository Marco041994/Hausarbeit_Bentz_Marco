//
//  ModifyCoreData.swift
//  Abgabe_Hausarbeit_Marco_Marcel_Bentz
//
//  Created by Marco Bentz on 09.06.21.
//

import UIKit
import SwiftUI
import CoreData

class modify: ObservableObject{
    @Published var name: String?
    func modify(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
            
        }
        let context = appDelegate.persistentContainer.viewContext
        let entityName = "Users"
    //Anfrage stellen
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        do {
            let results = try context.fetch(request)
            
            guard results.count > 0 else{
                return
            }
            let randomInt = Int.random(in: 0..<results.count)
            if let randomEntity = results[randomInt] as? NSManagedObject{
                randomEntity.setValue(99, forKey: "age")
                
                if context.hasChanges{
                    do{
                        try context.save()
                        print("Geändert: Datensatz \(randomInt)")
                    }
                    catch {
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
