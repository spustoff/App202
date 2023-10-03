//
//  AddBudgetView.swift
//  App202
//
//  Created by IGOR on 26/09/2023.
//

import SwiftUI

struct AddBudgetView: View {
    
    @StateObject var viewModel = AddBudgetViewModel()
    @StateObject var budgetModel: BudgetViewModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("New Budget")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .medium))
                    .padding(.top)
                                    
                    HStack {

                        ZStack(alignment: .leading, content: {
                            
                            Text("USD")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)

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
                                .foregroundColor(viewModel.budgetName.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.budgetName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.budgetName)
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
                                .foregroundColor(viewModel.budgetSum.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.budgetSum.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.budgetSum)
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                                .keyboardType(.decimalPad)
                        })
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                    .padding(.horizontal)
                    .padding(.top)
                    
                Button(action: {
                    
                    viewModel.addToHistory {
                        
                        budgetModel.fetchHistory()
                        
                        router.wrappedValue.dismiss()
                        
                        viewModel.budgetSum = ""
                        viewModel.budgetName = ""

                    }
                                        
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue")))
                        .padding()
                })
                .opacity(viewModel.budgetSum.isEmpty || viewModel.budgetName.isEmpty ? 0.5 : 1)
                .disabled(viewModel.budgetSum.isEmpty || viewModel.budgetName.isEmpty ? true : false)
                
                Spacer()
                
                }
        }
    }
}

struct AddBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        AddBudgetView(budgetModel: BudgetViewModel())
    }
}
