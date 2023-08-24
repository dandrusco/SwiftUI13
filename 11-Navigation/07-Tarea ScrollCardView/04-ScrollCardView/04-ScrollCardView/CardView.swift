//
//  CardView.swift
//  04-ScrollCardView
//
//  Created by Juan Gabriel Gomila Salas on 12/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    var course: Course
    
    var body: some View {
        VStack {
            Image(course.imageName)
            .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                VStack(alignment: .leading){
                    Text(course.authorName)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(course.courseTitle.uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    HStack {
                        Text(course.discountPrice)
                            .font(.subheadline)
                            .foregroundColor(.primary)
                        Text(course.originalPrice)
                        .font(.caption)
                            .foregroundColor(.secondary)
                            .strikethrough()
                    }
                }
                .layoutPriority(10)
                
                Spacer()
            }.padding()
        }
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(red: 130/255, green: 130/255, blue: 130/255, opacity: 0.2), lineWidth: 2))
        .padding([.top, .horizontal])
    
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(course: Course(imageName: "swift", authorName: "Juan Gabriel Gomila", courseTitle: "Diseño de apps para iOS 13 con Swift UI desde cero", originalPrice: "199.99€", discountPrice: "10.99€"))
    }
}
