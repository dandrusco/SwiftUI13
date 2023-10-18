//
//  ContentView.swift
//  P1-ExpandableButtonSheet
//
//  Created by Danilo Andrusco on 10-10-23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showCourseDetail = false
    
    @State private var selectedCourse: Course?
    
    var body: some View {
        ZStack{
            NavigationView{
                List{
                    ForEach(courses){ course in
                        BasicRow(course: course)
                            .onTapGesture {
                                self.showCourseDetail = true
                                self.selectedCourse = course
                        }
                    }
                }
            .navigationBarTitle("Cursos Online")
            }
            .offset(y: self.showCourseDetail ? -150: 0)
            .animation(.easeIn(duration: 0.25), value: showCourseDetail)
            
            if showCourseDetail{
                
                BlanketView(color: .gray)
                    .opacity(0.5)
                    .onTapGesture {
                        self.showCourseDetail = false
                    }
                
                self.selectedCourse.map{
                    CourseDetailView(course: $0, isShow: $showCourseDetail)
                        .transition(.move(edge: .bottom))
                }
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}

//5. Crearemos la estructura para las celdas
struct BasicRow: View {
    var course: Course
    
    var body: some View{
        HStack{
            Image(course.imagen)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            Text(course.name)
        }
    }
}

//Crearemos una manta para cuando se ingrese a un curso
struct BlanketView: View {
    var color: Color
    var body: some View {
        VStack{
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
        .edgesIgnoringSafeArea(.all)
    }
}
