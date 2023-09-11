import SwiftUI

struct ContentView: View {
       
       @Environment(\.horizontalSizeClass) var horizontalSizeClass
       @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
            if horizontalSizeClass == .compact && verticalSizeClass == .regular {
                // Device is in Portrait mode
                VertiView()
            } else {
                // Device is in Landscape mode
                HoriView()
            }
      }
      
    }
    
  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
      ContentView().preferredColorScheme(.dark)
      
    }
  }
