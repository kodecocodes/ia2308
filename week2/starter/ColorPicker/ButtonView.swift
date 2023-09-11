//
//  ButtonView.swift
//  ColorPicker
//
//  Created by Frances Chamberlain on 9/10/23.
//

import SwiftUI

struct ButtonView: View {
    @Binding var colorFill: Color
    @Binding var redValue: Double
    @Binding var greenValue: Double
    @Binding var blueValue: Double
    
    var body: some View {
        Button("Set Color") {
            colorFill = Color(red: redValue/Constants.General.colorDivisor, green: greenValue/Constants.General.colorDivisor, blue: blueValue/Constants.General.colorDivisor)
        }
        .foregroundColor(.white)
        .frame(width: Constants.General.buttonFrameWidth, height: Constants.General.buttonFrameHeight)
        .background(Color.blue)
        .cornerRadius(Constants.General.buttonCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.buttonCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.buttonStrokeBorder)
        )
    }
}
