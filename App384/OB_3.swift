//
//  OB_3.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI

struct OB_3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("OB_3")
                    .resizable()
                    .ignoresSafeArea()
                
                HStack {

                    Circle()
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color("primary"))
                        .frame(width: 8, height: 8)
                }
                .padding(.vertical)
                
                Text("Smart notes")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                
                Text("Integrated notes to help you in the events")
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .regular))
                    .padding(.vertical, 1)
                
                Button(action: {

                    status = true
                    
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
    OB_3()
}
