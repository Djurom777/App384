//
//  AddEvent.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI

struct AddEvent: View {

    @StateObject var viewModel: EventsViewModel
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
                            .foregroundColor(viewModel.evHeadline.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.evHeadline.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.evHeadline)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.evHeadline.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Arena")
                            .foregroundColor(viewModel.evArena.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.evArena.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.evArena)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.evArena.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Date")
                            .foregroundColor(viewModel.evDate.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.evDate.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.evDate)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.evDate.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                
                ZStack(alignment: .leading, content: {
                    
                    Text("Team 1")
                        .foregroundColor(viewModel.evTeam1.isEmpty ? .gray : . white)
                        .font(.system(size: 15, weight: .medium))
                        .opacity(viewModel.evTeam1.isEmpty ? 1 : 0)
                    
                    TextField("", text: $viewModel.evTeam1)
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                })
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.evTeam1.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                .padding(1)
            
            ZStack(alignment: .leading, content: {
                
                Text("Team 2")
                    .foregroundColor(viewModel.evTeam2.isEmpty ? .gray : . white)
                    .font(.system(size: 15, weight: .medium))
                    .opacity(viewModel.evTeam2.isEmpty ? 1 : 0)
                
                TextField("", text: $viewModel.evTeam2)
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .medium))
            })
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.evTeam2.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
            .padding(1)
        
        ZStack(alignment: .leading, content: {
            
            Text("Team 1 score")
                .foregroundColor(viewModel.evPT1.isEmpty ? .gray : . white)
                .font(.system(size: 15, weight: .medium))
                .opacity(viewModel.evPT1.isEmpty ? 1 : 0)
            
            TextField("", text: $viewModel.evPT1)
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .medium))
        })
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.evPT1.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
        .padding(1)
        
        ZStack(alignment: .leading, content: {
            
            Text("Team 2 score")
                .foregroundColor(viewModel.evPT2.isEmpty ? .gray : . white)
                .font(.system(size: 15, weight: .medium))
                .opacity(viewModel.evPT2.isEmpty ? 1 : 0)
            
            TextField("", text: $viewModel.evPT2)
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .medium))
        })
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.evPT2.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
        .padding(1)
        
    }
                
                Button(action: {

                    viewModel.addEvent(completion: {
                        
                        viewModel.evHeadline = ""
                        viewModel.evDate = ""
                        viewModel.evArena = ""
                        viewModel.evTeam1 = ""
                        viewModel.evTeam2 = ""
                        viewModel.evPT1 = ""
                        viewModel.evPT2 = ""

                    })
                    
                    viewModel.fetchEvents()
                    
                    presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                })
                .opacity(viewModel.evHeadline.isEmpty || viewModel.evArena.isEmpty || viewModel.evDate.isEmpty || viewModel.evTeam1.isEmpty || viewModel.evTeam2.isEmpty || viewModel.evPT1.isEmpty || viewModel.evPT2.isEmpty ? 0.5 : 1)
                .disabled(viewModel.evHeadline.isEmpty || viewModel.evArena.isEmpty || viewModel.evDate.isEmpty || viewModel.evTeam1.isEmpty || viewModel.evTeam2.isEmpty || viewModel.evPT1.isEmpty || viewModel.evPT2.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddEvent(viewModel: EventsViewModel())
}
