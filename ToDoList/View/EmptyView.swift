//
//  EmptyView.swift
//  ToDoList
//
//  Created by Aakash Dwivedy on 03/07/24.
//

import SwiftUI

struct EmptyView: View {
    
    @State var animate: Bool = false
    let secoundaryAccentColor = Color("SecoundaryAccentColor")
    
    var body: some View {
        ScrollView {
            Spacer()
            VStack(spacing:10) {
               
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Are you a productive person? I think you should click the add button and add a bunch of item in your todo list!")
                    .padding(.bottom,20)
                
                //adding navigation link
                NavigationLink(destination: AddView()) {
                    Text("Add Something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secoundaryAccentColor : Color.accentColor)
                        .cornerRadius(10 )
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? secoundaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7 ),
                        radius: animate ? 30 : 10 ,
                        x: 0,
                        y: animate ? 50 : 30)
//
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0 )
              
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: {
                addAnimation()
            })
        }
        .padding(.top,50)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .navigationTitle("Hello")
    }
    
    func addAnimation() {
        guard !animate else { return  }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        EmptyView()
    }
    
}
