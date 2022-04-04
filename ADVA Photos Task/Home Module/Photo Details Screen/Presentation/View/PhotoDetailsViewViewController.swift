//
//  PhotoDetailsViewViewController.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import UIKit

class PhotoDetailsViewViewController: BaseViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoImageView: AsyncImageView!
    
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
        setupScrollView()
        loadPhotoImage()
    }

    @IBAction func onPressBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

// MARK: - Private Methods

private extension PhotoDetailsViewViewController {
    func setupScrollView() {
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 10.0
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    func loadPhotoImage() {
        photoImageView.setImage(using: viewModel.photoURL)
    }
}

// MARK: - UIScrollViewDelegate

extension PhotoDetailsViewViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoImageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        guard
            let image = photoImageView.image,
            scrollView.zoomScale > 1
        else {
            scrollView.contentInset = .zero
            return
        }
        
        let ratioW = photoImageView.frame.width / image.size.width
        let ratioH = photoImageView.frame.height / image.size.height
        
        let ratio = ratioW < ratioH ? ratioW : ratioH
        let newWidth = image.size.width * ratio
        let newHeight = image.size.height * ratio
        let conditionLeft = newWidth*scrollView.zoomScale > photoImageView.frame.width
        let left = 0.5 * (conditionLeft ? newWidth - photoImageView.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
        let conditioTop = newHeight*scrollView.zoomScale > photoImageView.frame.height
        
        let top = 0.5 * (conditioTop ? newHeight - photoImageView.frame.height : (scrollView.frame.height - scrollView.contentSize.height))
        
        scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
    }
}
