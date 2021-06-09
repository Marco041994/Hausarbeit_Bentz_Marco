//
//  HealthStore.swift
//  Abgabe_Hausarbeit_Marco_Marcel_Bentz
//
//  Created by Marco Bentz on 09.06.21.
//

// Verbindung zum HealthStore
import HealthKit

class HealthStor{
    var healthStore: HKHealthStore?
    init(){
        if HKHealthStore.isHealthDataAvailable(){
            healthStore = HKHealthStore()
        }
    }
}
