//
//  MainView.swift
//  TestAppSpar
//
//  Created by Artem Soloviev on 11.08.2023.
//

import SwiftUI

struct MainView: View {
    @State private var selected = false
    var body: some View {
        
        NavigationView{
            
            ScrollView(.vertical){
                CirclesView()
                FirstScrollView()
                SecondScrollView()
                
                VStack(alignment: .leading) {
                    Text("Рекомендуем")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    
                    RecomendationView()
                        .accentColor(Color.black)
                    
                }
                VStack(alignment: .leading) {
                    Text("Сладкое настроение")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    
                    SweetMoodView()
                        .accentColor(Color.black)
                    
                }
                NavigationLink(destination: MenuView(), isActive: $selected) {}
            } .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        HStack{
                            Image("Mappin")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 10, height: 15)
                            Text("Москва, Москва и Московская область")
                                .font(.system(size: 15))
                            
                        }.padding(.horizontal)
                            .padding(.vertical, 8)
                            .overlay(Capsule(style: .continuous).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                        Button {
                            selected.toggle()
                        }label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.green)
                        }
                    }
                }
            }.navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
