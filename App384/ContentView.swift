//
//  ContentView.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI
import Amplitude

struct ContentView: View {
    
    @State var selected_tab: Tab = Tab.Articles
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            if status  {
                
                VStack(spacing: 8) {
                    
                    TabView(selection: $selected_tab,
                            content:  {
                        
                        ArticlesView()
                            .tag(Tab.Articles)
                        
                        EventsView()
                            .tag(Tab.Events)
                        
                        
                        BudgetView()
                            .tag(Tab.Budget)
                        
                        
                        PostsView()
                            .tag(Tab.Posts)
                        
                        
                        SettingsView()
                            .tag(Tab.Settings)
                        
                    })
                    
                    TabBar(selectedTab: $selected_tab)
                }
                .ignoresSafeArea()
                .onAppear {
                    
                    Amplitude.instance().logEvent("main_screen")
                }
                
            } else {
 
                OB_1()
            }
        }
    }
}
