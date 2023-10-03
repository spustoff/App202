//
//  ArtView.swift
//  App202
//
//  Created by IGOR on 28/09/2023.
//

import SwiftUI

struct ArtView: View {
    
    @State var artStatus: Bool = false
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
                    
                    Text("Art")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                }
                .padding(.top)
                
                VStack(alignment: .leading) {
                    
                    Image("art2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    
                    Text("+\(Double.random(in: 1...3)) %")
                        .foregroundColor(.green)
                        .font(.system(size: 12, weight: .regular))
                        .padding()
                    
                    Text("Free Feathers")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                        .padding(.horizontal)
                    
                    Text("Alexandr Ivanov")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.horizontal)
                        .padding(.top,2)
                    
                    Text("Oil, acrylic")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.horizontal)
                    
                    Text("2010")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.horizontal)
                    
                    Text("$ 25.140")
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
                    
                    artStatus = true
                    
                    investment += 1
                    
                }, label: {
                    
                    if artStatus == false {
                        
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
                .disabled(artStatus == true ? true : false )
                .opacity(artStatus == true ? 0.5 : 1)
            }
        }
    }
}

struct ArtView_Previews: PreviewProvider {
    static var previews: some View {
        ArtView()
    }
}
