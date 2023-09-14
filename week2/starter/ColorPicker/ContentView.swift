/// Copyright (c) 2023 Kodeco Inc.
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

enum SliderColors {
  case red
  case green
  case blue
  
  var color: Color {
    switch self {
    case .red:
      return Color.red
    case .green:
      return Color.green
    case .blue:
      return Color.blue
    }
  }
}

struct TitleTextView: View {
  var text: String
  var body: some View{
    Text(text)
      .font(.largeTitle).bold()
  }
}

struct RectangleView: View{
  var height: CGFloat
  var width: CGFloat
  var frameWidth: CGFloat
  var borderColor: Color
  var foregroundColor: Color
  
  var body: some View{
    RoundedRectangle(cornerRadius: 0)
      .frame(width: width, height: height)
      .foregroundColor(foregroundColor)
      .border(borderColor,width: frameWidth)
  }
}

struct SliderView: View{
  var title: String
  var tintColor: SliderColors
  @Binding var colorValue: Double
  
  var body: some View{
    VStack {
      Text("\(title): \(Int(colorValue))")
      HStack {
        Slider(value: $colorValue, in: 0...DrawingConstants.colorRangeValue)
          .tint(tintColor.color)
        Text("\(Int(DrawingConstants.colorRangeValue))")
      }
    }
  }
}

struct SetColorButton: View{
  var text: String
  @Binding var foregroundColor: Color
  var redColor: Double
  var greenColor: Double
  var blueColor: Double
  
  var body: some View{
    Button(text){
      foregroundColor = Color(red: redColor / DrawingConstants.colorRangeValue, green: greenColor / DrawingConstants.colorRangeValue, blue: blueColor / DrawingConstants.colorRangeValue)
    }
    .buttonStyle(.borderedProminent)
    .tint(.blue)
  }
}

enum DrawingConstants {
  static let frameWidth = 10.0
  static let colorRangeValue: Double = 255.0
  static let outerGroupPadding = 20.0
  static let landscapeModeRecatngleScale = 0.8
  
}

struct ThreeSlidersView: View{
  @Binding var redColor: Double
  @Binding var greenColor: Double
  @Binding var blueColor: Double
  
  var body: some View{
    SliderView(title: "Red", tintColor: .red, colorValue: $redColor)
    SliderView(title: "Green", tintColor: .green, colorValue: $greenColor)
    SliderView(title: "Blue", tintColor: .blue, colorValue: $blueColor)
  }
}


struct ContentView: View {
  
  @Environment (\.verticalSizeClass) var verticalSizeClass
  var isLandScape: Bool {
    verticalSizeClass == .compact
  }
  
  @State private var redColor: Double = 0.0
  @State private var greenColor: Double = 0.0
  @State private var blueColor: Double = 0.0
  @State private var foregroundColor = Color(red: 0, green: 0, blue: 0)
  
  var titleText = "Color Picker"
  
  private var borderColor : Color {
    let uiColor = UIColor(foregroundColor).lighter()
    return Color(uiColor)
  }
  
  var landscameView: some View {
    VStack {
      TitleTextView(text: titleText)
      HStack{
        RectangleView(height : 300, width: 300, frameWidth: DrawingConstants.frameWidth, borderColor: borderColor, foregroundColor: foregroundColor)
        VStack {
          ThreeSlidersView(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor)
          SetColorButton(text: "Set Color", foregroundColor: $foregroundColor, redColor: redColor, greenColor: greenColor, blueColor: blueColor)
        }
      }
    }
  }
  
  var portraitView: some View {
    VStack {
      
      TitleTextView(text: titleText)
      
      RectangleView(height : 300, width: 300, frameWidth: DrawingConstants.frameWidth, borderColor: borderColor, foregroundColor: foregroundColor)
      
      ThreeSlidersView(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor)
      
      SetColorButton(text: "Set Color", foregroundColor: $foregroundColor, redColor: redColor, greenColor: greenColor, blueColor: blueColor)
    }
  }
  
  
  var body: some View {
    
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea()
      Group{
        if isLandScape{
          landscameView
        }else{
          portraitView
        }
      }
      .padding()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}


// Lighter and Darker Color in SwiftUI components I got from here:
// https://www.advancedswift.com/lighter-and-darker-uicolor-swift/

extension UIColor {
  private func makeColor(componentDelta: CGFloat) -> UIColor {
    var red: CGFloat = 0
    var blue: CGFloat = 0
    var green: CGFloat = 0
    var alpha: CGFloat = 0
    
    // Extract r,g,b,a components from the
    // current UIColor
    getRed(
      &red,
      green: &green,
      blue: &blue,
      alpha: &alpha
    )
    
    // Create a new UIColor modifying each component
    // by componentDelta, making the new UIColor either
    // lighter or darker.
    return UIColor(
      red: add(componentDelta, toComponent: red),
      green: add(componentDelta, toComponent: green),
      blue: add(componentDelta, toComponent: blue),
      alpha: alpha
    )
  }
}
extension UIColor {
  // Add value to component ensuring the result is
  // between 0 and 1
  private func add(_ value: CGFloat, toComponent: CGFloat) -> CGFloat {
    return max(0, min(1, toComponent + value))
  }
}

extension UIColor {
  func lighter(componentDelta: CGFloat = 0.1) -> UIColor {
    return makeColor(componentDelta: componentDelta)
  }
  
  func darker(componentDelta: CGFloat = 0.1) -> UIColor {
    return makeColor(componentDelta: -1*componentDelta)
  }
}
