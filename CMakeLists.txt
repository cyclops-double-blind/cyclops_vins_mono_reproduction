cmake_minimum_required(VERSION 3.0.2)
project(vinsmono_docker)

find_package(catkin REQUIRED COMPONENTS rospy std_msgs)

catkin_package()

add_custom_target(
  vinsmono_docker_container ALL
  COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/tools/build)
