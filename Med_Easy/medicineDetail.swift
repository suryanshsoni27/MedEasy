//
//  medicineDetail.swift
//  Med_Easy
//
//  Created by Suryansh Soni on 12/6/20.
//

import SwiftUI

struct medicineDetail: View {
    
    var med:Medicine
    
    var body: some View {
        VStack {
                    VStack(alignment: .leading) {
                        Text(med.genericname ?? "No value exist")
                            .font(.title)
                            .hoverEffect(.automatic)
                            .offset(y:100)
                            .offset()
                       
                        
                        VStack(alignment: .center) {
                            Text(med.pharmacology!)
                                .font(.title)
                                .offset(y:200)
                                
                            
                            Text(med.brandname!)
                                .font(.title)
                                .offset(y:400)
                            
                            Text(med.commonuses!)
                                .font(.title)
                                .offset(y:600)
                            
                        }
                    }
                    .padding()

                    Spacer()
                }
            }
}








struct medicineDetail_Previews: PreviewProvider {
    static var previews: some View {
        medicineDetail(med: Medicine.init())
    }
}
