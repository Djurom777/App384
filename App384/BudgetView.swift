//
//  BudgetView.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI

struct BudgetView: View {
    
    @StateObject var viewModel = BudgetsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Menu(content: {
                        
                        ForEach(viewModel.types, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentType = index
                                viewModel.isAdd = true
                                
                            }, label: {
                                
                                HStack {
                                    
                                    if index == "Income" {
                                        
                                        Image(systemName: "arrow.up")
                                            .foregroundColor(.green)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                    } else {
                                        
                                        Image(systemName: "arrow.down")
                                            .foregroundColor(.red)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                    }
                                                                        
                                    Text(index)
                                                                        
                                }
                            })
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("bg"))
                            .font(.system(size: 16, weight: .regular))
                            .padding(5)
                            .background(Circle().fill(Color("primary")))
                    })
                }
                
                HStack {
                    
                    Text("Budget")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .medium))
                    
                    Spacer()
                }
                
                HStack {
                    
                    ForEach(viewModel.categories, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentCat = index
                            viewModel.fetchBudgets()
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .background(RoundedRectangle(cornerRadius: 15).fill(viewModel.currentCat == index ? Color("primary") : Color("bg3").opacity(0)))
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg4")))
                .padding(.bottom)
                
                if viewModel.budgets.isEmpty {
                    
                    VStack {
                        
                        Text("No \(viewModel.currentCat) added")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                        
                        Text("Add an \(viewModel.currentCat) with the plus icon above")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                        
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {

                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
       
                            ForEach(viewModel.budgets, id: \.self) { index in
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Text(index.budDate ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                            CoreDataStack.shared.deleteBudget(withBudTitle: index.budTitle ?? "", completion: {
                                                
                                                viewModel.fetchBudgets()
                                            })
                                            
                                        }, label: {
                                            
                                            Image(systemName: "trash")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 16, weight: .regular))
                                        })
                                    }
                                    
                                    HStack {
                                    
                                    Text(index.budTitle ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .medium))
                                        
                                        Spacer()
                                              
                                              }
                                    .padding(.bottom, 20)
                                    
                                    HStack {

                                        if index.budType == "Income" {
                                            
                                            Text("+$\(index.budSum ?? "")")
                                                .foregroundColor(.green)
                                                .font(.system(size: 26, weight: .bold))
                                            
                                        } else {
                                            
                                            Text("-$\(index.budSum ?? "")")
                                                .foregroundColor(.red)
                                                .font(.system(size: 26, weight: .bold))
                                        }
                                        
                                        Spacer()
                                    }
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg4")))
                            }
                        })
                    }

                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchBudgets()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddBudget(viewModel: viewModel)
        })
    }
}

#Preview {
    BudgetView()
}
