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
                .multilineTextAlignment(.center)
                .frame(width: 300)
                .lineLimit(2)
            
            Spacer()
        }//2. Simplemente deberemos indicar un navigationBarTitle, sin titulo (opcional) y con un displayMode como .inline
        .navigationBarTitle("", displayMode: .inline)
        //3. Volvemos a la ContentView y veremos  que el problema se ha solucionado al ingresar en un curso
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(course: Course(name: "Swift desde cero", imagen: "swift"))
    }
}
