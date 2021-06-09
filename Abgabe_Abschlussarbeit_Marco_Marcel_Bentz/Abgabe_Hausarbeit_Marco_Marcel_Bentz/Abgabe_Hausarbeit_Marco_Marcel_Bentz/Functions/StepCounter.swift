//
//  StepCounter.swift
//  Abgabe_Hausarbeit_Marco_Marcel_Bentz
//
//  Created by Marco Bentz on 09.06.21.
//

// Auselesen des Schrittzählers

import SwiftUI
import CoreMotion

class StepCounter: ObservableObject{
    
    private let pedometer: CMPedometer = CMPedometer()
    @Published  var steps: Int?
    @Published  var distance: Double?
    
    private var isPedometerAvailable: Bool{
        return CMPedometer.isPedometerEventTrackingAvailable() && CMPedometer.isDistanceAvailable() && CMPedometer.isStepCountingAvailable()
    }
    //Konvertierung in Milen
//    private func updateUI(data: CMPedometerData){
//        steps = data.numberOfSteps.intValue
//        guard let pedometerDistance = data.distance else {return}
//        let distanceInMeters = Measurement(value: pedometerDistance.doubleValue, unit: UnitLength.meters)
//        distance = distanceInMeters.converted(to: .miles).value
//    }
    
    func initializePedometer(){
        if isPedometerAvailable {
            guard let startDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())
            else{
                return
            }
            pedometer.queryPedometerData(from: startDate, to: Date()) { (data, error) in
                guard let data = data, error == nil else {return}
                
              
                self.steps = data.numberOfSteps.intValue
                
                self.distance = data.distance?.doubleValue
            }
            
        }
    }
}
//    var body: some View {
//        Text(steps != nil ? "\(steps!) steps" : "").padding()
//        Text(distance != nil ? String(format: "%.2f Meter", distance!): "").padding()
//
//            .onAppear(){
//                initializePedometer()
//            }
//    }


//info pList NSMotion... erstellen
