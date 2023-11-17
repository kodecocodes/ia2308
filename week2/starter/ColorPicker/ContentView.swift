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

enum Constants {
    static let maxColorValue: Double = 255.0
}

struct ContentView: View {
  @State private var redColor: Double = Constants.maxColorValue
  @State private var greenColor: Double = Constants.maxColorValue
  @State private var blueColor: Double = Constants.maxColorValue
  @State private var foregroundColor = Color(red: 250.0/Constants.maxColorValue, green: 100.0/Constants.maxColorValue, blue: 50.0/Constants.maxColorValue)
  
  private func getColor() -> Color {
    let redPercentage = redColor / Constants.maxColorValue
    let greenPercentage = greenColor / Constants.maxColorValue
    let bluePercentage = blueColor / Constants.maxColorValue
    return Color(red: redPercentage, green: greenPercentage, blue: bluePercentage)
  }
  
  var body: some View {
    GeometryReader { geometry in
      ScrollView {
        HStack{
          VStack {
            VStack {
              Text("Color Picker")
                .font(.largeTitle)
                .foregroundColor(.primary)
              
              VStack {
                RoundedRectangle(cornerRadius: 0)
                  .foregroundColor(getColor())
                  .border(Color.black.opacity(0.3), width: 5)
                  .background(Color.white)
                  .padding(20)
                  .frame(width: geometry.size.width - 20, height: geometry.size.height / (geometry.size.width > geometry.size.height ? 4 : 2))
                
                VStack {
                  ColorSliderView(colorValue: $redColor, colorName: "Red", foregroundColor: $foregroundColor)
                    .accentColor(.red)
                  ColorSliderView(colorValue: $greenColor, colorName: "Green", foregroundColor: $foregroundColor)
                    .accentColor(.green)
                  ColorSliderView(colorValue: $blueColor, colorName: "Blue", foregroundColor: $foregroundColor)
                    .accentColor(.blue)
                  
                }
                .frame(width: geometry.size.width - 30)
                
                CustomButtonView(foregroundColor: $foregroundColor, redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor)
                Spacer()
              }
              Spacer()
                .padding(20)
              
            }
            .background(Color.clear)
            .padding(20)
          }
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}



