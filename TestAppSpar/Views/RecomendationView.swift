//
//  RecomendationView.swift
//  TestAppSpar
//
//  Created by Artem Soloviev on 15.08.2023.
//

import SwiftUI

struct RecomendationView: View {
    var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = "."
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    var recomended = ["RImage_1", "RImage_2", "RImage_3", "RImage_4"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(recomended, id: \.self) {item in
                    
                    let price = Double.random(in: 100..<300)
                    let randomInt = Int.random(in: 0...3)
                    NavigationLink(destination: NavView()) {
                        Image(item)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 200, alignment: .top)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15)).shadow(radius: 2)
                            .overlay(
                                VStack{
                                    HStack {
                                        if randomInt == 3 {
                                            Text("Удар по ценам")
                                                .font(.caption)
                                                .foregroundColor(.white)
                                                .padding(5)
                                                .background(Color.red).opacity(0.7)
                                                .roundedCorner(15, corners: .topLeft)
                                                .roundedCorner(5, corners: .topRight)
                                                .roundedCorner(5, corners: .bottomRight)
                                            Spacer()
                                        }
                                    }
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Spacer()
                                            if randomInt == 3 {
                                                HStack {
                                                    Text(price - ((price/100)*10)
                                                         as NSNumber, formatter: formatter)
                                                    .font(.caption)
                                                    .fontWeight(.bold)
                                                    Text("\u{20BD}\u{2044}шт")
                                                        .font(.caption)
                                                        .fontWeight(.bold)
                                                    
                                                }
                                                Text(price as NSNumber, formatter: formatter)
                                                    .font(.caption)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.gray)
                                                    .strikethrough()
                                                
                                            } else{
                                                HStack{
                                                    Text(price as NSNumber, formatter: formatter)
                                                        .font(.caption)
                                                        .fontWeight(.bold)
                                                    Text("\u{20BD}\u{2044}шт")
                                                        .font(.caption)
                                                        .fontWeight(.bold)
                                                    
                                                }.padding(5)
                                            }
                                        }.padding([.leading], 5)
                                            .padding([.bottom], 5)
                                        Spacer()
                                        VStack(alignment: .trailing) {
                                            Spacer()
                                            if randomInt == 3 {
                                                Text("- 10%")
                                                    .foregroundColor(.red)
                                                    .font(.caption)
                                                    .fontWeight(.bold)
                                                    .padding(5)
                                                    .background(Capsule()
                                                        .fill(.white)
                                                        .opacity(0.3)
                                                    )
                                            }
                                            Image("Basket2").renderingMode(.template)
                                                .resizable()
                                                .frame(width: 15, height: 15,alignment: .center)
                                                .foregroundColor(.white)
                                                .padding(6)
                                                .background(Circle()
                                                    .fill(.green)
                                                )
                                        }.padding(5)
                                    }
                                }
                            ) .padding(1)
                    }
                }
            }
        }
    }
}

struct RecomendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecomendationView()
    }
}
