//
//  CourseDetailView.swift
//  P1-ExpandableButtonSheet
//
//  Created by Danilo Andrusco on 10-10-23.
//

//6. Crearemos el detalle de los cursos
import SwiftUI

struct CourseDetailView: View {
    
    @GestureState private var dragState = DragState.none
    
    @State private var offset: CGFloat = 0
    
    @State private var cardState = CardState.half
    
    var course: Course
    
    @Binding var isShow: Bool
    
    var body: some View {
        //Con GeometryReader podemos capturar la geometria de la ventana
        GeometryReader { geometry in
            VStack {
                Spacer()
                HandleBar()
                TitleBar(titleBar: "Detalles del Curso.")
                // Solo sera scroleable la imagen y las descripciones
                ScrollView(.vertical){
                    HederView(course: course)
                    DescriptionView(icon: "dollarsign.circle.fill", content: "\(course.priceLevel)")
                        .padding(.top)
                    DescriptionView(icon: nil, content: "\(course.description)")
                }
                .disabled(cardState == .half || dragState.isDragging)
            }
            //Pintamos la tarjeta blanca con bordes redondeados
            .background(Color.white)
            .cornerRadius(15, antialiased: true)
            .offset(y: geometry.size.height*0.4 + dragState.translation.height+offset)
            .animation(.interpolatingSpring(stiffness: 200, damping: 50, initialVelocity: 10), value:cardState)
            .edgesIgnoringSafeArea(.all)
            .gesture(DragGesture()
                .updating($dragState){(value, state, transaction) in
                    state = DragState.dragging(translation: value.translation)
            }
                .onEnded({ (value) in
                    switch cardState {
                    case .half:
                        //Humbral supérior, si es superado, transicion a estado full
                        if value.translation.height < -0.25*geometry.size.height {
                            offset = -0.3*geometry.size.height
                            cardState = .full
                        }
                        //Umbral inferior, si es superando, ocultar la vista
                        if value.translation.height > 0.25*geometry.size.height{
                            isShow = false
                        }
                        break
                    case .full:
                        //Umbrar pequeño , si es superado transision a estado half
                        if value.translation.height > 0.25*geometry.size.height{
                            offset = 0
                            cardState = .half
                        }
                        //Umbral grande, si es superado, ocultar la tarjeta
                        if value.translation.height > 0.75*geometry.size.height{
                            isShow = false
                        }
                        break
                    }
                })
            )
        }
    }
}

#Preview {
    CourseDetailView(course: courses[0], isShow: .constant(true))
        .background(Color.gray)
        .edgesIgnoringSafeArea(.all)
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

//Creamos un enumerado para ver si maximizamos o cerramos la carjeta
enum CardState {
    case half
    case full
}
