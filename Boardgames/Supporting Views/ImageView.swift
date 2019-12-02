
import SwiftUI

struct ImageView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()
    var frameWidth: CGFloat
    var frameHeight: CGFloat
    
    init(withURL url: String, width: CGFloat, height: CGFloat) {
        imageLoader = ImageLoader(urlString: url)
        frameWidth = width
        frameHeight = height
    }

    var body: some View {
        VStack {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: frameWidth, height: frameHeight)
            }.onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
    }
