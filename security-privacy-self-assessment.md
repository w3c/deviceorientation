# Security and Privacy Self-Review Questionnaire for DeviceOrientation Event

[Self-Review Questionnaire](https://www.w3.org/TR/security-privacy-questionnaire/)
responses for the [DeviceOrientation Event](https://www.w3.org/TR/orientation-event/) specification.

Related Self-Review Questionnaires:
- [Generic Sensor API](https://github.com/w3c/sensors/blob/main/security-questionnaire.md)
- [Orientation Sensor API](https://github.com/w3c/orientation-sensor/blob/main/security-questionnaire.md)

### 2.1 What information might this feature expose to Web sites or other parties, and for what purposes is that exposure necessary?

Information about the physical orientation and movement of the hosting device. See [use cases](https://www.w3.org/TR/orientation-event/#use-cases).

### 2.2 Do features in your specification expose the minimum amount of information necessary to enable their intended uses?

This specification allows developers to request access to only the set of sensor data necessary, either a "device motion" event for motion-controlled applications or a "device orientation" event for orientation control. Since absolute orientation exposes more information, a "relative orientation" option is available if the compass heading is unnecessary.

The data precision is normatively limited to resist fingerprinting (see 2.6).

### 2.3 How do the features in your specification deal with personal information, personally-identifiable information (PII), or information derived from them?

This specification does not deal with PII directly, however identifiable information such as gait can be determined from monitoring sensor readings over time. The specification requires users to give express permission for the user agent to provide device motion and/or orientation data. Furthermore, all interfaces are restricted to secure contexts to protect against both active and passive network attackers.

### 2.4 How do the features in your specification deal with sensitive information?

See 2.3.

### 2.5 Do the features in your specification introduce new state for an origin that persists across browsing sessions?

This specification defines new [permissions](https://www.w3.org/TR/orientation-event/#permissions-api-integration) for which user agents may persist the user's decision to grant access to a site between browsing sessions. Otherwise, sensors are completely stateless. 

### 2.6 Do the features in your specification expose information about the underlying platform to origins?

Minor manufacturing imperfections and differences unique to the underlying platform and the sensor hardware in the hosting device might be detected through readings over time.

The specification mitigates this type of passive fingerprinting by normatively limiting rotation and acceleration precision to at most 0.1 degrees, 0.1 degrees per second or 0.1 meters per second squared as appropriate. More context is available in a [paper](https://github.com/JensenPaul/sensor-fingerprint-mitigation).

### 2.7 Does this specification allow an origin to send data to the underlying platform?

No.

### 2.8 Do features in this specification enable access to device sensors?

Yes. See 2.1 and 2.2.

### 2.9 Do features in this specification enable new script execution/loading mechanisms?

No.

### 2.10 Do features in this specification allow an origin to access other devices?

No.

### 2.11 Do features in this specification allow an origin some measure of control over a user agent’s native UI?

The specification includes a method to request the user agent display a permission prompt, the contents of which are implementation-defined.

### 2.12 What temporary identifiers do the features in this specification create or expose to the web?

None.

### 2.13 How does this specification distinguish between behavior in first-party and third-party contexts?

The Permissions Policy integration controls whether third-party contexts are able to receive the events defined by this specification:

- The "deviceorientation" event requires the "accelerometer" and "gyroscope" features when providing relative orientation data. For the implementation to fall back to absolute orientation data, the "magnetometer" feature is also used.
- The "deviceorientationabsolute" event requires the "accelerometer", "gyroscope" and "magnetometer" features.
- The "devicemotion" event requires the "accelerometer" and "gyroscope" features.

The default allowlist for all policy-controlled features defined by this specification ("accelerometer", "gyroscope", and "magnetometer") is `"self"`, which does not allow third-party contexts to receive the events above and have access to the corresponding sensor readings.

### 2.14 How do the features in this specification work in the context of a browser’s Private Browsing or Incognito mode?

No difference to the browser's 'normal' state.

### 2.15 Does this specification have both "Security Considerations" and "Privacy Considerations" sections?

Yes, combined together.

### 2.16 Do features in your specification enable origins to downgrade default security protections?

No.

### 2.17 How does your feature handle non-"fully active" documents?

Events are fired on active windows only.

### 2.18 What should this questionnaire have asked?

That's all. Thank you for your review.
