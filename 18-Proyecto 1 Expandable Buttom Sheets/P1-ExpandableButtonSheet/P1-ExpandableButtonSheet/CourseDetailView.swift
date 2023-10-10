//
//  CourseDetailView.swift
//  P1-ExpandableButtonSheet
//
//  Created by Danilo Andrusco on 10-10-23.
//

//6. Crearemos el detalle de los cursos
import SwiftUI

struct CourseDetailView: View {
    var body: some View {
        VStack {
            HandleBar()
            TitleBar(titleBar: "Detalles del Curso.")
            HederView()
            DescriptionView()
        }
    }
}

#Preview {
    CourseDetailView()
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
    }
}

//9. Programaremos la cabecera
struct HederView: View {
    var body: some View {
        Text("")
    }
}

//9. Programaremos la descripcion
struct DescriptionView: View {
    var body: some View {
        Text("")
    }
}
