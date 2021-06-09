//
//  SettingsView.swift
//  Abgabe_Hausarbeit_Marco_Marcel_Bentz
//
//  Created by Marco Bentz on 09.06.21.
//

// View zur Gestaltung
import SwiftUI

struct SettingsView: View{
    @State private var growthCheck = false
    @State private var bloodpressureCheck = false
    @State private var systolisch = ""
    @State private var diastolisch = ""
    @State private var stepcounthandicapCheck = false
    @State private var stepcounthandicap = ""
    @State private var readingDistanceCheck = false
    @State private var readingDistance = ""
    @State private var height = ""
    @State private var weight = ""
    @State var meterSelection = 1
    @State var centimeterSelection = 70
    var meter = [Int](0..<3)
    var centimeter = [Int](0..<100)
   
  
    @State var kilogramSelection = 30
    @State var gramSelection = 0
    var kilogram = [Int](30..<250)
    var gram = [Int](0..<100)
    
    var body: some View {
        Form{
            Section(header: Text("Einstellungen")){
                Toggle(isOn: $growthCheck) {
                    Text("Wachstum?")
                }
                
//                Toggle(isOn: $bloodpressureCheck, label: {
//                    Text("Blutdruckangabe?")
//                })
                
                Toggle(isOn: $bloodpressureCheck){ Text("Blutdruckangabe?")}
                if bloodpressureCheck == true {
                    TextField("Bitte geben Sie den systolischen Blutdruck ein!", text: $systolisch)
                    TextField("Bitte geben Sie den diastolischen Blutdruck ein!", text: $diastolisch)
                }
                
                Toggle(isOn: $stepcounthandicapCheck){ Text("Schrittzahlvorgabe?")}
                if stepcounthandicapCheck == true {
                    TextField("Bitte geben Sie die tägliche Mindestschrittzahl ein!", text: $stepcounthandicap)
                }
                
//                TextField("Größe",text: $height)
//                TextField("Gewicht", text: $weight)
//                
//                GeometryReader { hr in
//                    HStack{
//                        Picker(selection: self.$meterSelection, label: Text("Größe")){
//                            ForEach(0..<self.meter.count){index in
//                                Text("\(self.meter[index])").tag(index)
//                            }
//                        }.frame(width: hr.size.width/11*8)
//                        Text(",").frame(width: hr.size.width/11*0.1)
//                        Picker(selection: self.$centimeterSelection, label: Text("")){
//                            ForEach(0..<self.centimeter.count){index in
//                                Text("\(self.centimeter[index])").tag(index)
//                            }
//                        }.frame(width: hr.size.width/11*2)
//                        Text("m").frame(width: hr.size.width/11*0.5)
//                    }
//                }
//                GeometryReader { wr in
//                    HStack{
//                        Picker(selection: self.$kilogramSelection, label: Text("Gewicht")){
//                            ForEach(0..<self.kilogram.count){index in
//                                Text("\(self.kilogram[index])").tag(index)
//                            }
//                        }.frame(width: wr.size.width/11*8)
//                        Text(",").frame(width: wr.size.width/11*0.1)
//                        Picker(selection: self.$gramSelection, label: Text("")){
//                            ForEach(0..<self.gram.count){index in
//                                Text("\(self.gram[index])").tag(index)
//                            }
//                        }.frame(width: wr.size.width/11*1.5)
//                        Text("kg").frame(width: wr.size.width/11*1)
//                    }
//            }
        }
            Button{
// Ausgabe in der Konsole
                print("Daten speichern")
// Setzen der UserDefault Werte zur Übergabe
                UserDefaults.standard.set($growthCheck.wrappedValue, forKey: "growth")
                UserDefaults.standard.set($gramSelection.wrappedValue, forKey: "growthselection")
                UserDefaults.standard.set($bloodpressureCheck.wrappedValue, forKey: "bloodpressure")
                UserDefaults.standard.set($systolisch.wrappedValue, forKey: "systolisch")
                UserDefaults.standard.set($diastolisch.wrappedValue, forKey: "diastolisch")
                UserDefaults.standard.set($height.wrappedValue, forKey: "height")
                UserDefaults.standard.set($weight.wrappedValue, forKey: "weight")
            
            } label: {
                Text("Speichern")
                    .padding()
                    //.background(Color.black)
                    .foregroundColor(.green)
            }
    }
       
}
}
