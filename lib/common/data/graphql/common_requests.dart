const logoutMutation = r"""
mutation logout($device: DeviceEnum!) {
  logout(device: $device) {
    code
    success
    message
  }
}
""";

const updateFcmTokenMutation = r"""
mutation updateFcmToken($fcmToken: String!, $device: DeviceEnum!) {
  updateFcmToken(fcmToken: $fcmToken, device: $device) {
    code
    success
    message
  }
}
""";