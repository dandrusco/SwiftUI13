//
//  ContentView.swift
//  anims
//
//  Created by Danilo Andrusco on 14-08-23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var recargar = 0
    @State private var progress : CGFloat = 0.0
    
    var body: some View {
        VStack {
            if recargar == 1 {
                ZStack {
                    Text("\(Int(progress*100)) %")
                        .font(.system(.title, design: .rounded))
                        .bold()
                    
                    Circle()
                        .stroke(Color(.systemGray6), lineWidth: 12)
                        .frame(width: 150, height: 150)
                    
                    Circle()
                        .trim(from: 0.0, to: progress)
                        .stroke(Color.green, lineWidth: 12)
                        .frame(width: 150, height: 150)
                        .rotationEffect(Angle(degrees: -90))
                }
                .onAppear() {
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                        progress += 0.05
                        if progress >= 1.0 {
                            timer.invalidate()
                            recargar += 1
                        }
                    }
                }
            }
            else if recargar == 2{
                Image(systemName: "checkmark.circle")
                    .font(.system(size: 200))
                    .foregroundColor(.green)
                
                Button(action: {
                        recargar = 0
                        progress = 0.0
                }) {
                    Text("Pago Aceptado")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.black)
                        .cornerRadius(50)
                        .padding(20)
                }
            }
            else {
                Image(systemName: "creditcard.fill")
                    .font(.system(size: 200))
                    .foregroundColor(.blue)
                
                Button(action: {
                    recargar += 1
                }) {
                    Text("Pagar")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.black)
                        .cornerRadius(50)
                        .padding(20)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
