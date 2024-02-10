//
//  OB_2.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI

struct OB_2: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("OB_2")
                    .resizable()
                    .ignoresSafeArea()
                
                HStack {

                    Circle()
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color("primary"))
                        .frame(width: 8, height: 8)
                    
                    
                    Circle()
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 8, height: 8)
                }
                .padding(.vertical)
                
                Text("Manage your budget")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                
                Text("Add your statistics and earn more")
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .regular))
                    .padding(.vertical, 1)
                
                NavigationLink(destination: {
                    
                    OB_3()
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
    OB_2()
}
