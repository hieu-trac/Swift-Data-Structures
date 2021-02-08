import Foundation

public func evaluatePerformance(problemBlock: () -> Void) {

    let start = DispatchTime.now() // <<<<<<<<<< Start time
    problemBlock()
    let end = DispatchTime.now()   // <<<<<<<<<<   end time

    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
    let timeInterval = Double(nanoTime) / 1_000_000 // Technically could overflow for long running tests

    print("Time to evaluate: \(timeInterval) milliseconds")
}
