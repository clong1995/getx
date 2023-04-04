#include "include/getx/getx_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "getx_plugin.h"

void GetxPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  getx::GetxPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
