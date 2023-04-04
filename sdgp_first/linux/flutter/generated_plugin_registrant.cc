//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <modal_progress_hud_nsn/modal_progress_hud_nsn_plugin.h>
#include <tflite_flutter/tflite_flutter_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) modal_progress_hud_nsn_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ModalProgressHudNsnPlugin");
  modal_progress_hud_nsn_plugin_register_with_registrar(modal_progress_hud_nsn_registrar);
  g_autoptr(FlPluginRegistrar) tflite_flutter_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "TfliteFlutterPlugin");
  tflite_flutter_plugin_register_with_registrar(tflite_flutter_registrar);
}
