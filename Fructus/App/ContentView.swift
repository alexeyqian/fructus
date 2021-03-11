//
//  ContentView.swift
//  Fructus
//
//  Created by Alexey Qian on 2021/3/8.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var isShowingSettings: Bool = false
    var fruits: [Fruit] = fruitsData
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView{
            List{
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(
                        destination: FruitDetailView(fruit: item)){
                            FruitRowView(fruit: item)
                                .padding(.vertical, 4)
                       }
                }
            } //: LIST
            .navigationTitle("Fruits")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        isShowingSettings = true
                    }){
                        Image(systemName: "slider.horizontal.3")
                    } //: BUTTON
                    .sheet(isPresented: $isShowingSettings, content: {
                        SettingsView()
                    })
            )
        } //: NAVIGATION VIEW
        .navigationViewStyle(StackNavigationViewStyle())
        
    } //: BODY
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
            .previewDevice("iPhone 11 Pro")
    }
}
