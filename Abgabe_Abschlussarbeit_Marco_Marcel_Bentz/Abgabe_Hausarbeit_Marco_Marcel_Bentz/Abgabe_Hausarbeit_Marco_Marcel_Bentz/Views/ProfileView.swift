//
//  ProfileView.swift
//  Abgabe_Hausarbeit_Marco_Marcel_Bentz
//
//  Created by Marco Bentz on 09.06.21.
//

// View zur Gestaltung
import SwiftUI

struct ProfileView: View {
// Anlegen einer Variable mit Aufruf der Funktion StepCounter
    @StateObject var progress = StepCounter()

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthDate = Date()
    @State private var height = ""
    @State private var weight = ""
    @State private var bmi = ""
    @State private var todaysteps = ""
    
    @State var genderSelection = 0
// Anlegen eines Arrays des Namen gender
    var gender = ["männlich", "weiblich", "divers"]

// Anlegen einer Variable mit der Initialisierung eines Zählers für Data auf 0
    @State var imgData = Data.init(count: 0)
    @State var shown = false
    
    var body: some View {
        NavigationView{
            
            VStack{
                ZStack(alignment: .bottomTrailing){
// Überprüfung, ob die Varable den Wert !0 beträgt
                    if imgData.count != 0{
// Falls ein Bild eingelesen wurde in der Variable Anzeige des neuen Bildes
                        Image(uiImage: UIImage(data: imgData)!)
                                  .resizable()
                                  .frame(width:100, height: 100)
                                  .clipShape(Circle())
                    }
                    else {
// Falls kein Bild eingelesen wurde anzeige eines Systembildes
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width:100, height: 100)
                            .clipShape(Circle())
                    }
                    
                    Button(action: {
                        self.shown.toggle()
                    }){
                        Image(systemName: "camera.circle")
                              .foregroundColor(.white)
                              .frame(width: 25, height: 25)
                              .background(Color.green)
                              .clipShape(Circle())
                              .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    }.sheet(isPresented: $shown){
                        picker(shown: self.$shown, imgData: self.$imgData)
                    }
                }
                Form{
                    Section(header: Text("Persönliche Infos")){
                        
                        TextField("Vorname", text: $firstName)
                        
                        TextField("Nachname", text: $lastName)
                        
                        DatePicker(selection: $birthDate, displayedComponents: .date, label: { Text("Geburtsdatum") })
                        
                        TextField("Größe", text: $height)
                        TextField("Gewicht", text: $weight)
                        let BMI = 25.5
                        //let BMI = weight / (height * height)
                        Text("Dein BMI beträgt: \(BMI, specifier: "%.2f")")
                        Text("Heutige Schrittzahl: \(progress.distance ?? 0.0 , specifier: "%.0f") m")
                        
                        
                        
                        Picker(selection: $genderSelection, label: Text("Geschlecht")){
                            ForEach(0..<gender.count){
                                Text(self.gender[$0]).tag($0)
                            }
                        }
                        
                    }
                    }.navigationTitle("Account")
                HStack{
                Button{
                    print("Daten speichern")
                    UserDefaults.standard.set($firstName.wrappedValue, forKey: "firstname")
                    UserDefaults.standard.set($lastName.wrappedValue, forKey: "lastName")
                    UserDefaults.standard.set($birthDate.wrappedValue, forKey: "birthDate")
                    UserDefaults.standard.set($height.wrappedValue, forKey: "height")
                    UserDefaults.standard.set($weight.wrappedValue, forKey: "weight")
                    
//                    var heightpotenz = height * height
//                    var bodyIndex = weight/heightpotenz
                    //UserDefaults.standard.set(bodyIndex, forKey: "bmi")
                    UserDefaults.standard.set(progress.distance ?? 0.0, forKey: "todaysteps")
                    UserDefaults.standard.set($genderSelection.wrappedValue, forKey: "gender")
                } label: {
                    Text("Speichern")
                        .padding()
                        //.background(Color.black)
                        .foregroundColor(.green)
                }
//                    Button{
//                        print("Account löschen")
//                    } label: {
//                        Text("Account löschen")
//                            .padding()
//                            //.background(Color.black)
//                            .foregroundColor(.red)
//                    }
                //.contentShape(Rectangle())
            }
            }
        } .onAppear(perform: {
            progress.initializePedometer()
        })
    }
}

// Anlegen der Strukturen und Funktionen zum Auslesen der Mediathek im Smartphone
struct picker : UIViewControllerRepresentable {
    
    @Binding var shown : Bool
    @Binding var imgData : Data
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(imgData1: $imgData, shown1: $shown)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<picker>) -> UIImagePickerController {
        
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = context.coordinator
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<picker>) {
        
    }
    
    class Coordinator :
        NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        @Binding var imgData : Data
        @Binding var shown : Bool
        
        init(imgData1 : Binding<Data>,shown1 : Binding<Bool>) {
            _imgData = imgData1
            _shown = shown1
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            
            shown.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let image = info[.originalImage] as! UIImage
            imgData = image.jpegData(compressionQuality: 80)!
            shown.toggle()
            
        }
    }
}
