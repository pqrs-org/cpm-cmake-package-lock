set(CPM_SOURCE_CACHE "${CMAKE_CURRENT_LIST_DIR}/tmp/cpm/source_cache")

add_custom_target(vendor_headers ALL)

function(copy_vendor_headers SRC DIR_DEST_SUB)
  if(DIR_DEST_SUB STREQUAL "")
    set(_dst "${VENDOR_INCLUDE_DIR}")
  else()
    set(_dst "${VENDOR_INCLUDE_DIR}/${DIR_DEST_SUB}")
  endif()

  add_custom_command(
    TARGET vendor_headers PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory "${SRC}" "${_dst}"
    COMMENT "Vendoring: ${SRC} -> ${_dst}"
  )
endfunction()

function(copy_vendor_package PKG)
  get_property(done GLOBAL PROPERTY _COPIED_PACKAGES)
  list(FIND done "${PKG}" _idx)
  if(_idx GREATER -1)
    return()
  endif()
  list(APPEND done "${PKG}")
  set_property(GLOBAL PROPERTY _COPIED_PACKAGES "${done}")

  if(DEFINED _HDR_SUB_${PKG})
    set(src_sub "${_HDR_SUB_${PKG}}")
  else()
    set(src_sub "include")
  endif()

  if(DEFINED _DST_SUB_${PKG})
    set(dst_sub "${_DST_SUB_${PKG}}")
  else()
    set(dst_sub "")
  endif()

  CPMAddPackage(NAME ${PKG})

  copy_vendor_headers("${${PKG}_SOURCE_DIR}/${src_sub}" "${dst_sub}")

  if(DEFINED _DEPS_${PKG})
    foreach(dep IN LISTS _DEPS_${PKG})
      copy_vendor_package("${dep}")
    endforeach()
  endif()
endfunction()
