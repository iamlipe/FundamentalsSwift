import UIKit

protocol Phone {
    var name: String { get }
    var brand: String { get }
}

protocol Playable {
    var performace: Double { get }
}

struct Google: Phone, Playable {
    let name: String
    let brand: String = "google"
    let cpu: Double
    let memory: Double
    let canPlay: Bool = true
    var performace: Double {
        cpu * memory
    }
}

let pixel7 = Google(name: "pixel 7", cpu: 4000.0, memory: 1000.0)

print("O \(pixel7.name) registered \(pixel7.performace) points benchmark")

struct Motorola: Phone {
    let name: String
    let brand: String = "motorola"
    let canPlay: Bool = false
}

let motorolaG1 = Motorola(name: "Moto G20")

print("It is possible play any game with \(motorolaG1.name) ? \(motorolaG1.canPlay ? "Yes!" : "No!")")

extension Phone {
    var canPlay: Bool { self is Playable }
}

struct Samsung: Phone, Playable {
    let name: String
    let brand: String = "samsung"
    let cpu: Double
    let memory: Double
    var performace: Double {
        cpu * memory
    }
}

struct Xiaomi: Phone {
    let name: String
    let brand: String = "xiaomi"
}

let samsungS10 = Samsung(name: "Galaxy S10", cpu: 3000.0, memory: 600.0)
print("O \(samsungS10.name) registered \(samsungS10.performace) points benchmark")
let xiaomiRedmi9 = Xiaomi(name: "Redmi 9")
print("It is possible play any game with \(xiaomiRedmi9.name) ? \(xiaomiRedmi9.canPlay ? "Yes!" : "No!")")


enum Iphone: Phone, Playable {
    case iphone13, iphone14, iphone15
    
    var brand: String {
        return "apple"
    }
    var name: String {
        switch self {
        case .iphone13:
            return "iphone 13"
        case.iphone14:
            return "iphone 14"
        case .iphone15:
            return "iphone"
        }
    }
    var performace: Double {
        switch self {
        case .iphone13:
            return 35000.0
        case .iphone14:
            return 50000.0
        case .iphone15:
            fatalError("this iphone does not exist!")
        }
    }
}

extension Iphone {
    var canPlay: Bool {
        self != .iphone15
    }
}

Iphone.iphone13.canPlay
Iphone.iphone15.canPlay

class MacBook {
    let name: String
    let brand: String = "apple"
    let power: Double
    
    init(name: String) {
        self.name = name
        self.power = 100000.0
    }
}

protocol Benchmark {
    var power: Double { get }
}

extension Google: Benchmark {
    var power: Double {
        self.performace
    }
}

extension Motorola: Benchmark {
    var power: Double {
        500.0
    }
}

extension Xiaomi: Benchmark {
    var power: Double {
        1000.0
    }
}

extension Samsung: Benchmark {
    var power: Double {
        self.performace * 1.4
    }
}

extension Iphone: Benchmark {
    var power: Double {
        self.canPlay ? self.performace * 2: 0.0
    }
}

extension MacBook: Benchmark {}

let benchmarkTesting: [Benchmark] = [
    Iphone.iphone13,
    Iphone.iphone14,
    Iphone.iphone15,
    Motorola(name: "Moto G1"),
    Samsung(name: "Galaxy S20", cpu: 5000.0, memory: 1200.0),
    Xiaomi(name: "Redmi 10")
]

func sortBenchmark(of testing: [Benchmark]) -> Double {
    testing.max(by: { $0.power < $1.power })?.power ?? 0.0
}

print("the most performant score \(sortBenchmark(of: benchmarkTesting)) banchmark points")
