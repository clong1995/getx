//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <getx/getx_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) getx_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "GetxPlugin");
  getx_plugin_register_with_registrar(getx_registrar);
}
