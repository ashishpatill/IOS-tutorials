//
//  ContentView.swift
//  Assignment
//
//  Created by Ashish Pisey on 08/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ProfileView()
                .padding(.bottom)
            EmailView()
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Circleview: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(.black)
            Image(systemName: "person")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .foregroundColor(.white)
        }
    }
}

struct ProfileView:View {
    var body: some View {
        VStack {
            Circleview()
            Text("Ashish Pisey")
                .foregroundColor(.black)
        }
    }
}

struct EmailView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(height: 50
                       , alignment: .center)
                .padding(.horizontal)
            HStack {
                  Image(systemName: "mail")
                    .resizable()
                    .frame(width: 35, height: 25, alignment: .leading)
                    .foregroundColor(.white)
                    .padding()
                Text("apisey@codingdojo.com")
                    .foregroundColor(.white)
            }
        }
        
    }
}
