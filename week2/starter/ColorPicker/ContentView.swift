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
        .foregroundColor(foregroundColor)
        .overlay(RoundedRectangle(cornerRadius: 0)
                          .stroke(foregroundColor, lineWidth: 10)
                          .opacity(0.5))
      
        .padding()
      
      VStack {
        Text("Red")
          .foregroundColor(Color("TextColor"))
          .font(.headline)
        HStack {
          Slider(value: $redColor, in: 0...255)
            .tint(Color.red)
          Text("\(Int(redColor.rounded()))")
        }
      }
      
      .padding()
      
      VStack {
        Text("Green")
          .foregroundColor(Color("TextColor"))
          .font(.headline)
        HStack {
          Slider(value: $greenColor, in: 0...255)
            .tint(Color.green)
          Text("\(Int(greenColor.rounded()))")
        }
      }
      
      .padding()
      
      VStack {
        Text("Blue")
          .foregroundColor(Color("TextColor"))
          .font(.headline)
        HStack {
          Slider(value: $blueColor, in: 0...255)
            .tint(Color.blue)
          Text("\(Int(blueColor.rounded()))")
        }
      }
      
      .padding()
      
      Button("Set Color" .uppercased())
        {
        foregroundColor = Color(red: redColor / 255, green: greenColor / 255, blue: blueColor / 255)
      }
        .padding(20)
        .background(Color(.blue))
        .foregroundColor(.white)
        .cornerRadius(21.0)
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
