//
//  ContentView.swift
//  BenchMark
//
//  Created by F iPhreetom on 2022/10/30.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShow = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                NavigationLink(destination: LoopTestView(), isActive: self.$isShow) {
                    Text("🔍 single loop 性能测试 ")
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)

                }
                Spacer()
            }
        }
        .padding()
//        NavigationView {
//            List {
//                NavigationLink("Purple", destination: AnalyzeView())
//                NavigationLink("Pink", destination: AnalyzeView())
//                NavigationLink("Orange", destination: AnalyzeView())
//            }
//            .navigationTitle("Colors")
//
//            Text("Select a Color") // A placeholder to show before selection.
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
