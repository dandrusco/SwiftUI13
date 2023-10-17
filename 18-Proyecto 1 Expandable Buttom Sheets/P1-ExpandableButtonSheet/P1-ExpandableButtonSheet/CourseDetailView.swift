//
//  CourseDetailView.swift
//  P1-ExpandableButtonSheet
//
//  Created by Danilo Andrusco on 10-10-23.
//

//6. Crearemos el detalle de los cursos
import SwiftUI

struct CourseDetailView: View {
    
    var course: Course
    
    var body: some View {
        //Con GeometryReader podemos capturar la geometria de la ventana
        GeometryReader { geometry in
            VStack {
                Spacer()
                HandleBar()
                TitleBar(titleBar: "Detalles del Curso.")
                // Solo sera scroleable la imagen y las descripciones
                ScrollView(.vertical){
                    HederView(course: courses[0])
                    DescriptionView(icon: "dollarsign.circle.fill", content: "\(course.priceLevel)")
                        .padding(.top)
                    DescriptionView(icon: nil, content: "\(course.description)")
                }
            }
            //Pintamos la tarjeta blanca con bordes redondeados
            .background(Color.white)
            .cornerRadius(15, antialiased: true)
            .offset(y: geometry.size.height*0.4)
        }
    }
}

#Preview {
    CourseDetailView(course: courses[0])
        .background(Color.gray)
}
//7. Crearemos una barra
struct HandleBar: View {
    var body: some View {
        Rectangle()
            .frame(width: 70, height: 8)
            .foregroundStyle(Color(.systemGray4))
            .cornerRadius(8)
    }
}

//8. Crearemos el titulo
struct TitleBar: View {
    var titleBar: String
    var body: some View {
        Text(titleBar)
            .font(.headline)
            .foregroundStyle(.primary)
            .padding()
    }
}

//9. Programaremos la cabecera
struct HederView: View {
    var course: Course
    
    var body: some View {
        Image(course.imagen)
            .resizable()
            .scaledToFit()
            .overlay(
                HStack{
                    VStack(alignment: .leading){
                        Spacer()
                        Text(course.name)
                            .foregroundStyle(.white)
                            .font(.system(.title, design: .rounded))
                            .bold()
                            .padding(5)
                            .background(Color.gray)
                            .cornerRadius(5)
                        Text(course.type)
                            .font(.system(.subheadline, design: .rounded))
                            .foregroundStyle(.white)
                            .padding(5)
                            .background(Color.blue)
                            .cornerRadius(5)
                    }
                    Spacer()
                }
                    .padding()
            )
    }
}

//9. Programaremos la descripcion
struct DescriptionView: View {
    var icon: String?
    var content: String
    
    var body: some View {
        HStack{
            if icon != nil {
                Image(systemName: icon!)
                    .padding(.trailing, 10)
            }
            Text(content)
                .font(.system(.body, design: .rounded))
            Spacer()
        }
        .padding(.horizontal)
    }
}
