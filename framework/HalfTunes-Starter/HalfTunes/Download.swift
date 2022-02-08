//
//  Download.swift
//  HalfTunes
//
//  Created by Muzlive on 2022/01/26.
//  Copyright © 2022 Ray Wenderlich. All rights reserved.
//

import Foundation

class Download {
  var track: Track
  init(track: Track) {
    self.track = track
  }
  
  // Download service sets these values:
  var task: URLSessionDownloadTask?
  var isDownloading = false
  var resumeData: Data?
  
  // Download delegate sets this value:
  var progress: Float = 0
}
