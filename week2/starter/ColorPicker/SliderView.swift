
import SwiftUI

struct RectView: View {
  @State private var alertIsVisible: Bool = false
  @State private var redColor: Double = 0.0
  @State private var greenColor: Double = 0.0
  @State private var blueColor: Double = 0.0
  @State private var foregroundColor = Color(red: 0, green: 0, blue: 0)
  
  var body: some View {
    RoundedRectangle(cornerRadius: 0)
      .foregroundColor(foregroundColor)
              .overlay(RoundedRectangle(cornerRadius: 0)
                                .stroke(foregroundColor, lineWidth: 10)
                                .opacity(0.5))
            
              .padding()
  }
  
}

struct SliderViewRed: View {
  @State private var alertIsVisible: Bool = false
  @State private var redColor: Double = 0.0
  @State private var greenColor: Double = 0.0
  @State private var blueColor: Double = 0.0
  @State private var foregroundColor = Color(red: 0, green: 0, blue: 0)
  
    var body: some View {
      Text("Red")
        .foregroundColor(Color("TextColor"))
        .font(.headline)
      HStack {
        Slider(value: $redColor, in: 0...255)
          .tint(Color.red)
        Text("\(Int(redColor.rounded()))")
      }
    }
}

struct SliderViewGreen: View {
  @State private var alertIsVisible: Bool = false
  @State private var redColor: Double = 0.0
  @State private var greenColor: Double = 0.0
  @State private var blueColor: Double = 0.0
  @State private var foregroundColor = Color(red: 0, green: 0, blue: 0)
  
  var body: some View {
    Text("Green")
      .foregroundColor(Color("TextColor"))
      .font(.headline)
    HStack {
      Slider(value: $greenColor, in: 0...255)
        .tint(Color.green)
      Text("\(Int(greenColor.rounded()))")
    }
  }
}

struct SliderViewBlue: View {
  @State private var alertIsVisible: Bool = false
  @State private var redColor: Double = 0.0
  @State private var greenColor: Double = 0.0
  @State private var blueColor: Double = 0.0
  @State private var foregroundColor = Color(red: 0, green: 0, blue: 0)
  
  var body: some View {
    Text("Blue")
      .foregroundColor(Color("TextColor"))
      .font(.headline)
    HStack {
      Slider(value: $blueColor, in: 0...255)
        .tint(Color.blue)
      Text("\(Int(blueColor.rounded()))")
    }
  }
}

struct ButtonView: View {
  @State private var alertIsVisible: Bool = false
  @State private var redColor: Double = 0.0
  @State private var greenColor: Double = 0.0
  @State private var blueColor: Double = 0.0
  @State private var foregroundColor = Color(red: 0, green: 0, blue: 0)
  
  var body: some View {
    Button("Set Color" .uppercased())
    {
      foregroundColor = Color(red: redColor / 255, green: greenColor / 255, blue: blueColor / 255)
    }
    .padding(20)
    .background(Color(.blue))
    .foregroundColor(.white)
    .cornerRadius(21.0)
  }
  
  struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
      RectView()
      SliderViewRed()
      SliderViewGreen()
      SliderViewBlue()
      ButtonView()
    }
  }
}
