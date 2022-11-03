//
//  AnalyzeView.swift
//  BenchMark
//
//  Created by F iPhreetom on 2022/11/1.
//

import SwiftUI

let maxInt:Int64 = 1000_000_000
let maxDouble:Double = 1000_000_000.0

let globalQueue = DispatchQueue.global()

//定义四个调度任务，打印当前线程数据
let itemIntType = DispatchWorkItem {
    var start = CFDateGetAbsoluteTime(NSDate())
    var intCount:Int64 = 0
    while (true) {
        intCount += 1
        if (intCount >= maxInt) {
            intCount = 0;
            let end = CFDateGetAbsoluteTime(NSDate())
            print("int score: \(1e9/(end-start)/100000)")
            start = end;
        }
    }
}

let itemFloatType = DispatchWorkItem {
    var start = CFDateGetAbsoluteTime(NSDate())
    var doubleCount:Double = 0
    while (true) {
        doubleCount += 1.0
        if (doubleCount >= maxDouble) {
            doubleCount = 0;
            let end = CFDateGetAbsoluteTime(NSDate())
            print("float score: \(1e9/(end-start)/100000)")
            start = end;
        }
    }
}

func benchMarkBegin() {
    print("hello, world")
    globalQueue.async(execute: itemFloatType)
    globalQueue.async(execute: itemFloatType)
    globalQueue.async(execute: itemIntType)
    globalQueue.async(execute: itemIntType)
}

struct AnalyzeView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AnalyzeView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyzeView()
    }
}
