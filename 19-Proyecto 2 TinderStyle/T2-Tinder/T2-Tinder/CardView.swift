//
//  CardView.swift
//  T2-Tinder
//
//  Created by Danilo Andrusco on 23-10-23.
//

import SwiftUI

struct CardView: View, Identifiable {
    
    let id = UUID()
    let course : Course
    
    var body: some View {
        Image(course.image)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .cornerRadius(20)
            .padding(.horizontal, 20)
            .overlay(
                VStack{
                    Text(course.name)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 20)
                        .background(Color.white)
                        .cornerRadius(20)
                }.padding([.top, .horizontal], 50), alignment: .top
                )
        }
}

#Preview {
    CardView(course: courses[0])
}
