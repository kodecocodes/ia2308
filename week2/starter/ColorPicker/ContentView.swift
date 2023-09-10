import SwiftUI

struct ContentView: View {
  @Environment(\.colorScheme) var colorScheme
  @State private var alertIsVisible: Bool = false
  @State private var redColor: Double = 0.0
  @State private var greenColor: Double = 0.0
  @State private var blueColor: Double = 0.0
  @State private var foregroundColor = Color(red: 0, green: 0, blue: 0)
  
  
  var body: some View {
     VStack {
        Text("Color Picker")
          .font(.largeTitle)
          .padding()
        
        ColorPreviewView(color: $foregroundColor)
          .padding()
        
        ColorSliderView(colorValue: $redColor, label: "Rojo", accentColor: .red)
        ColorSliderView(colorValue: $greenColor, label: "Verde", accentColor: .green)
        ColorSliderView(colorValue: $blueColor, label: "Azul", accentColor: .blue)
        
        Button("Set Color") {
          foregroundColor = Color(red: redColor / Constants.General.maxValue,
                                  green: greenColor / Constants.General.maxValue,
                                  blue: blueColor / Constants.General.maxValue)
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .stroke(Color.white, lineWidth: 2)
        )
      }
      .background(colorScheme == .dark ? Color.black : Color.white)
      .padding(10)
    }
    
  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
      ContentView().preferredColorScheme(.dark)
      
    }
  }
}
