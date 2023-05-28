//
//  Count.swift
//  Brushem
//
//  Created by David Beach on 2023-05-16.
//

import SwiftUI
import Lottie

struct count: View {
    @AppStorage ("brushNum") private var brushNum = 0
    @State var showAlert = false
    @State var play = false
    
    @StateObject private var tm = ContentView.TimerModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width: Double = 250.0
    
    var body: some View {
        NavigationView {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.black)
                
            
            //if showAnimation == true {

            //}

                VStack(){
                    Text("Brush Tracking:")
                        .font(.system(size: 37, weight: .bold, design: .rounded))
                        .padding(.vertical, 0.0)
                        .foregroundColor(Color(red: 102/255, green: 217/255, blue: 106/255))
                    Text("Brush Points:      \(brushNum)")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .padding(.vertical, 0.0)
                        .foregroundColor(.gray)
                    if brushNum == 0 {
                        Text("Click the \"Yes, I brushed em\" button below to add to your brushed points")
                            .foregroundColor(Color(red: 239/255, green: 217/255, blue: 206/255))
                    }
                    RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20.0))
                        .padding()
                        .frame(width: 360, height: 300)
                        .foregroundColor(Color.gray.opacity(0.27))
                        .overlay(
                            VStack{
                                Text("Did you brush your bright whites?")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 26, weight: .bold, design: .rounded))
                                    .padding()
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 20)
                                Button{
                                    showAlert = true
                                } label: {
                                    Rectangle()
                                        .frame(width: 200, height: 60)
                                        .foregroundColor(Color.green)
                                        .cornerRadius(15)
                                        .overlay(
                                            Text("Yes, I brushed em")
                                                .foregroundColor(Color.black)
                                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                                .padding()
                                        )
                                }
                                
                                .alert(isPresented:$showAlert) {
                                    Alert(
                                        title: Text("Did you REALLY brush em? and floss?"),
                                        message: Text("lying makes baby Jesus cry"),
                                        primaryButton: .default(Text("Yes, I did Brush and Floss Em")) {
                                            brushNum += 100
                                            play = true
                                        },
                                        secondaryButton: .destructive(Text("I didn't really brush em 🥺")) {
                                            brushNum -= 50
                                        }
                                    )
                                }
                                
                                NavigationLink(destination: warning().toolbarColorScheme(ColorScheme.dark) ){
                                    Rectangle()
                                        .frame(width: 200, height: 60)
                                        .foregroundColor(Color.red)
                                        .cornerRadius(15)
                                        .overlay(
                                            Text("No, i've been bad")
                                                .foregroundColor(Color.black)
                                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                                .padding()
                                        )
                                }.accentColor(Color.black)
                                Spacer()
                            }
                            
                        )
                    Text("Brushing Timer").font(.system(size: 30, weight: .heavy, design: .rounded)).foregroundColor(.white)
                    // 2-minute timer goes here
                    RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20.0))
                        .padding()
                        .frame(width: 360, height: 170)
                        .foregroundColor(Color.gray.opacity(0.27))
                        .overlay(
                            Text("\(tm.time)")
                                .font(.system(size: 80, weight: .medium, design: .rounded))
                                .foregroundColor(.green)
                                .alert("All Done, Great Work! Your bright whites are sparkling!", isPresented: $tm.showingTimerAlert) {
                                    Button("Continue", role: .cancel) {
                                        LottiePlusView(name: "Confetti", play: $play)
                                            .allowsHitTesting(false)
                                            .id(brushNum)
                                    }
                                }
                        )
                    HStack(spacing: -20.0) {
                        RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20.0))
                            .padding()
                            .frame(width: 200, height: 100)
                            .foregroundColor(Color.green.opacity(0.27))
                            .overlay(
                                Button("Begin") {
                                    tm.startTimer(minutes: 2.0)
                                }
                                .disabled(tm.isActive)
                                .foregroundColor(.green)
                                .font(.system(size: 30, weight: .medium, design: .rounded))
                        )
                        RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20.0))
                            .padding()
                            .frame(width: 200, height: 100)
                            .foregroundColor(Color.red.opacity(0.27))
                            .overlay(
                                Button("Reset") {
                                    tm.resetTimer()
                                }
                                .disabled(!tm.isActive)
                                .foregroundColor(.red)
                                .font(.system(size: 30, weight: .medium, design: .rounded))
                        )
                    }
                    
                } // end of VStack
                // timer config 0 will update timer every second
                .onReceive(timer) { _ in
                    tm.updateTimer()
                }
                .background(.black)
            LottiePlusView(name: "Confetti", play: $play)
                .allowsHitTesting(false)
                .id(brushNum)
            } // end of ZStack
            
        }
        .padding(.horizontal, -10.0)

    } // body
} // struct


struct count_Previews: PreviewProvider {
    static var previews: some View {
        count()
            .previewLayout(.sizeThatFits)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.black/*@END_MENU_TOKEN@*/)
            
            
    }
}
