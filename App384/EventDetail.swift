//
//  EventDetail.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI

struct EventDetail: View {
    
    @StateObject var viewModel: EventsViewModel
    
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
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteEvent(withEventsName: viewModel.selectedEvents?.evHeadline ?? "", completion: {
                            
                            viewModel.fetchEvents()
                        })
                        
                        viewModel.isDetail = false
                        
                    }, label: {
                        
                        Image(systemName: "trash")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    })
                }
                
                HStack {
                    
                    Text(viewModel.selectedEvents?.evHeadline ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .medium))
                    
                    Spacer()
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack {
                        
                        Text(viewModel.selectedEvents?.evArena ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                        
                        Text(viewModel.selectedEvents?.evDate ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .padding(3)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("primary")))
                    }
                    
                    HStack {
                        
                        Spacer()
                        
                        VStack {
                            
                            Text(viewModel.selectedEvents?.evPT1 ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .bold))
                            
                            Text(viewModel.selectedEvents?.evTeam1 ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        }
                        
                        Spacer()
                        
                        Text(":")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .bold))
                        
                        Spacer()
                        
                        VStack {
                            
                            Text(viewModel.selectedEvents?.evPT2 ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .bold))
                            
                            Text(viewModel.selectedEvents?.evTeam2 ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        }
                        
                        Spacer()
                        
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    EventDetail(viewModel: EventsViewModel())
}
