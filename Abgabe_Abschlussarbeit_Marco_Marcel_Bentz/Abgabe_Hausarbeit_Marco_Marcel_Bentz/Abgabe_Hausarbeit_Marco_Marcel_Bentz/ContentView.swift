//
//  ContentView.swift
//  Abgabe_Hausarbeit_Marco_Marcel_Bentz
//
//  Created by Marco Bentz on 09.06.21.
//

// Zusammenführung aller Inhalte im Startbildschirm
import SwiftUI
import CoreData

struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
    @State var show = false
    var body: some View {
//  Anlegen einer Navigation View um bspw in den Geschlechtspicker zu kommen
        NavigationView{
// Anlegen eines ZStack um Content übereinander zu platzieren
            ZStack{
// Anlegen der Tabbar im unteren Bereich
                TabView {
// Aufruf einer View sowie Darstellung in der Tabbar
                 ProfileView()
                    .tabItem {
                            Image(systemName: "person.crop.circle")
                            Text("Profiles")
                                .navigationBarTitle("Profile", displayMode: .inline)
                    }
                    
                    
                 SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                            .navigationBarTitle("Settings", displayMode: .inline)
                    }
                 
                AddView()
                    .tabItem {
                        Image(systemName: "plus.circle")
                        Text("Add")
                            .navigationBarTitle("Add", displayMode: .inline)
                    }
                    
                    ProgressView()
                    .tabItem {
                        Image(systemName: "book")
                        Text("Progress")
                            .navigationBarTitle("Progress", displayMode: .inline)
                    }
                }
// Anlegen des GeometryReaders zur Platzierung des der Menübar
                GeometryReader{_ in
// Anlegen eines HStack zur Platzierung von Elementen Horizontal
                    HStack{
                        MenuView()
                            .offset(x: self.show ? 0 : -UIScreen.main.bounds.width)
                            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
                        Spacer()
                        
                    }
                    
                }.background(Color.black.opacity(self.show ? 0.5 : 0).edgesIgnoringSafeArea(.bottom))
                
            }
// Hinzufügen eines Buttons zum Starten der Sidebar
            .navigationBarItems(leading:
                                    Button(action: {
                                        self.show.toggle()
                                    }, label:{
                                        if self.show{
                                            Image(systemName: "arrow.backward.square")
                                        }
                                        else{
                                            Image(systemName: "line.horizontal.3")
                                        }
                                        
//                                            .renderingMode(.original)
                                    }))
        }
        
//        List {
//            ForEach(items) { item in
//                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//            }
//            .onDelete(perform: deleteItems)
//        }
//        .toolbar {
//            #if os(iOS)
//            EditButton()
//            #endif
//
//            Button(action: addItem) {
//                Label("Add Item", systemImage: "plus")
//            }
//        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        ContentView()
    }
}
}
