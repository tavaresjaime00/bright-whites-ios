//
//  warning.swift
//  Brushem
//
//  Created by David Beach on 2023-05-16.
//

import SwiftUI

struct warning: View {
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(Color.red)
                .ignoresSafeArea()
            VStack(spacing: 40){
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 90))
                    .foregroundColor(Color.white)
                Text("Brush your Teeth!")
                    .foregroundColor(Color.white)
                    .font(.system(size: 35, weight: .bold))
                Text("Not brushing your teeth can let plaque build up which leads to a build up in bacteria and cause infection. \n\nBrush your teeth to help prevent this. \n\nYour wallet will thank you in the future! \n\nDon't Forget to Floss!")
                    .foregroundColor(Color.white)
                    .font(.system(size: 25, weight: .bold))
                    .multilineTextAlignment(.center)
                    

                    
                Spacer()
            }
        }
        .accentColor(.white)
    }
}

struct warning_Previews: PreviewProvider {
    static var previews: some View {
        warning()
    }
}
