//
//  MainView.swift
//  TimeFinder
//
//  Created by Peter Kos on 6/9/22.
//

import SwiftUI


struct MainNavigation: View {

    var body: some View {

        NavigationView {
            TabView {
                
                MeetingsView()
                    .tabItem {
                        Label("Meetings", systemImage: "list.bullet.below.rectangle")
                    }
                CreateView()
                    .tabItem {
                        Label("Create", systemImage: "clock")
                    }
                TeamView()
                    .tabItem {
                        Label("Team", systemImage: "person.wave.2")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }

}


struct MainNavigation_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigation()
    }
}
