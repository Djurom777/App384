//
//  AddArticle.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI

struct AddArticle: View {
    
    @StateObject var viewModel: ArticlesViewModel
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
                    
                    Text("New articles")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .medium))
                    
                    Spacer()
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("HeadLine")
                            .foregroundColor(viewModel.artHeadliner.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.artHeadliner.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.artHeadliner)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.artHeadliner.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            ForEach(viewModel.categories, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentCat = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 12, weight: .regular))
                                        .padding(5)
                                        .padding(.horizontal, 6)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary").opacity(viewModel.currentCat == index ? 1 : 0.5)))
                                })
                            }
                        }
                    }
                    .frame(height: 30)
                    .padding(.vertical, 9)
                    
                    Menu(content: {
                        
                        ForEach(viewModel.statusVariant, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.currentStatus = index
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                            })
                        }
                        
                    }, label: {
                        
                        if viewModel.currentStatus.isEmpty {
                            
                            HStack {
                                
                                Text("Status")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Image(systemName: "chevron.down")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                            }
                            
                        } else {
                            
                            HStack {
                                
                                Text("\(viewModel.currentStatus)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Image(systemName: "chevron.up")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                            }
                        }
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.currentStatus.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Publisher")
                            .foregroundColor(viewModel.artPublisher.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.artPublisher.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.artPublisher)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.artPublisher.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Article text")
                            .foregroundColor(viewModel.artText.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.artText.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.artText)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.artText.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                }
                
                Button(action: {
                    
                    viewModel.artCat = viewModel.currentCat
                    viewModel.artStatus = viewModel.currentStatus
                    
                    viewModel.addArticle(completion: {
                        
                        viewModel.artHeadliner = ""
                        viewModel.artCat = ""
                        viewModel.artStatus = ""
                        viewModel.artPublisher = ""
                        viewModel.artText = ""
                    })
                    
                    viewModel.fetchArticles()
                    
                    presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                })
                .opacity(viewModel.artHeadliner.isEmpty || viewModel.currentCat.isEmpty || viewModel.currentStatus.isEmpty || viewModel.artPublisher.isEmpty || viewModel.artText.isEmpty ? 0.5 : 1)
                .disabled(viewModel.artHeadliner.isEmpty || viewModel.currentCat.isEmpty || viewModel.currentStatus.isEmpty || viewModel.artPublisher.isEmpty || viewModel.artText.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddArticle(viewModel: ArticlesViewModel())
}
