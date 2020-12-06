//
//  ContentView.swift
//  Med_Easy
//
//  Created by Suryansh Soni on 12/5/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(0 ..< 5) { item in
        HStack {
            Image(systemName: "photo")
            VStack(alignment: .leading) {
                Text("hello")
                Text("world")
                    .font(.subheadline)
                    .colorMultiply(.gray)
                
            }
            
        }
       

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
