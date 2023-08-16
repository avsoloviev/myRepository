//
//  FirstScrollView.swift
//  TestAppSpar
//
//  Created by Artem Soloviev on 16.08.2023.
//

import SwiftUI

struct FirstScrollView: View {
    var picture = ["Picture_1","Picture_2", "Picture_3" ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center) {
                ForEach(picture, id: \.self) {picture in
                    NavigationLink(destination: NavView()) {
                        Image(picture)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                }.padding(2)
            }
        }
    }
}

struct FirstScrollView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScrollView()
    }
}
