//
//  SweetMoodView.swift
//  TestAppSpar
//
//  Created by Artem Soloviev on 15.08.2023.
//

import SwiftUI

struct SweetMoodView: View {
    var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = "."
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    var sweet = ["SImage_1", "SImage_2", "SImage_3", "SImage_4"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(sweet, id: \.self) {item in
                    
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
                                            Text("Новинка")
                                                .font(.caption)
                                                .foregroundColor(.white)
                                                .padding(5)
                                                .background(Color.blue).opacity(0.7)
                                                .roundedCorner(15, corners: .topLeft)
                                                .roundedCorner(5, corners: .topRight)
                                                .roundedCorner(5, corners: .bottomRight)
                                            Spacer()
                                        }
                                    }
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Spacer()
                                            
                                            HStack{
                                                Text(price as NSNumber, formatter: formatter)
                                                    .font(.caption)
                                                    .fontWeight(.bold)
                                                Text("\u{20BD}\u{2044}шт")
                                                    .font(.caption)
                                                    .fontWeight(.bold)
                                            }
                                        }.padding(10)
                                        Spacer()
                                        VStack(alignment: .trailing) {
                                            Spacer()
                                            
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

struct SweetMoodView_Previews: PreviewProvider {
    static var previews: some View {
        SweetMoodView()
    }
}
