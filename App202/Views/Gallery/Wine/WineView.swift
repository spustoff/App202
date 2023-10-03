//
//  WineView.swift
//  App202
//
//  Created by IGOR on 28/09/2023.
//

import SwiftUI

struct WineView: View {
    
    @State var wineStatus: Bool = false
    @AppStorage("investment") var investment: Int = 0
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack{
            
            Color.black.opacity(0.1)
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.blue)
                                .font(.system(size: 15, weight: .regular))
                        })
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Text("Wine")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                }
                .padding(.top)
                
                VStack(alignment: .leading) {
                    
                    Image("coin2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    
                    Text("+\(Double.random(in: 1...3)) %")
                        .foregroundColor(.green)
                        .font(.system(size: 12, weight: .regular))
                        .padding()
                    
                    Text("Le Grand Cru")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                        .padding(.horizontal)
                    
                    Text("Chardonnay 100%")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.horizontal)
                        .padding(.top,2)
                    
                    Text("France, Languedoc-Roussillon")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.horizontal)
                    
                    Text("0.75 l, 1998")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.horizontal)
                    
                    Text("$ \(String(format: "%.2f", Double.random(in: 14000...16000)))")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                        .padding(.horizontal)
                        .padding(.top, 30)
                        .padding(.bottom)
                }
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                .padding()
                
                Spacer()
                
                Button(action: {
                    
                    wineStatus = true
                    investment += 1
                    
                }, label: {
                    
                    if wineStatus == false {
                        
                        Text("Invest")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.blue))
                            .padding()
                        
                    } else {
                        
                        Text("Invested")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.blue))
                            .padding()
                
                    }
                })
                .disabled(wineStatus == true ? true : false )
                .opacity(wineStatus == true ? 0.5 : 1)
            }
        }
    }
}

struct WineView_Previews: PreviewProvider {
    static var previews: some View {
        WineView()
    }
}
