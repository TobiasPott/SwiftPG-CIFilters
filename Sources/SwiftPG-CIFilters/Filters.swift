import SwiftUI

struct Filters : Codable {
    
    private enum CodingKeys: String, CodingKey {
        case items
    }
    
    public var items: [Filter];
    
    public var count: Int { items.count }
    
    init() {
        items = []
    }
    init(_ initItems: [Filter]) {
        items = []
        items.append(contentsOf: initItems);
    }
    
    subscript (index: Int) -> Filter {
        get { return items[index] }
        set(value) { items[index] = value }
    }
    mutating func append(_ newElement: Filter) {
        self.items.append(newElement)
    }
    mutating func append(other: Filters) {
        self.items.append(contentsOf: other.items)
    }
    mutating func remove(at: Int) {
        self.items.remove(at: at)
    }
    mutating func remove(atOffsets: IndexSet) {
        self.items.remove(atOffsets: atOffsets)
    }
    mutating func reset() {
        items = []
    }
    
}
