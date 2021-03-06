import CoreLocation

/// A value type wrapper for `CLBeacon`. This type is necessary so that we can do equality checks
/// and write tests against its values.
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct Beacon: Hashable {
  public let rawValue: CLBeacon?

  public var accuracy: CLLocationAccuracy
  public var major: NSNumber
  public var minor: NSNumber
  public var proximity: CLProximity
  public var rssi: Int
  public var timestamp: Date
  public var uuid: UUID

  public init(rawValue: CLBeacon) {
    self.rawValue = rawValue

    self.accuracy = rawValue.accuracy
    self.major = rawValue.major
    self.minor = rawValue.minor
    self.proximity = rawValue.proximity
    self.rssi = rawValue.rssi
    if #available(iOS 13, *) {
      self.timestamp = rawValue.timestamp
    } else {
      self.timestamp = Date()
    }
    if #available(iOS 13, *) {
      self.uuid = rawValue.uuid
    } else {
      self.uuid = rawValue.proximityUUID
    }
  }

  init(
    accuracy: CLLocationAccuracy,
    major: NSNumber,
    minor: NSNumber,
    proximity: CLProximity,
    rssi: Int,
    timestamp: Date,
    uuid: UUID
  ) {
    self.rawValue = nil
    self.accuracy = accuracy
    self.major = major
    self.minor = minor
    self.proximity = proximity
    self.rssi = rssi
    self.timestamp = timestamp
    self.uuid = uuid
  }
}
