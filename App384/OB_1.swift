//
//  OB_1.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI

struct OB_1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("OB_1")
                    .resizable()
                    .ignoresSafeArea()
                
                HStack {
                    
                    Circle()
                        .fill(Color("primary"))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 8, height: 8)
                }
                .padding(.vertical)
                
                Text("App for the journalists")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                
                Text("Add and manage your arcticles")
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .regular))
                    .padding(.vertical, 1)
                
                NavigationLink(destination: {
                    
                    OB_2()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        
                })
                .padding()
                .padding(.top)
            }
        }
    }
}

#Preview {
    OB_1()
}
