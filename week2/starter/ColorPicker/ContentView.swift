import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  @State private var redColor: Double = 0.0
  @State private var greenColor: Double = 0.0
  @State private var blueColor: Double = 0.0
  @State private var foregroundColor = Color(red: 0, green: 0, blue: 0)

  var body: some View {

    VStack {
      Text("Color Picker")
        .font(.largeTitle)
        .foregroundColor(Color("TextColor"))
      RectView()
        .padding()
      VStack {
        SliderViewRed()
      }
      .padding()
      VStack {
        SliderViewGreen()
      }
      .padding()
      VStack {
        SliderViewBlue()
      }
      .padding()
      ButtonView()
    }
    .padding(20)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .preferredColorScheme(.dark)
      .previewDevice("Iphone 14 Pro Max")
  }
}
