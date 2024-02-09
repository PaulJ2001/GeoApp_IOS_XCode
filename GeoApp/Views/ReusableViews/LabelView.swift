//
//  LabelView.swift
//  GeoApp
//
//  Created by Paul James on 2023-10-02.
//

import SwiftUI

struct LabelView: View {
    
    var label: String
    
    
    var body: some View {
        Text("\(label)")
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView(label: "test")
    }
}
