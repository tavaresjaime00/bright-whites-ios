//
//  howTo.swift
//  Brushem
//
//  Created by David Beach on 2023-05-16.
//

import SwiftUI

struct howTo: View {
    
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.black)
            VStack {
                HStack {
                    Image("logo").resizable().scaledToFit()
                    Text("Bright Whites")
                        .padding()
                        .font(.system(size: 35, weight: .bold))
                    .foregroundColor(Color.white)
                }
                Text("How to brush your teeth:")
                    .padding()
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(Color.green)
                
                    Group{
                        Text("1. Put toothpaste on your toothbrush and wet with water")
                        Text("2. Put the toothbrush into your mouth")
                        Text("3. Sectioning your mouth into 4-sections, brush each section for at least 30 seconds")
                        Text("4. After 2 minutes, rinse off toothbrush and swish water in  mouth")
                        Text("5. Floss inbetween each of your teeth, ensuring all debris and pieces of food are removed.")
                        Text("[Dentist Recommendations]").padding(0).italic()
                        Text("Swish a Fluoride-based, ZERO Alcohol mouthwash for 30 seconds, then spit out. Do Not Swallow Mouthwash!").padding(.top, -20)
                        
                    }
                    .padding(.top, 5)
                    .padding()
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                
                
                Spacer()
                    
            }
            
        }
    }
}

struct howTo_Previews: PreviewProvider {
    static var previews: some View {
        howTo()
    }
}
