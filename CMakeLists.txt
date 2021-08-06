cmake_minimum_required(VERSION 3.14.0)
project(openad-msgs)

set(ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})
message("-- ROOT_DIR: ${ROOT_DIR}")

add_subdirectory(openad_monitor_msgs)
add_subdirectory(openad_vehicle_msgs)
add_subdirectory(openad_control_msgs)
#############
##  CPack  ##
#############

set(CPACK_GENERATOR "DEB")

set(CPACK_PACKAGE_NAME ${PROJECT_NAME})
set(CPACK_PACKAGE_VERSION ${MODULE_VERSION})
set(CPACK_PACKAGE_CONTACT "zhijie.yang@tum.de")

set(CPACK_SET_DESTDIR ON)
set(CPACK_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX})

# Set dependency Auto/Manual
# set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)
set(CPACK_DEBIAN_PACKAGE_DEPENDS "ros-foxy-desktop")
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)

include(CPack)
