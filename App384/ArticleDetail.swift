//
//  ArticleDetail.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI

struct ArticleDetail: View {
    
    @StateObject var viewModel: ArticlesViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        viewModel.isDetail = false
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                    })
                    
                    Spacer()
                }
                
                HStack {
                    
                    Text(viewModel.selectedArticle?.artHeadliner ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .medium))
                    
                    Spacer()
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {

                    HStack {
                        
                        Text(viewModel.selectedArticle?.artStatus ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                        
                        Text(viewModel.selectedArticle?.artCat ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .padding(3)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("primary")))
                    }
                    
                    HStack {
                        
                        Text(viewModel.selectedArticle?.artPublisher ?? "")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                    }
                    
                    Text(viewModel.selectedArticle?.artText ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                }
            }
            .padding()
        }
    }
}

#Preview {
    ArticleDetail(viewModel: ArticlesViewModel())
}
