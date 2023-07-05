//
//  NoItemFoundView.swift
//  ToDoListAppSwiftUI
//
//  Created by Bhavin on 04/07/23.
//

import SwiftUI

struct NoItemFoundView: View {

    @State var showAnimation : Bool = false
    let secondoryAccentColor = Color("SecondoryAccentColor")
    var body: some View {
        ScrollView{
            VStack (spacing: 10) {
                Text("There are no items!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                    .padding(.bottom, 10)
                Text("You should click on add button of items to your todo list!")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView()) {
                    Text("Add Something ")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(showAnimation ?  secondoryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, showAnimation ? 30 : 50)
                .shadow(
                    color: showAnimation ? secondoryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: showAnimation ? 30 : 10,
                    x: 0,
                    y: showAnimation ? 50 : 30)
                .scaleEffect(showAnimation ? 1.1 : 1.0)
                .offset(y: showAnimation ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !showAnimation else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation (
                Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ){
                showAnimation.toggle()
            }
        }
    }
}

#Preview {
    NavigationView{
        NoItemFoundView()
            .navigationTitle("Title")
    }
}
