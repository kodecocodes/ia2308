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

struct ContentView: View {
  @State private var redSliderValue: Double = 0.0
  @State private var greenSliderValue: Double = 0.0
  @State private var blueSliderValue: Double = 0.0
  @State private var chosenColor = Color(red: 0, green: 0, blue: 0)
  @State private var colorPicker = ColorPicker()

  var body: some View {
    VStack {
      Text("Color Picker")
        .font(.largeTitle)
      ChosenColorView(chosenColor: $colorPicker.chosenColor)
      ColorSliderView(color: $colorPicker.redSliderValue, name: "Red")
      ColorSliderView(color: $colorPicker.greenSliderValue, name: "Green")
      ColorSliderView(color: $colorPicker.blueSliderValue, name: "Blue")
      SetColorButton(colorPicker: $colorPicker)
    }
    .background(Color.white)
    .padding(20)
  }
}

struct ChosenColorView: View {
  @Binding var chosenColor: Color

  var body: some View {
    RoundedRectangle(cornerRadius: 0)
      .foregroundColor(chosenColor)
      .border(.black)
  }
}

struct SetColorButton: View {
  @Binding var colorPicker: ColorPicker

  var body: some View {
    Button("Set Color") {
      colorPicker.setChosenColor()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
