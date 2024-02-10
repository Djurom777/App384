//
//  LoadingView.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
            }
        }
    }
}

#Preview {
    LoadingView()
}
