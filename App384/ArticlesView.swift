//
//  ArticlesView.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI

struct ArticlesView: View {
    
    @StateObject var viewModel = ArticlesViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.isAdd = true
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("bg"))
                            .font(.system(size: 16, weight: .regular))
                            .padding(5)
                            .background(Circle().fill(Color("primary")))
                    })
                }
                
                HStack {
                    
                    Text("Articles")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .medium))
                    
                    Spacer()
                }
                .padding(.bottom)
                
                if viewModel.articles.isEmpty {
                    
                    VStack {
                        
                        Text("No articles added")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .medium))
                        
                        Text("Add an article with the plus icon above")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                        
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack {
                            
                            ForEach(viewModel.articles, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedArticle = index
                                    
                                    viewModel.isDetail = true
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Text(index.artCat ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12, weight: .regular))
                                                .padding(3)
                                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("primary")))
                                            
                                            Spacer()
                                        }
                                        
                                        Text(index.artHeadliner ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .medium))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 25).fill(Color("bg3")))
                                })
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchArticles()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            ArticleDetail(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddArticle(viewModel: viewModel)
        })
    }
}

#Preview {
    ArticlesView()
}
