#define COMPONENT medical_menu
#define COMPONENT_BEAUTIFIED Medical Menu
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MEDICAL_MENU
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL_MENU
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL_MENU
#endif

#include "\z\ace\addons\main\script_macros.hpp"
#include "\z\ace\addons\medical\script_macros_medical.hpp"

// Used to scale a bloodloss value for color representation
#define BLEEDING_COLOR_FACTOR 20
