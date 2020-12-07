//
//  ContentView.swift
//  Med_Easy
//
//  Created by Suryansh Soni on 12/5/20.
//

import SwiftUI
import CoreData



struct medRow: View {
    var med: Medicine

    var body: some View {
        Text(med.genericname ?? "No name given")
        Text(med.brandname ?? "No brand Name added")
        Text(med.commonuses ?? "No common use")
    }
}



struct ContentView: View {
    
    
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(
           entity: Medicine.entity(),
           sortDescriptors: [NSSortDescriptor(keyPath: \Medicine.dateadded, ascending: false)],
           predicate: NSPredicate(format: "isComplete == %@", NSNumber(value: false))
       ) var notCompletedmeds: FetchedResults<Medicine>

    
    @State private var genericname: String = ""
    @State private var brandname: String = ""
    @State private var commonuses: String = ""
    @State private var pharamacology: String = ""
    
    var body: some View {
        VStack {
          HStack{
            TextField("Medicine Name", text: $genericname)
            Button(action: {
                self.addmed()
            }){
              Text("Add Medicine")
            }
          }.padding(.all)
            
       
          List {
            ForEach(notCompletedmeds){ med in
              Button(action: {
                self.updatemed(med)
              }){
                medRow(med:med)
              }            }
          }
        }
      
    }

    
    
    func addmed() {
        let newmed = Medicine(context: context)
        newmed.id = UUID()
        newmed.brandname = brandname
        newmed.commonuses = commonuses
        newmed.genericname = genericname
        newmed.pharmacology = pharamacology
        newmed.dateadded = Date()
        newmed.isComplete = false
        do {
            try context.save()
        } catch {
            print(error)
        }
        
        
        
    }
    
    func updatemed(_ med: Medicine){
        let isComplete = true
        let medID = med.id! as NSUUID
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Medicine")
        fetchRequest.predicate = NSPredicate(format: "id == %@",medID as CVarArg)
        fetchRequest.fetchLimit = 1
        do {
          let test = try context.fetch(fetchRequest)
          let medUpdate = test[0] as! NSManagedObject
          medUpdate.setValue(isComplete, forKey: "isComplete")
        } catch {
          print(error)
        }
      }
    }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
    
    
    
    

