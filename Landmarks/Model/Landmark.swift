//
//  Landmark.swift
//  Landmarks
//
//  Created by 王详 on 2023/3/20.
//
import Foundation
import SwiftUI
import CoreLocation

// 声明了一个结构体
struct Landmark: Hashable, Codable, Identifiable {
    // 声明一个int型的id
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    // 声明一个地图坐标信息属性
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    // 声明了一个内部结构体，表示坐标信息
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
