//
//  SecondScrollView.swift
//  TestAppSpar
//
//  Created by Artem Soloviev on 16.08.2023.
//

import SwiftUI

struct SecondScrollView: View {
    var images = ["Coffe", "Discount", "Delivery", "List", "Wine", "Card"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center) {
                ForEach(images, id: \.self) {image  in
                    NavigationLink(destination: NavView()) {
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .shadow(radius: 2)
                    }
                }.padding(2)
            }
        }
    }
}

struct SecondScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SecondScrollView()
    }
}
