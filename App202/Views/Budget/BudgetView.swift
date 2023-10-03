//
//  BudgetView.swift
//  App202
//
//  Created by IGOR on 25/09/2023.
//

import SwiftUI

struct BudgetView: View {
    
    @StateObject var viewModel = BudgetViewModel()
    
    @AppStorage("name") var name = ""
    @AppStorage("password") var password = ""
    @AppStorage("mbudget") var mbudget: Int = 0
    @AppStorage("investment") var investment: Int = 0
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Image(systemName: "photo")
                        .foregroundColor(.black)
                    
                    Text(name)
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(.vertical)
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            if viewModel.getItems().isEmpty {
                                
                            } else {
                                
                                ForEach(viewModel.getItems(), id: \.self) { index in
                                    
                                    if index.budgetSum == 0 {
                                        
                                        
                                    } else {
                                        
                                        VStack(alignment: .leading, spacing: 8) {
                                            
                                            Text("$ \(index.budgetSum)")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .medium))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Text("\(index.budgetName ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .regular))
                                        }
                                        .padding()
                                        .frame(width: 150, height: 100)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue")))
                                        
                                    }
                                }
                            }
                            
                            Button(action: {
                                
                                viewModel.isAdd = true
                                
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
                                .frame(width: 150, height: 100)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
                                
                            })
                        }
                    }
                    
                    NavigationLink(destination: {
                        
                        Investments()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        if #available(iOS 15.0, *) {
                            
                            VStack(alignment: .leading) {
                                
                                Text("Investments")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .medium))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top)
                                    .padding(.horizontal)
                                
                                Text("\(investment)")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                                
                                Spacer()
                                
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 140)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("black")))
                            .overlay {
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    Image("coupon")
                                }
                            }
                        } else {
                            // Fallback on earlier versions
                        }
                    })
                    
                    if #available(iOS 15.0, *) {
                        VStack(alignment: .leading) {
                            
                            Text("Recommendations")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top)
                                .padding(.horizontal)
                            
                            Text("no recommendations")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                            
                            Spacer()
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 140)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.1)))
                        .overlay {
                            
                            HStack {
                                
                                Spacer()
                                
                                Image("coupons")
                            }
                        }
                    } else {
                        // Fallback on earlier versions
                    }
                    
                    Spacer()
                    
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchHistory()
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddBudgetView(budgetModel: viewModel)
        })
    }
}

struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
    }
}
