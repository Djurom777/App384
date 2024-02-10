//
//  PostDetail.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI

struct PostDetail: View {
    
    @StateObject var viewModel: PostsViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(.white.opacity(0.2))
                    .frame(width: 40, height: 3)
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack {
                        
                        Text((viewModel.selectedPost?.postDate ?? Date())
                            .convertDate(format: "MMM d HH:mm"))
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .regular))
                        
                        Spacer()
                    }
                    
                    HStack {
                        
                        Text(viewModel.selectedPost?.postName ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                        
                        Spacer()
                    }
                    
                    Text(viewModel.selectedPost?.postText ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.leading)
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    PostDetail(viewModel: PostsViewModel())
}
