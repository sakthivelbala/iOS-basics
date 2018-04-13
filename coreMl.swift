//
//  coreMl.swift
//  sampleapp
//
//  Created by Sakthivel Balakrishnan on 08/04/18.
//  Copyright © 2018 Sakthivel Balakrishnan. All rights reserved.
//

import UIKit
import AVKit
class coreMl: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let captureSession=AVCaptureSession()
        guard let captureDevice=AVCaptureDevice.default(for: .video) else {return }
        guard let input=try? AVCaptureDeviceInput(device: captureDevice)else {return }
        captureSession.addInput(input)
        captureSession.startRunning()
        let previewLayer=AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame=view.frame
        view.layer.addSublayer(previewLayer)
    }
}
