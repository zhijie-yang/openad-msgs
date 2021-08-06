cmake_minimum_required(VERSION 3.14.0)
project(openad_monitor_msgs)

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)

file(GLOB_RECURSE abs_message_files msg/*.msg)
set(rel_message_files)
foreach(message_file ${abs_message_files})
    file(RELATIVE_PATH _file ${CMAKE_CURRENT_LIST_DIR}/msg ${message_file})
    list(APPEND rel_message_files msg/${_file})
endforeach()

rosidl_generate_interfaces(${PROJECT_NAME}
    ${rel_message_files}
 )

ament_package()

 