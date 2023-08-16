//
//  CirclesView.swift
//  TestAppSpar
//
//  Created by Artem Soloviev on 15.08.2023.
//

import SwiftUI

struct CirclesView: View {
    var circles = ["Image_0": "Привилегии \"Мой SPAR\"" , "Image_1":"Мы в соцсетях" , "Image_3": "3 рецепта коктейлей", "Image_5": "Рецепт недели",  "Image_4": "Дегустации в SPAR" ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center) {
                ForEach(circles.sorted(by: <), id: \.key) {key, value  in
                    NavigationLink(destination: NavView()) {
                        VStack(alignment: .center){
                            Image(key)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 56, height: 56)
                                .clipShape(Circle())
                                .overlay(Circle().strokeBorder(.white, lineWidth: 2))
                                .overlay(Circle().stroke(.green, lineWidth: 2))
                            
                            Text(value)
                                .font(.caption)
                                .frame(width: 80)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                        }
                        .padding(.vertical)
                    }
                }
            }
        } .padding()
    }
}

struct CirclesView_Previews: PreviewProvider {
    static var previews: some View {
        CirclesView()
    }
}
