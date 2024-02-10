//
//  EventsView.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI

struct EventsView: View {
    
    @StateObject var viewModel = EventsViewModel()
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
                    
                    Text("Events")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .medium))
                    
                    Spacer()
                }
                .padding(.bottom)
                
                if viewModel.events.isEmpty {
                    
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
                        
                        ForEach(viewModel.events, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.selectedEvents = index
                                viewModel.isDetail = true
                                
                            }, label: {
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Text(index.evDate ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12, weight: .regular))
                                            .padding(3)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                                        
                                        
                                        Spacer()
                                        
                                        Text(index.evArena ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                    }
                                    
                                    HStack {
                                        
                                        Text(index.evTeam1 ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .medium))
                                        
                                        Text("VS")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .medium))
                                        
                                        Text(index.evTeam2 ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .medium))
                                        
                                        Spacer()
                                    }
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg4")))
                            })
                        }
                    }
                }
            }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchEvents()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            EventDetail(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddEvent(viewModel: viewModel)
        })
    }
}

#Preview {
    EventsView()
}
