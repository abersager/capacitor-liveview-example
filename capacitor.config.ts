import { CapacitorConfig } from '@capacitor/cli'

const config: CapacitorConfig = {
  appId: 'com.oliverspindler.capacitor_liveview',
  appName: 'capacitor-liveview',
  webDir: 'dist',
  plugins: {
    SplashScreen: {
      launchShowDuration: 0
    }
  },
  server: {
    url: 'http://localhost:4000',
    allowNavigation: ['localhost:4000']
  }
}

export default config
