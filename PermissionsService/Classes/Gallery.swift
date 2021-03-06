//
//  Gallery.swift
//
//  Created by Volodymyr Hyrka on 2/9/16.
//  Copyright © 2016 LembergSolutions. All rights reserved.
//

import Foundation
import Photos

public final class Gallery: PermissionService {
    
  public init() {}
  
  public func checkStatus() -> PermissionStatus {
    let statusInt = PHPhotoLibrary.authorizationStatus().rawValue
    guard let status = PermissionStatus(rawValue: statusInt), (0...3) ~= statusInt else {
      assertionFailure("Impossible status")
      return .notDetermined
    }
    return status
  }
  
  public func requestStatus(_ requestGranted: @escaping (_ successRequestResult: Bool) -> Void) {
    PHPhotoLibrary.requestAuthorization({ (newStatus) -> Void in
      let success = newStatus == PHAuthorizationStatus.authorized
      requestGranted(success)
    })
  }
  
}
