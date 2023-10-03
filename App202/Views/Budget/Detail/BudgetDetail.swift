//
//  BudgetDetail.swift
//  App202
//
//  Created by IGOR on 26/09/2023.
//

import SwiftUI

struct BudgetDetail: View {
    
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
                                .padding(.horizontal)

                        })
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack {

                        Text(budgetModel.current_budget?.budgetName ?? "")
                            .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)

                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack {

                        Text("\(Int(budgetModel.current_budget?.budgetSum ?? 0))")
                            .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
  
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                    .padding(.horizontal)
                    .padding(.top)
                    
                Button(action: {
                    
//                    viewModel.addToHistory {
//
//                        budgetModel.fetchHistory()
//
//                        router.wrappedValue.dismiss()
//
//                        viewModel.budgetSum = ""
//                        viewModel.budgetName = ""
//
//                    }
                                        
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue")))
                        .padding()
                })
                
                Spacer()
                
                }
        }
    }
}

struct BudgetDetail_Previews: PreviewProvider {
    static var previews: some View {
        BudgetDetail(budgetModel: BudgetViewModel())
    }
}
