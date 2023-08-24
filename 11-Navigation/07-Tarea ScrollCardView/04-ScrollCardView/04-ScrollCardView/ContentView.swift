//
//  ContentView.swift
//  04-ScrollCardView
//
//  Created by Juan Gabriel Gomila Salas on 12/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var courses = [
        Course(imageName: "swift", authorName: "Juan Gabriel Gomila", courseTitle: "Diseño de apps para iOS 13 con Swift UI desde cero", originalPrice: "199.99€", discountPrice: "10.99€"),
                    
        Course(imageName: "videogames", authorName: "Juan Gabriel Gomila", courseTitle: "Curso completo de videojuegos con Unity 2019", originalPrice: "199.99€", discountPrice: "11.99€"),
                    
        Course(imageName: "maths", authorName: "Ricardo Alberich, Juan Gabriel Gomila y Arnau Mir", courseTitle: "Curso de Probabilidad y Variables Aleatorias para Machine Learning", originalPrice: "199.99€", discountPrice: "12.99€"),
                    
        Course(imageName: "python", authorName: "Juan Gabriel Gomila y Llorenç Valverde", courseTitle: "Resuelve problemas de matemáticas con Sage y Python", originalPrice: "99.99€", discountPrice: "10.99€")
        ]
    
    init() {
        let apareance = UINavigationBarAppearance()
        apareance.largeTitleTextAttributes = [
            .font: UIFont(name: "Avenir-BlackOblique", size: 32)!,
            .foregroundColor : UIColor.systemOrange
        ]
        apareance.titleTextAttributes = [
            .font: UIFont(name: "Avenir-BlackOblique", size: 18)!,
            .foregroundColor : UIColor.systemOrange
        ]
        apareance.setBackIndicatorImage(
            UIImage(systemName: "arrow.left.circle.fill"),
            transitionMaskImage: UIImage(systemName: "arrow.left.circle")
        )
        UINavigationBar.appearance().tintColor = .orange
        
        UINavigationBar.appearance().standardAppearance = apareance
        UINavigationBar.appearance().compactAppearance = apareance
        UINavigationBar.appearance().scrollEdgeAppearance = apareance
    }
    
    var body: some View {
        VStack{
            NavigationView {
                List(courses.indices, id: \.self) { idx in
                    NavigationLink(destination: CardView(course: courses[idx])){
                        CoursRow(course: courses[idx])
                    }
                }.navigationTitle("Juan Gabriel Gomila")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Course: Identifiable {
    var id = UUID()
    var imageName: String
    var authorName: String
    var courseTitle: String
    var originalPrice: String
    var discountPrice: String
}

struct CoursRow: View {
    
    var course : Course
    
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
