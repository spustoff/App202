//
//  GalleryView.swift
//  App202
//
//  Created by IGOR on 28/09/2023.
//

import SwiftUI

struct GalleryView: View {
    
    @StateObject var viewModel = BudgetViewModel()
    
    @AppStorage("name") var name = ""
    @AppStorage("password") var password = ""
    @AppStorage("mbudget") var mbudget: Int = 0
    
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
                    
                    NavigationLink(destination: {
                        
                        
                    }, label: {
                        
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
                    })
                    .disabled(true)
                    
                    NavigationLink(destination: {
                        
                        ArtView()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Art")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top)
                                .padding(.horizontal)
                            
                            Text("Objects of modern art")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                            
                            Spacer()
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 140)
                        .background(Image("art")
                            .resizable()
                            .cornerRadius(10))
                    })
                    
                    NavigationLink(destination: {
                        
                        CoinView()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Coins")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top)
                                .padding(.horizontal)
                            
                            Text("High-growth coins")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                            
                            Spacer()
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 140)
                        .background(Image("coins")
                            .resizable()
                            .cornerRadius(10))
                    })
                    
                    NavigationLink(destination: {
                        
                        WineView()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Wine")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top)
                                .padding(.horizontal)
                            
                            Text("Drinks that go up in price")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                            
                            Spacer()
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 140)
                        .background(Image("wine")
                            .resizable()
                            .cornerRadius(10))
                        
                    })
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
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
