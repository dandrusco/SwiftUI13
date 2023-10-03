//
//  DetailView.swift
//  Navigation
//
//  Created by Danilo Andrusco on 23-08-23.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var course: Course
    
    var body: some View {
        ScrollView {
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
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "arrow.left.circle.fill")
                .font(.title)
                .foregroundColor(.white)
        })
        )
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        //16. Rellenamos todas las variables
        DetailView(course: Course(name: "Swift desde cero", imagen: "swift", type: "Swift", priceLevel: 3))
    }
}
