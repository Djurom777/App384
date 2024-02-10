//
//  AddPost.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI

struct AddPost: View {
    
    
    @StateObject var viewModel: PostsViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        presentationMode.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                    })
                    
                    Spacer()
                }
                
                HStack {
                    
                    Text("New post")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .medium))
                    
                    Spacer()
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Name post")
                            .foregroundColor(viewModel.postName.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.postName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.postName)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.postName.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Text")
                            .foregroundColor(viewModel.postText.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.postText.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.postText)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.postText.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                }
                    
                    Button(action: {
                        
                        viewModel.addPost(completion: {
                            
                            viewModel.postName = ""
                            viewModel.postText = ""
                            
                        })
                        
                        viewModel.fetchPosts()
                        
                        presentationMode.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Create")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                    })
                    .opacity(viewModel.postName.isEmpty || viewModel.postText.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.postName.isEmpty || viewModel.postText.isEmpty ? true : false)
                }
                .padding()
        }
    }
}

#Preview {
    AddPost(viewModel: PostsViewModel())
}
