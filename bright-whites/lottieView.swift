//
//  lottieView.swift
//  Brushem
//
//  Created by David Beach on 2023-05-17.
//

import SwiftUI
import Lottie

struct LottiePlusView: UIViewRepresentable {
    
    let name: String
    let loopMode: LottieLoopMode
    let animationSpeed: CGFloat
    @Binding var play: Bool
    let animationView: LottieAnimationView
    
    init( name: String,
          loopMode: LottieLoopMode = .playOnce,
          animationSpeed: CGFloat = 1,
          play: Binding<Bool> = .constant(true)) {
        self.name = name
        self.animationView = LottieAnimationView(name: name)
        self.animationSpeed = animationSpeed
        self.loopMode = loopMode
        self._play = play
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.loopMode = loopMode
        animationView.animationSpeed = animationSpeed
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if play {
            animationView.play { _ in
                play = false 
            }
        }
    }

}
