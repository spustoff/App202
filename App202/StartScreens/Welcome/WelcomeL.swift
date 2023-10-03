//
//  WelcomeL.swift
//  App202
//
//  Created by IGOR on 25/09/2023.
//

import SwiftUI

struct WelcomeL: View {
    
    @AppStorage("status") var status: Bool = false
    
    @AppStorage("name") var name = ""
    @AppStorage("password") var password = ""

    var body: some View {

        ZStack {
            
            Color("blue")
                .ignoresSafeArea()
            
            VStack {
                
                Image("chart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
            }
            
            VStack {
                
                Text("Welcome back")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .semibold))
                    .padding(.bottom, 3)
                    .padding(.top, 30)
                
                Text("Log in complete with other users")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .regular))
                
                HStack {

                    ZStack(alignment: .leading, content: {
                        
                        Text("Name")
                            .foregroundColor(name.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(name.isEmpty ? 1 : 0)
                        
                        TextField("", text: $name)
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
                        
                        Text("Password")
                            .foregroundColor(password.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(password.isEmpty ? 1 : 0)
                        
                        TextField("", text: $password)
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .medium))
                    })
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                .padding(.horizontal)
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Log In")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue")))
                        .padding(.top)
                        .padding(.horizontal)
                })
                .disabled(name.isEmpty || password.isEmpty ? true : false)
                .opacity(name.isEmpty || password.isEmpty ? 0.5 : 1)
                
                NavigationLink(destination: {
                    
                    WelcomeS()
                        .navigationBarBackButtonHidden()
                    
                }, label:  {
                    
                    Text("Sign Up")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .padding(.horizontal)
                })
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .background(Color.white.ignoresSafeArea())
            .padding(.top, 100)
        }
    }
}

struct WelcomeL_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeL()
    }
}
