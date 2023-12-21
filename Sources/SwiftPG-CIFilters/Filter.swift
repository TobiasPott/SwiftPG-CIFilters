import SwiftUI

enum BuiltInFilter: Codable {
    case posterize, scale, saturation
    case thermal, xray, sepiatone, hueadjust, comiceffect
}

struct Filter: Codable {
    private enum CodingKeys: String, CodingKey {
        case id, enabled, name, type, args
    }
    
    let id: UUID = UUID();
    var enabled: Bool;
    let name: String;
    let type: BuiltInFilter;
    var args: [CGFloat] = [];
    var action: (CIImage, [CGFloat]) -> CIImage = { (input, args) in return input; }
    
    func apply(_ input: CIImage) -> CIImage {
        return action(input, args);
    }    
    
    public static func generic(_ name: String, _ type: BuiltInFilter, _ args: [CGFloat], action: @escaping (CIImage, [CGFloat]) -> CIImage) -> Filter { 
        return Filter(enabled: true, name: name, type: type, args: args, action: action)
    }
    
}
