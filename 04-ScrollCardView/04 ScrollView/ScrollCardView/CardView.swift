//
//  CardView.swift
//  ScrollCardView
//
//  Created by Danilo Andrusco on 03-08-23.
//

import SwiftUI

struct CardView: View {
    
    var imageName: String
    var authorName: String
    var courseTittle: String
    var originalPrice: String
    var discountPrice: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                VStack (alignment: .leading){
                    Text(authorName)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(courseTittle.uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    HStack {
                        Text(originalPrice)
                            .font(.subheadline)
                        .foregroundColor(.primary)
                         Text(discountPrice)
                             .font(.caption)
                         .foregroundColor(.secondary)
                         .strikethrough()
                    }
                }
                .layoutPriority(10)
                Spacer()
            }
            .padding()
        }
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(red: 130/255, green: 130/255, blue: 130/255, opacity: 0.2), lineWidth: 2))
        .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(imageName: "swift", authorName: "Danilo Andrusco", courseTittle: "Swift desde cero", originalPrice: "USD 199.9", discountPrice: "USD 10.99")
    }
}
