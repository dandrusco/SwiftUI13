//
//  DetailView.swift
//  Navigation
//
//  Created by Danilo Andrusco on 23-08-23.
//

import SwiftUI

struct DetailView: View {
    
    var course: Course
    
    var body: some View {
        VStack {
            Image(course.imagen)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(course.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                //5. Para centrar el texto, agregaremos esta linea
                .multilineTextAlignment(.center)
                .frame(width: 300)
                .lineLimit(2)
            
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(course: Course(name: "Swift desde cero", imagen: "swift"))
    }
}
