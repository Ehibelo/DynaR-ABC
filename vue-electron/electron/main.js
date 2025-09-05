const { app, BrowserWindow, ipcMain } = require('electron')
const path = require('node:path')
const NODE_ENV = process.env.NODE_ENV || 'development' // 使用环境变量或默认为 'development'

// 创建主窗口
let mainWindow // 定义 mainWindow 变量

const createWindow = () => {
  mainWindow = new BrowserWindow({
    minWidth: 1200,
    minHeight: 850,
    resizable: true, // 设置为false禁止调整窗口大小
    center: true,
    frame: false,
    titleBarStyle: process.platform === 'darwin' ? 'hiddenInset' : 'default',
    webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
      nodeIntegration: NODE_ENV === 'development',
      contextIsolation: true,
      enableRemoteModule: false, // 假设你不再使用 remote 模块
      webSecurity: false
    }
  })
  mainWindow.setTitle('cacultor')
  mainWindow.loadURL(
    NODE_ENV === 'development'
      ? 'http://localhost:5173'
      : `file://${path.join(__dirname, '../dist/index.html')}`
  )

  mainWindow.setMenu(null)
  mainWindow.show()

  if (NODE_ENV === 'development') {
    mainWindow.webContents.openDevTools()
  }
}
app.whenReady().then(() => {
  ipcMain.on('window-minimize', () => {
    if (mainWindow) mainWindow.minimize()
  })

  ipcMain.on('window-maximize', () => {
    if (mainWindow) {
      if (mainWindow.isMaximized()) {
        mainWindow.unmaximize()
      } else {
        mainWindow.maximize()
      }
    }
  })

  ipcMain.on('window-close', () => {
    if (mainWindow) mainWindow.close()
  })
  createWindow()
})

app.on('activate', () => {
  if (BrowserWindow.getAllWindows().length === 0) createWindow()
})

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit()
})
