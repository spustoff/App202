//
//  Investments.swift
//  App202
//
//  Created by IGOR on 28/09/2023.
//

import SwiftUI

struct Investments: View {
    
    @StateObject var viewModel = BudgetViewModel()
    @Environment(\.presentationMode) var router
    @State var isAddInv: Bool = false

    var body: some View {

        ZStack {
            
            Color.white
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
                    
                    Text("Investments")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    
                    Button(action: {
                        
                        isAddInv = true
                        
                    }, label: {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("+ Add new")
                                .foregroundColor(.black)
                                .font(.system(size: 24, weight: .semibold))
                            
                            Text("Main Budget")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                                .opacity(0)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
                        
                    })
                    .padding(.horizontal)
                    
                    VStack {
                        
                        if viewModel.getItems2().isEmpty {
                            
                        } else {
                            
                            ForEach(viewModel.getItems2(), id: \.self) { index in
                                
                                if index.invSum == 0 {
                                    
                                    
                                } else {
                                    
                                    VStack {
                                        
                                        Text("$ \(index.invSum)")
                                            .foregroundColor(.black)
                                            .font(.system(size: 20, weight: .medium))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.vertical, 4)
                                        
                                        Text("\(index.invName ?? "")")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Spacer()
                                        
                                        NavigationLink(destination: {
                                            
                                            Chart()
                                                .navigationBarBackButtonHidden()
                                            
                                        }, label: {
                                            
                                            Text("Manage")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 50)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                                        })
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 150)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.1)))
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchHistory2()
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .sheet(isPresented: $isAddInv, content: {
            
            AddInv(budgetModel: viewModel)
        })
    }
}

struct Investments_Previews: PreviewProvider {
    static var previews: some View {
        Investments()
    }
}
