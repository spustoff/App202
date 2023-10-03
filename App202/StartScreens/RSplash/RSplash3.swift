//
//  RSplash3.swift
//  App202
//
//  Created by IGOR on 25/09/2023.
//

import SwiftUI

struct RSplash3: View {
    
    
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("RSplash3")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 6, content: {
                    
                    Text("Recommendations")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("The best investments for your budget")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                .padding(.bottom, 60)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    WelcomeL()
                        .navigationBarBackButtonHidden()
                    
                }, label:  {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue")))
                        .padding()
                })
            }
        }
    }
}

struct RSplash3_Previews: PreviewProvider {
    static var previews: some View {
        RSplash3()
    }
}
