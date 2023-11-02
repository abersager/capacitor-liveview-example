const Camera = require('@capacitor/camera')
exports.add = (a, b) => a + b

exports.getPhoto = async () => {
  try {
    const photo = await Camera.Camera.getPhoto({
      resultType: 'uri',
    });

    const image = self.shadowRoot.querySelector('#image');
    if (!image) {
      return;
    }

    image.src = photo.webPath;

    return photo.webPath;
  } catch (e) {
    console.warn('User cancelled', e);
  }
}
