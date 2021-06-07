//
//  StepCounter.swift
//  Hausarbeit_Marco_Bentz
//
//  Created by Marco Bentz on 07.06.21.
//

import Foundation
import SwiftUI
import CoreMotion

struct StepCounter{
    
    private let pedometer: CMPedometer = CMPedometer()
    @State private var steps: Int?
    @State private var distance: Double?
    
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
    
    private func initializePedometer(){
        if isPedometerAvailable {
            guard let startDate = Calendar.current.date(byAdding: .hour, value: -18, to: Date())
            else{
                return
            }
            pedometer.queryPedometerData(from: startDate, to: Date()) { (data, error) in
                guard let data = data, error == nil else {return}
                
              
                steps = data.numberOfSteps.intValue
                
                distance = data.distance?.doubleValue
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
}

//info pList NSMotion... erstellen
