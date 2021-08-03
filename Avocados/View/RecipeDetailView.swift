//
//  RecipeDetailView.swift
//  Avocados
//
//  Created by Rami Ounifi on 3/8/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    // MARK: -Properties
    var recipe: Recipe
    @State var pulsate: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 10) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                Group() {
                    // Titlee
                    Text(recipe.title)
                        .font(.system(.largeTitle, design: .serif))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("ColorGreenAdaptive"))
                        .padding(.top, 10)
                    // rating
                    RecipeRatingView(recipe: recipe)
                    // cooking
                    RecipeCookingView(recipe: recipe)
                    // ingrediants
                    Text("Ingredients")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(recipe.ingredients, id: \.self) { ingredient in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(ingredient)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                Divider()
                                
                            }
                            
                        }
                    }
                    // instructions
                    Text("Instructions")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    ForEach(recipe.instructions, id: \.self) {
                        instruction in
                        VStack(alignment: .center, spacing: 5) {
                            Image(systemName: "chevron.down.circle")
                                .resizable()

                                .frame(width: 42, height: 42, alignment: .center)
                                .imageScale(.large)
                                .font(Font.title.weight(.ultraLight))
                                .foregroundColor(Color("ColorGreenAdaptive"))
                            
                            Text(instruction)
                                .lineLimit(nil)
                                .font(.system(.body, design: .serif))
                                .multilineTextAlignment(.center)
                                .frame(minHeight: 100)
                            
                        }
                    }
                    
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss() 
                        
                    }, label: {
                        Image(systemName: "chevron.down.circle.fill")
                          .font(.title)
                          .foregroundColor(Color.white)
                          .shadow(radius: 4)
                            .opacity(self.pulsate ? 1 : 0.6)
                            .scaleEffect(self.pulsate ? 1.2 : 0.8, anchor: .center)
                            
                            .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                    })
                    .padding(.trailing, 20)
                    .padding(.top, 24)
                    Spacer()
                }
            }
        )
        .onAppear(perform: {
            self.pulsate.toggle()
        })
       
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: recipeData[1])
    }
}
