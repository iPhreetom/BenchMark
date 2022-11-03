//
//  LoopTestView.swift
//  BenchMark
//
//  Created by F iPhreetom on 2022/10/30.
//

import SwiftUI
import Charts

struct LoopTestView: View {
    struct ValuePerCategory {
        var xindex: Int64
        var value: Double
    }
    
    @State private var data = [ValuePerCategory]()
    @State private var loopCount:Int64 = 1;
    
    func loopHere() {
        DispatchQueue.global().async {
            var intCount:Int64 = 0
            var startTime:Double = Date().timeIntervalSince1970
            while (true) {
                intCount += 1
                if (intCount >= 1000_000_000) {
                    let endTime:Double = Date().timeIntervalSince1970
                    let score:Double = 1e9/(endTime-startTime)/100000
                    startTime = endTime
                    data.append(ValuePerCategory.init(xindex: loopCount, value: score))
                    loopCount += 1
                    intCount = 0
                    print(score)
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            Button("Start") {
                loopHere()
            }
            Chart(data, id: \.xindex) { item in
                BarMark(
                    x: .value("Category", item.xindex),
                    y: .value("Value", item.value)
                )
            }
        }
    }
}



struct LoopTestView_Previews: PreviewProvider {
    static var previews: some View {
        LoopTestView()
    }
}
