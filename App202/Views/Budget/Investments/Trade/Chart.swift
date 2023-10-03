//
//  Chart.swift
//  App202
//
//  Created by IGOR on 28/09/2023.
//

import SwiftUI

struct Chart: View {
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
           
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                    })
                }
                .padding()
                
                Text("\(Double.random(in: 0.85...0.99))")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Text("+\(Double.random(in: 1...3))%")
                    .foregroundColor(.green)
                    .font(.system(size: 12, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
        
                        TradeChart()
                            .disabled(true)
            }
        }
        
    }
}

struct Chart_Previews: PreviewProvider {
    static var previews: some View {
        Chart()
    }
}
