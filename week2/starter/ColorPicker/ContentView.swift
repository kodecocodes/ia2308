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

extension CGFloat {
  static let standardSpacing = 16.0
  static let smallSpacing = 4.0
  static let standardPadding = 16.0
}

struct ContentView: View {
  @Environment(\.verticalSizeClass) var verticalSizeClass
  
  @State private var redColor: Double = 0.0
  @State private var greenColor: Double = 0.0
  @State private var blueColor: Double = 0.0
  @State private var foregroundColor = Color(red: 0, green: 0, blue: 0)
  @State private var showForegroundShadow = false
  
  var body: some View {
    Group {
      if verticalSizeClass == .regular {
        VStack(spacing: .standardSpacing) {
          titleView
          colorSquare
          ColorSliderView(colorValue: $redColor, color: .red)
          ColorSliderView(colorValue: $greenColor, color: .green)
          ColorSliderView(colorValue: $blueColor, color: .blue)
          setColorButton
        }
      } else {
        HStack(spacing: .standardSpacing) {
          VStack(spacing: .standardSpacing) {
            titleView
            colorSquare
          }
          
          VStack(spacing: .standardSpacing) {
            ColorSliderView(colorValue: $redColor, color: .red)
            ColorSliderView(colorValue: $greenColor, color: .green)
            ColorSliderView(colorValue: $blueColor, color: .blue)
            setColorButton
          }
        }
      }
    }
    .background(Color(.systemBackground).ignoresSafeArea())
    .padding(.standardPadding)
  }
}

// MARK: - Views

extension ContentView {
  private var titleView: some View {
    Text("Color Picker")
      .font(.largeTitle)
      .fontWeight(.semibold)
  }
  
  private var colorSquare: some View {
    RoundedRectangle(cornerRadius: .zero)
      .fill(foregroundColor)
      .overlay(
        RoundedRectangle(cornerRadius: .zero)
          .strokeBorder(Color(.systemBackground).opacity(0.25), lineWidth: showForegroundShadow ? 8 : 0)
      )
      .overlay {
        RoundedRectangle(cornerRadius: .zero)
          .stroke(Color.primary, lineWidth: 1)
      }
  }
  
  private var setColorButton: some View {
    Button { setColor() } label: {
      Text("Set Color")
        .font(.caption)
        .fontWeight(.semibold)
        .foregroundColor(.white)
    }
    .buttonStyle(ColorButtonStyle())
  }
}

// MARK: - Helper functions

extension ContentView {
  private func setColor() {
    withAnimation {
      foregroundColor = .rgb(r: redColor, g: greenColor, b: blueColor)
      showForegroundShadow = true
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
