//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 王详 on 2023/3/21.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        // 过滤所有的landmarks
        // 当开启只展示收藏的开关的时候，则
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                // 通过开关绑定控制showFavoritesOnly来控制下面列表展示全部还是只展示喜欢
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                    Text("Shawn King")
                }
                ForEach(filteredLandmarks) {landmark in
                    // 神奇，这个就是点击跳转
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    }label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }.navigationTitle("Landmarks")
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
    }
}
