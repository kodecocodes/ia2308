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

      RoundedRectangle(cornerRadius: 0)
        .fill(foregroundColor)
        .border(foregroundColor)
        .padding(.leading)
        .padding(.trailing)
      
      VStack {
        Text("Red")
          .foregroundColor(Color("TextColor"))
        HStack {
          Slider(value: $redColor, in: 0...255)
          Text("\(Int(redColor.rounded()))")
        }
      }
      .padding()
      VStack {
        Text("Green")
          .foregroundColor(Color("TextColor"))
        HStack {
          Slider(value: $greenColor, in: 0...255)
          Text("\(Int(greenColor.rounded()))")
        }
      }
      .padding()
      VStack {
        Text("Blue")
          .foregroundColor(Color("TextColor"))
        HStack {
          Slider(value: $blueColor, in: 0...255)
          Text("\(Int(blueColor.rounded()))")
        }
      }
      .padding()
      Button("Set Color") {
        foregroundColor = Color(red: redColor / 255, green: greenColor / 255, blue: blueColor / 255)
      }
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
