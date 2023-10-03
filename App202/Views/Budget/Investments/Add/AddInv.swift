//
//  AddInv.swift
//  App202
//
//  Created by IGOR on 28/09/2023.
//

import SwiftUI

struct AddInv: View {
    
    @StateObject var viewModel = AddBudgetViewModel()
    @StateObject var budgetModel: BudgetViewModel
    @AppStorage("investment") var investment: Int = 0
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Add investment")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .medium))
                    .padding(.top)
                                    
                    HStack {

                        ZStack(alignment: .leading, content: {
                            
                            Text("USD")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)

                        })
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack {

                        ZStack(alignment: .leading, content: {
                            
                            Text("Title")
                                .foregroundColor(viewModel.invName.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.invName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.invName)
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                        })
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack {

                        ZStack(alignment: .leading, content: {
                            
                            Text("Sum")
                                .foregroundColor(viewModel.invSum.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.invSum.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.invSum)
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                        })
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                    .padding(.horizontal)
                    .padding(.top)
                    
                Button(action: {
                    
                    viewModel.addToHistory2 {
                        
                        budgetModel.fetchHistory2()
                        
                        router.wrappedValue.dismiss()
                        
                        viewModel.invSum = ""
                        viewModel.invName = ""

                    }
                    
                    investment += 1
                                        
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue")))
                        .padding()
                })
                .opacity(viewModel.invSum.isEmpty || viewModel.invName.isEmpty ? 0.5 : 1)
                .disabled(viewModel.invSum.isEmpty || viewModel.invName.isEmpty ? true : false)
                
                Spacer()
                
                }
        }
    }
}

struct AddInv_Previews: PreviewProvider {
    static var previews: some View {
        AddInv(viewModel: AddBudgetViewModel(), budgetModel: BudgetViewModel())
    }
}
