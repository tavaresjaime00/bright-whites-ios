//
//  ContentView.swift
//  Brushem
//
//  Created by David Beach on 2023-05-16.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
     }
    
    var body: some View {
        
            TabView{
                howTo()
                    .tabItem{
                        Label("Tips", systemImage: "list.bullet.rectangle.fill")
                            
                    }.background(.black)
                count()
                    .tabItem{
                        Label("Brush Tracking", systemImage: "mouth.fill")
                            
                    }
                
            }
            .accentColor(.green)
            .background(.black)
            
            
    }
}

// timer setup
extension ContentView {
    final class TimerModel: ObservableObject {
        @Published var isActive = false
        @Published var showingTimerAlert = false
        @Published var time: String = "2:00"
        @Published var seconds: Float = 0.0
        @Published var minutes: Float = 2.0 {
            didSet {
                self.time = "\(Int(minutes)):00"
            }
        }
        private var initialTime = 0
        private var endDate = Date()
        
        func startTimer(minutes: Float) {
            self.initialTime = Int(minutes)
            self.endDate = Date()
            self.isActive = true
            self.endDate = Calendar.current.date(byAdding: .minute, value: Int(minutes), to: endDate)!
        }
        
        func pauseTimer(minutes: Float, seconds: Float) {
            self.minutes = Float(initialTime)
            self.isActive = false
            self.time = "\(Int(minutes)):\(Int(seconds))"
        }
        
        func resetTimer() {
            self.minutes = Float(initialTime)
            self.isActive = false
            self.time = "\(Int(minutes)):00"
        }
        
        func updateTimer() {
            guard isActive else { return }
            
            let now = Date()
            let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
            
            if diff <= 0 {
                self.isActive = false
                self.time = "2:00"
                self.showingTimerAlert = true
                return
            }
            
            let date = Date(timeIntervalSince1970: diff)
            let calendar = Calendar.current
            let minutes = calendar.component(.minute, from: date)
            let seconds = calendar.component(.second, from: date)
            
            self.minutes = Float(minutes)
            self.time = String(format: "%d:%02d", minutes, seconds)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

