//
//  PostsView.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI

struct PostsView: View {
    
    @StateObject var viewModel = PostsViewModel()
    
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
                    
                    Text("Posts")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .medium))
                    
                    Spacer()
                }
                
                if viewModel.posts.isEmpty {
                    
                    VStack {
                        
                        Text("No posts added")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .medium))
                            .padding(.vertical, 6)
                        
                        Text("You don't have any posts added")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                        
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack {
                            
                            ForEach(viewModel.posts, id: \.self) { index in
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Text((index.postDate ?? Date())
                                            .convertDate(format: "MMM d HH:mm"))
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .regular))
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        
                                        Text(index.postName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        Spacer()

                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchPosts()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            PostDetail(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddPost(viewModel: viewModel)
        })
    }
}

#Preview {
    PostsView()
}
