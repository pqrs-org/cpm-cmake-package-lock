cmake_minimum_required(VERSION 3.24 FATAL_ERROR)
project(vendor NONE)

include("${CMAKE_CURRENT_LIST_DIR}/../vendor/CPM.cmake")

CPMUsePackageLock("${CMAKE_CURRENT_LIST_DIR}/../cmake/package-lock.cmake")

set(VENDOR_INCLUDE_DIR "${CMAKE_CURRENT_LIST_DIR}/vendor/include")
file(MAKE_DIRECTORY "${VENDOR_INCLUDE_DIR}")

include("${CMAKE_CURRENT_LIST_DIR}/../cmake/common.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../cmake/dependency.cmake")

copy_vendor_package("pqrs_shell")
