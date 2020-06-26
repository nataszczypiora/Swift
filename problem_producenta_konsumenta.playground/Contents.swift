import UIKit
var items = [Int]()
var lock = NSLock()
class Producent
{
    init()
    {
        
    }
    func add(num: Int)
    {
        lock.lock()
        print("Add \(num)")
        items.append(num)
        lock.unlock()
    }
}
class Konsument
{
    init()
    {
        
    }
    func remove()
    {
        lock.lock()
        guard !items.isEmpty else
        {
            lock.unlock()
            return
        }
        let num = items.removeLast()
        print("Remove \(num)")
        lock.unlock()
    }
}

let dispatchQueue = DispatchQueue(label: "kolejka", attributes: .concurrent)
var pro = Producent()
var kon = Konsument()
for x in 0..<10
{
    dispatchQueue.async {
        pro.add(num: x)
    }
}

for _ in 0..<10{
    dispatchQueue.async {
        kon.remove()
    }
}
