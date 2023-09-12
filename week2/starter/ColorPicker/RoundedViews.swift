import SwiftUI

struct ColorSliderView: View {
  @Binding var value: Double
  let label: String
  let color: Color
  
  var body: some View {
    VStack {
      Text("\(label)")
      
      HStack {
        Slider(value: $value, in: 0...255)
          .accentColor(color)
        Text("\(Int(value.rounded()))")
      }
    }
  }
  
}



struct ButtonView: View {
  @Binding var foregroudColor: Color
  @Binding var redValue: Double
  @Binding var greenValue: Double
  @Binding var blueValue: Double
  let label: String
  
  var body: some View {
    Button(action: {
      foregroudColor =  Color(red: redValue / 255.0, green: greenValue / 255.0, blue: blueValue / 255.0)
      
    }) {
      Text("\(label)")
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
  }
  
}
