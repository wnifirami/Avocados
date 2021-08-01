//
//  ContentView.swift
//  Avocados
//
//  Created by Rami Ounifi on 29/7/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    var headers: [Header] = headersData
    var facts: [Fact] = factsData
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // MARK: - Header
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(headers) { item in
                            HeaderView(header: item)
                        }
                       
                    }
                }
                // MARK: - DishesView
                Text("Avocado Dishes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                DishesView()
                    .frame(maxHeight: 640)
                // MARK: - Facts
                Text("Avocado facts")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 60) {
                        ForEach(facts){ item in
                            FactsView(fact: item)
                            
                        }
                    }
                    .padding(.vertical)
                    .padding(.leading, 60)
                    .padding(.trailing, 20)
                }
                // MARK: - Footer
                
                VStack(alignment: .center, spacing: 20) {
                    Text("All about AVocados")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                       
                    
                    Text("Everything you want to know about avocados but were too afraid to ask")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .frame(minHeight: 60)
                }
                .frame(maxWidth: 640)
                .padding()
                .padding(.bottom, 85)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .padding(0)
    }
}

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .serif))
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(headers: headersData, facts: factsData)
    }
}
