//
//  ContentView.swift
//  T2-Tinder
//
//  Created by Danilo Andrusco on 23-10-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TopBarView()
            CardView(course: courses[0])
            BottonBarView()
        }
    }
}

#Preview {
    ContentView()
}


struct TopBarView: View {
    var body: some View {
        HStack{
            Image(systemName: "line.horizontal.3")
                .font(.system(size: 25))
                .foregroundStyle(.black)
            Spacer()
            Image(systemName: "book.fill")
                .font(.system(size: 35))
                .foregroundStyle(.black)
            Spacer()
            Image(systemName: "archivebox.fill")
                .font(.system(size: 25))
                .foregroundStyle(.black)
        }.padding(15)
    }
}


struct BottonBarView: View {
    var body: some View {
        HStack{
            Image(systemName: "xmark")
                .font(.system(size: 25))
                .foregroundStyle(.black)
            Spacer()
            Button(action: {
                //Comprar el curso
            }, label: {
                Text("Comprar el curso")
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.all, 20)
                    .background(Color.black)
                    .cornerRadius(12)
            }).padding(15)
            Spacer()
            Image(systemName: "heart")
                .font(.system(size: 25))
        }.padding(15)
    }
}
