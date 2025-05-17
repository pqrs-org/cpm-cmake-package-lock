# To perform `git clone` only when necessary, we declare the package using CPMDeclarePackage here,
# and call CPMAddPackage only when it is actually needed.
CPMDeclarePackage(pqrs_shell    NAME pqrs_shell     GITHUB_REPOSITORY pqrs-org/cpp-shell    GIT_TAG v1.1.32)
CPMDeclarePackage(pqrs_string   NAME pqrs_string    GITHUB_REPOSITORY pqrs-org/cpp-string   GIT_TAG v1.5.15)
CPMDeclarePackage(utfcpp        NAME utfcpp         GITHUB_REPOSITORY nemtrif/utfcpp        GIT_TAG v4.0.6)

#
# Extra Package Info
#

set(_HDR_SUB_utfcpp "source")
set(_DST_SUB_utfcpp "utf8cpp")
