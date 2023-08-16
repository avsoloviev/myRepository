//
//  ContentView.swift
//  TestAppSpar
//
//  Created by Artem Soloviev on 11.08.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    init() {
    let tab = UITabBarAppearance()
        tab.backgroundColor = UIColor.white
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tab
        } 
            UITabBar.appearance().standardAppearance = tab
            let nav = UINavigationBarAppearance()
        nav.backgroundColor = UIColor.white
        UINavigationBar.appearance().scrollEdgeAppearance = nav
        UINavigationBar.appearance().standardAppearance = nav
        }

    
    var mainTab: some View {
        MainView()
    }
    var catalogTab: some View {
        CatalogView()
    }
    var basketTab: some View {
        BasketView()
    }
    var accountTab: some View {
        AccountView()
    }


    var body: some View {
 
        TabView(selection: $selection){

            mainTab.tabItem {
                Label("Главная", image:"Spar")
            }
            .tag(0)
            catalogTab.tabItem {
                if #available(iOS 15.0, *) {
                    Label("Каталог", systemImage: "square.grid.2x2").environment(\.symbolVariants, .none)
                }else{
                    Label("Каталог", systemImage: "square.grid.2x2")
                }
            }
            .tag(1)
            basketTab.tabItem {
                if #available(iOS 15.0, *) {
                    Label("Корзина", systemImage: "cart").environment(\.symbolVariants, .none)
                }else{
                    Label("Корзина", systemImage: "cart")
                }
            }
            .tag(2)
            accountTab.tabItem {
                if #available(iOS 15.0, *) {
                    Label("Профиль", systemImage: "person").environment(\.symbolVariants, .none)
                }else{
                    Label("Профиль", systemImage: "person")
                }
            }
            .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
