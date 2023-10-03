//
//  ProfileView.swift
//  App202
//
//  Created by IGOR on 28/09/2023.
//

import SwiftUI
import StoreKit
import CoreData

struct ProfileView: View {
    
    @AppStorage("name") var name = ""
    @AppStorage("password") var password = ""
    @AppStorage("saved_history") var saved_history: [String] = []
    @State var isReset: Bool = false
    @State var artStatus: Bool = false
    @State var coinStatus: Bool = false
    @State var wineStatus: Bool = false
    @AppStorage("investment") var investment: Int = 0
    
    @AppStorage("status") var status: Bool = false
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.black.opacity(0.1)
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .padding(20)
                        
                        Text("Profile")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                            .padding(6)
                        
                        Text("You can change your data")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text(name)
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .padding(6)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 280)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    .padding()
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/20708f4e-3520-4d74-9d39-3ffd40615526") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                            
                            Text("Usage policy")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        .padding(.horizontal)
                    })
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Text("Rate Us")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        .padding(.horizontal)
                    })

                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            isReset = true
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        .padding(.horizontal)
                    })
                    
                }
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .overlay (
            
            ZStack {
                
                Color.black.opacity(isReset ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isReset = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete your account?")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .semibold))
                        .padding()
                    
                    Text("All your data and account will be deleted")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        deleteAllData()
                        artStatus = false
                        coinStatus = false
                        wineStatus = false
                        investment = 0
                        name = ""
                        password = ""
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                        
                        status = false
                        
                    }, label: {
                        
                        Text("Reset")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(1)))
                .padding()
                .offset(y: isReset ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
    
    func deleteAllData() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "HistoryModel")
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            
            try context.execute(deleteRequest)
            
            saved_history.removeAll()
            
        } catch let error as NSError {
            
            print("Error deleting all history: \(error), \(error.userInfo)")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
