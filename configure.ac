#=========================================================================
# Toplevel configure.ac for the Modular Verilog/ASIC Build System
#=========================================================================

#-------------------------------------------------------------------------
# Project metadata
#-------------------------------------------------------------------------

m4_define( proj_name,         [Modular Verilog/ASIC Build System])
m4_define( proj_maintainer,   [Christopher Batten])
m4_define( proj_abbreviation, [mvabs])

#-------------------------------------------------------------------------
# Project version information
#-------------------------------------------------------------------------
# Version information is meant to be managed through a version control
# system's tags and revision numbers. In a working copy the version will
# not be defined here (you should just use the version control system's
# mechanisms). When we make a distribution then we can set the version
# here as formed by the scripts/vcs-version.sh script so that the
# distribution knows what version it came from. If you are not using
# version control then it is fine to set this directly.

m4_define( proj_version, [?])

#-------------------------------------------------------------------------
# Setup
#-------------------------------------------------------------------------

AC_INIT(proj_name,proj_version,proj_maintainer,proj_abbreviation)
AC_CONFIG_SRCDIR([Makefile.in])
AC_CONFIG_AUX_DIR([scripts])
AC_CANONICAL_BUILD

#-------------------------------------------------------------------------
# Basic checks
#-------------------------------------------------------------------------

MVABS_PROG_VERILOG_COMPILER

#-------------------------------------------------------------------------
# Output
#-------------------------------------------------------------------------

AC_CONFIG_FILES([Makefile])
AC_OUTPUT

