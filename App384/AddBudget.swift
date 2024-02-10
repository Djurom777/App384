//
//  AddBudget.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI

struct AddBudget: View {
    
    @StateObject var viewModel: BudgetsViewModel
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
                    
                    if viewModel.currentType == "Income" {
                        
                        Text("New Income")
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .medium))
                        
                    } else {
                        
                        Text("New Expense")
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .medium))
                    }
                    
                    Spacer()
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Title")
                            .foregroundColor(viewModel.budTitle.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.budTitle.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.budTitle)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.budTitle.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    HStack {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Date")
                                .foregroundColor(viewModel.budDate.isEmpty ? .gray : . white)
                                .font(.system(size: 15, weight: .medium))
                                .opacity(viewModel.budDate.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.budDate)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.budDate.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                        .padding(1)
                        
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Sum")
                                .foregroundColor(viewModel.budSum.isEmpty ? .gray : . white)
                                .font(.system(size: 15, weight: .medium))
                                .opacity(viewModel.budSum.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.budSum)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.budSum.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                        .padding(1)
                        
                    }
                }
                
                Button(action: {
                    
                    viewModel.budType = viewModel.currentType
                    
                    viewModel.addBudget(completion: {
                        
                        viewModel.budType = ""
                        viewModel.budTitle = ""
                        viewModel.budSum = ""
                        viewModel.budDate = ""
                        
                    })
                    
                    viewModel.fetchBudgets()
                    
                    presentationMode.wrappedValue.dismiss()
                        
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                })
                .opacity(viewModel.budTitle.isEmpty || viewModel.budDate.isEmpty || viewModel.budSum.isEmpty || viewModel.currentType.isEmpty ? 0.5 : 1)
                .disabled(viewModel.budTitle.isEmpty || viewModel.budDate.isEmpty || viewModel.budSum.isEmpty || viewModel.currentType.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddBudget(viewModel: BudgetsViewModel())
}
