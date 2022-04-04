//
//  PhotoDetailsViewViewController.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import UIKit
import SDWebImage

class PhotoDetailsViewViewController: BaseViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    
    private var viewModel: PhotoDetailsViewModel
    
    init(photoData: PhotoData) {
        self.viewModel = .init(photoData: photoData)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Storyboard are a pain")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.sd_setImage(with: URL(string: viewModel.photoURL.value), completed: nil)
        photoImageView.enableZoom()
    }

    @IBAction func onPressBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension UIImageView {
  func enableZoom() {
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
    isUserInteractionEnabled = true
    addGestureRecognizer(pinchGesture)
  }

  @objc
  private func startZooming(_ sender: UIPinchGestureRecognizer) {
    let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
    guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
    sender.view?.transform = scale
    sender.scale = 1
  }
}
