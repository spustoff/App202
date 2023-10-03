//
//  TabBar.swift
//  App202
//
//  Created by IGOR on 28/09/2023.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    @State var tabs: [Tab] = [Tab.Budget, Tab.Gallery, Tab.Profile]
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 9, content: {

                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("blue") : Color.gray)
                            .frame(height: 25)
                        
                        
                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("blue") : Color.gray)
                            .font(.system(size: 13, weight: .regular))
                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 9)
        .padding(.bottom, 20)
        .background(Color.gray.opacity(0.05))
    }
}

enum Tab: String, CaseIterable {
    
    case Budget = "Budget"
    
    case Gallery = "Gallery"
    
    case Profile = "Profile"
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
