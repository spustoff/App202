//
//  LoadingView.swift
//  App202
//
//  Created by IGOR on 25/09/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("blue")
                .ignoresSafeArea()
            
            VStack {
                
                Image("logo")
                
                Text("BudgetBuddy")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                
            }
            .padding()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
