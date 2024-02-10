//
//  SettingsView.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @State var isReset: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {

                HStack {
                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .medium))
                    
                    Spacer()
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
//                    Button(action: {}, label: {
//                        
//                        HStack {
//                         
//                            VStack(alignment: .leading) {
//                                
//                                Image(systemName: "square.and.arrow.up.fill")
//                                    .foregroundColor(.white)
//                                    .font(.system(size: 28, weight: .regular))
//                                    .padding(.bottom, 5)
//                                
//                                Text("Share app")
//                                    .foregroundColor(.white.opacity(0.7))
//                                    .font(.system(size: 15, weight: .regular))
//                            }
//                            Spacer()
//                        }
//                        .padding()
//                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("bg4")))
//                    })
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                         
                            VStack(alignment: .leading) {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 28, weight: .regular))
                                    .padding(.bottom, 5)
                                
                                Text("Rate app")
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.system(size: 15, weight: .regular))

                            }
                            Spacer()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("bg4")))
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/4545216f-0033-4da2-b7de-5d7acec5ab62") else {
                            
                            return
                        }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                         
                            VStack(alignment: .leading) {
                                
                                Image(systemName: "doc.text.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 28, weight: .regular))
                                    .padding(.bottom, 5)
                                
                                Text("Usage profile")
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.system(size: 15, weight: .regular))

                            }
                            Spacer()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("bg4")))
                    })
                    
                    Button(action: {
                        
                        isReset = true
                        
                    }, label: {
                        
                        HStack {
                         
                            VStack(alignment: .leading) {
                                
                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .foregroundColor(.white)
                                    .font(.system(size: 28, weight: .regular))
                                    .padding(.bottom, 5)
                                
                                Text("Reset progress")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))

                            }
                            Spacer()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color.red))
                    })
                }
            }
            .padding()
        }
        .overlay (
        
            ZStack {
                
                Color.black.opacity(isReset ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        isReset = false
                    }
                
                VStack {
                    
                    Text("Reset Confirmation")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(2)
                        .padding(.top)
                    
                    Text("Your progress will be permanently reset. Do you really want to delete all data?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteAllData()
                        
                        isReset = false
                        
                    }, label: {
                        
                        Text("Reset")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                    })
                    .padding(9)
                    
                    Button(action: {
                        
                        isReset = false
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.red)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                    })
                    .padding(9)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).fill(Color("res")))
                .padding()
                .offset(y: isReset ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SettingsView()
}
