# Logic to build packages (RPM/DEB) using CPack; see https://cmake.org/Wiki/CMake:Packaging_With_CPack
# 

if(MSVC)
  set(CPACK_GENERATOR "NSIS")
  message("-- This is a Windows system")
endif()

set(LINUX_NAME "")
if(EXISTS "/etc/redhat-release")
   file(READ "/etc/redhat-release" LINUX_ISSUE)
   if(LINUX_ISSUE MATCHES "CentOS")
       set(CPACK_GENERATOR "RPM")
       set(CPACK_SYSTEM_NAME "centos")
		 set(CPACK_RPM_PACKAGE_REQUIRES   "centos-release-scl, epel-release, rh-python36, pcre, gmp, libuuid, sqlite, gtkmm30, boost-system, boost-filesystem, boost-program-options, boost-regex, libstdc++, dvipng, texlive")
       message("-- This is a CentOS system")
   endif()
   if(LINUX_ISSUE MATCHES "Scientific Linux")
       set(CPACK_GENERATOR "RPM")
       set(CPACK_SYSTEM_NAME "scientific7x")
		 set(CPACK_RPM_PACKAGE_REQUIRES   "yum-conf-softwarecollections, epel-release, rh-python36, pcre, gmp, libuuid, sqlite, gtkmm30, boost-system, boost-filesystem, boost-program-options, boost-regex, libstdc++, dvipng, texlive")
       message("-- This is a CentOS system")
   endif()
   if(LINUX_ISSUE MATCHES "Fedora")
       set(CPACK_GENERATOR   "RPM")
		 if(LINUX_ISSUE MATCHES "26")
			message("-- This is a Fedora 26 system")
			set(CPACK_RPM_PACKAGE_REQUIRES   "python3-libs, pcre, gmp, libuuid, sqlite, gtkmm30, boost-system, boost-filesystem, boost-program-options, boost-regex, libstdc++, python3-matplotlib, dvipng, texlive")
			set(CPACK_SYSTEM_NAME "fedora26")
		 elseif(LINUX_ISSUE MATCHES "27")
			message("-- This is a Fedora 27 system")
			set(CPACK_RPM_PACKAGE_REQUIRES   "python3-libs, pcre, gmp, libuuid, sqlite, gtkmm30, boost-system, boost-filesystem, boost-program-options, boost-regex, libstdc++, python3-matplotlib, dvipng, texlive")
			set(CPACK_SYSTEM_NAME "fedora27")
		 elseif(LINUX_ISSUE MATCHES "28")
			message("-- This is a Fedora 28 system")
			set(CPACK_RPM_PACKAGE_REQUIRES   "python3-libs, pcre, gmp, libuuid, sqlite, gtkmm30, boost-system, boost-filesystem, boost-program-options, boost-regex, libstdc++, python3-matplotlib, dvipng, texlive")
			set(CPACK_SYSTEM_NAME "fedora28")
		 elseif(LINUX_ISSUE MATCHES "29")
			message("-- This is a Fedora 29 system")
			set(CPACK_RPM_PACKAGE_REQUIRES   "python3-libs, pcre, gmp, libuuid, sqlite, gtkmm30, boost-system, boost-filesystem, boost-program-options, boost-regex, libstdc++, python3-matplotlib, dvipng, texlive")
			set(CPACK_SYSTEM_NAME "fedora29")
		 elseif(LINUX_ISSUE MATCHES "32")
			message("-- This is a Fedora 32 system")
			set(CPACK_RPM_PACKAGE_REQUIRES   "python3-libs, pcre, gmp, libuuid, sqlite, gtkmm30, boost-system, boost-filesystem, boost-program-options, boost-regex, libstdc++, python3-matplotlib, dvipng, texlive")
			set(CPACK_SYSTEM_NAME "fedora32")
		 elseif(LINUX_ISSUE MATCHES "24")
			message("-- This is a Fedora 24 system")
			set(CPACK_RPM_PACKAGE_REQUIRES   "python3-libs, pcre, gmp, libuuid, sqlite, gtkmm30, boost-system, boost-filesystem, boost-program-options, boost-regex, libstdc++, python3-matplotlib, dvipng, texlive")
			set(CPACK_SYSTEM_NAME "fedora24")
		 else()	
			message("-- This is a Fedora <24 system")
			set(CPACK_RPM_PACKAGE_REQUIRES   "python-libs, pcre, gmp, libuuid, sqlite, gtkmm30, boost-system, boost-filesystem, boost-program-options, boost-regex, libstdc++, python-matplotlib, dvipng, texlive")
			set(CPACK_SYSTEM_NAME "fedora")
		 endif()
   endif()
else()
   if(EXISTS "/etc/os-release")
     file(READ "/etc/os-release" LINUX_ISSUE)
	  if(LINUX_ISSUE MATCHES "15.0")
   	 set(CPACK_SYSTEM_NAME "leap150")
		 set(CPACK_GENERATOR   "RPM")
		 message("-- This is an openSUSE Leap 15.0 system")
		 set(CPACK_RPM_PACKAGE_REQUIRES   "libpython3_6m1_0, libpcre1, libgmp10, libuuid1, libsqlite3-0, libgtkmm-3_0-1, libboost_system1_66_0, libboost_filesystem1_66_0, libboost_program_options1_66_0, libboost_regex1_66_0, libstdc++6, python3-matplotlib, python3-sympy, texlive-dvipng, texlive")
	  endif()
	  if(LINUX_ISSUE MATCHES "Tumbleweed")
   	 set(CPACK_SYSTEM_NAME "tumbleweed")
		 set(CPACK_GENERATOR   "RPM")
		 message("-- This is an openSUSE Tumbleweed system")
		 set(CPACK_RPM_PACKAGE_REQUIRES   "libpython3_7m1_0, libpcre1, libgmp10, libuuid1, libsqlite3-0, libgtkmm-3_0-1, libboost_system1_71_0, libboost_filesystem1_71_0, libboost_program_options1_71_0, libboost_regex1_71_0, libstdc++6, python3-matplotlib, python3-sympy, texlive-dvipng, texlive")
	  endif()
	endif()
   if(EXISTS "/etc/issue")
      file(READ "/etc/issue" LINUX_ISSUE)
      if(LINUX_ISSUE MATCHES "openSUSE")
		  if(LINUX_ISSUE MATCHES "42.1")
   		 set(CPACK_SYSTEM_NAME "leap421")
			 set(CPACK_GENERATOR   "RPM")
			 message("-- This is an openSUSE Leap 42.1 system")
			 set(CPACK_RPM_PACKAGE_REQUIRES   "libpython3_4m1_0, libpcre1, libgmp10, libuuid1, libsqlite3-0, libgtkmm-3_0-1, libboost_system1_61_0, libboost_filesystem1_61_0, libboost_program_options1_61_0, libboost_regex1_61_0, libstdc++6, python3-matplotlib, texlive-dvipng, texlive")
		  endif()
      endif()
      if(LINUX_ISSUE MATCHES "Debian")
        set(CPACK_GENERATOR   "DEB")
		  if(PACKAGING_MODE)
			 set(PYTHON_SITE_PATH  "/usr/lib/python3/dist-packages")
			 set(INSTALL_LATEX_DIR  "/usr/share/texmf")
		  endif()
		  if(LINUX_ISSUE MATCHES "8")
   		 set(CPACK_SYSTEM_NAME "jessie")
			 set(CPACK_DEBIAN_PACKAGE_DEPENDS "python3, libpcre3, libpcrecpp0, libgmpxx4ldbl, libboost-system1.55.0, libboost-filesystem1.55.0, libboost-program-options1.55.0, libboost-regex1.55.0, libstdc++6, uuid-runtime, libgtkmm-3.0-1, texlive, texlive-latex-extra, python3-matplotlib, python3-mpmath, dvipng, python3-sympy, python3-gmpy2")
   		 message("-- This is a Debian Jessie 8.x system")
		  endif()
		  if(LINUX_ISSUE MATCHES "9")
   		 set(CPACK_SYSTEM_NAME "stretch")
			 set(CPACK_DEBIAN_PACKAGE_DEPENDS "python3, libpcre3, libpcrecpp0v5, libgmpxx4ldbl, libboost-system1.62.0, libboost-filesystem1.62.0, libboost-program-options1.62.0, libboost-regex1.62.0, libstdc++6, uuid-runtime, libgtkmm-3.0-1v5, texlive, texlive-latex-extra, python3-matplotlib, python3-mpmath, dvipng, python3-sympy, python3-gmpy2")
   		 message("-- This is a Debian Stretch 9.x system")
		  endif()
		  if(LINUX_ISSUE MATCHES "buster")
   		 set(CPACK_SYSTEM_NAME "buster")
			 set(CPACK_DEBIAN_PACKAGE_DEPENDS "python3, libpcre3, libpcrecpp0v5, libgmpxx4ldbl, libboost-system1.67.0, libboost-filesystem1.67.0, libboost-program-options1.67.0, libboost-regex1.67.0, libstdc++6, uuid-runtime, libgtkmm-3.0-1v5, texlive, texlive-latex-extra, python3-matplotlib, python3-mpmath, dvipng, python3-sympy, python3-gmpy2")
   		 message("-- This is a Debian Buster 10.x system")
		  endif()
		  if(LINUX_ISSUE MATCHES "10")
   		 set(CPACK_SYSTEM_NAME "buster")
			 set(CPACK_DEBIAN_PACKAGE_DEPENDS "python3, libpcre3, libpcrecpp0v5, libgmpxx4ldbl, libboost-system1.67.0, libboost-filesystem1.67.0, libboost-program-options1.67.0, libboost-regex1.67.0, libstdc++6, uuid-runtime, libgtkmm-3.0-1v5, texlive, texlive-latex-extra, python3-matplotlib, python3-mpmath, dvipng, python3-sympy, python3-gmpy2")
   		 message("-- This is a Debian Buster 10.x system")
		  endif()
		endif()
      if(LINUX_ISSUE MATCHES "Ubuntu")
        set(CPACK_GENERATOR   "DEB")
		  if(PACKAGING_MODE)
			 set(PYTHON_SITE_PATH  "/usr/lib/python3/dist-packages")
			 set(INSTALL_LATEX_DIR  "/usr/share/texmf")
		  endif()
		  if(LINUX_ISSUE MATCHES "14.04")
   		 set(CPACK_SYSTEM_NAME "trusty")
			 set(CPACK_DEBIAN_PACKAGE_DEPENDS "python3, libpcre3, libpcrecpp0, libgmpxx4ldbl, libboost-system1.54.0, libboost-filesystem1.54.0, libboost-program-options1.54.0, libboost-regex1.54.0, libstdc++6, uuid-runtime, libgtkmm-3.0-1, texlive, texlive-latex-extra, python3-matplotlib, python3-mpmath, dvipng, python-sympy")
   		 message("-- This is an Ubuntu 14.04 system")
		  endif()
		  if(LINUX_ISSUE MATCHES "16.04")
   		 set(CPACK_SYSTEM_NAME "xenial")
			 set(CPACK_DEBIAN_PACKAGE_DEPENDS "python3, libpcre3, libpcrecpp0v5, libgmpxx4ldbl, libboost-system1.58.0, libboost-filesystem1.58.0, libboost-program-options1.58.0, libboost-regex1.58.0, libstdc++6, uuid-runtime, libgtkmm-3.0-1v5, texlive, texlive-latex-extra, python3-matplotlib, python3-mpmath, dvipng, python3-sympy, python3-gmpy2")
   	  message("-- This is an Ubuntu 16.04 system")
		  endif()
		  if(LINUX_ISSUE MATCHES "17.10")
   		 set(CPACK_SYSTEM_NAME "artful")
			 set(CPACK_DEBIAN_PACKAGE_DEPENDS "python3, libpcre3, libpcrecpp0v5, libgmpxx4ldbl, libboost-system1.62.0, libboost-filesystem1.62.0, libboost-program-options1.62.0, libboost-regex1.62.0, libstdc++6, uuid-runtime, libgtkmm-3.0-1v5, texlive, texlive-latex-extra, python3-matplotlib, python3-mpmath, dvipng, python3-sympy, python3-gmpy2")
   	  message("-- This is an Ubuntu 17.10 system")
		  endif()
		  if(LINUX_ISSUE MATCHES "18.04")
   		 set(CPACK_SYSTEM_NAME "bionic")
			 set(CPACK_DEBIAN_PACKAGE_DEPENDS "python3, libpcre3, libpcrecpp0v5, libgmpxx4ldbl, libboost-system1.65.1, libboost-filesystem1.65.1, libboost-program-options1.65.1, libboost-regex1.65.1, libstdc++6, uuid-runtime, libgtkmm-3.0-1v5, texlive, texlive-latex-extra, python3-matplotlib, python3-mpmath, dvipng, python3-sympy, python3-gmpy2")
   	  message("-- This is an Ubuntu 18.04 system")
		  endif()
		  if(LINUX_ISSUE MATCHES "20.04")
   		 set(CPACK_SYSTEM_NAME "focal")
			 set(CPACK_DEBIAN_PACKAGE_DEPENDS "python3, libpcre3, libpcrecpp0v5, libgmpxx4ldbl, libboost-system1.71.0, libboost-filesystem1.71.0, libboost-program-options1.71.0, libboost-regex1.71.0, libstdc++6, uuid-runtime, libgtkmm-3.0-1v5, texlive, texlive-latex-extra, python3-matplotlib, python3-mpmath, dvipng, python3-sympy, python3-gmpy2")
   	  message("-- This is an Ubuntu 20.04 system")
		  endif()
      endif()
      if(LINUX_ISSUE MATCHES "Mint")
        set(CPACK_GENERATOR "DEB")
		  if(PACKAGING_MODE)
			 set(PYTHON_SITE_PATH   "/usr/lib/python3/dist-packages")
			 set(INSTALL_LATEX_DIR  "/usr/share/texmf")
		  endif()
		  if(LINUX_ISSUE MATCHES "20")
   		 message("-- This is a Linux Mint 20 system")
   		 set(CPACK_SYSTEM_NAME "ulyana")
			 set(CPACK_DEBIAN_PACKAGE_DEPENDS "python3, libpcre3, libpcrecpp0v5, libgmpxx4ldbl, libboost-system1.71.0, libboost-filesystem1.71.0, libboost-program-options1.71.0, libboost-regex1.71.0, libstdc++6, uuid-runtime, libgtkmm-3.0-1v5, texlive, texlive-latex-extra, python3-matplotlib, python3-mpmath, dvipng, python3-sympy, python3-gmpy2")
		  endif()
		  if(LINUX_ISSUE MATCHES "19")
   		 message("-- This is a Linux Mint 19 system")
   		 set(CPACK_SYSTEM_NAME "tessa")
			 set(CPACK_DEBIAN_PACKAGE_DEPENDS "python3, libpcre3, libpcrecpp0v5, libgmpxx4ldbl, libboost-system1.65.1, libboost-filesystem1.65.1, libboost-program-options1.65.1, libboost-regex1.65.1, libstdc++6, uuid-runtime, libgtkmm-3.0-1v5, texlive, texlive-latex-extra, python3-matplotlib, python3-mpmath, dvipng, python3-sympy, python3-gmpy2")
		  endif()
		  if(LINUX_ISSUE MATCHES "18")
   		 message("-- This is a Linux Mint 18 system")
   		 set(CPACK_SYSTEM_NAME "sarah")
			 set(CPACK_DEBIAN_PACKAGE_DEPENDS "python3, libpcre3, libpcrecpp0v5, libgmpxx4ldbl, libboost-system1.58.0, libboost-filesystem1.58.0, libboost-program-options1.58.0, libboost-regex1.58.0, libstdc++6, uuid-runtime, libgtkmm-3.0-1v5, texlive, texlive-latex-extra, python3-matplotlib, python3-mpmath, dvipng, python3-sympy, python3-gmpy2")
		  endif()
		  if(LINUX_ISSUE MATCHES "17")
   		 set(CPACK_SYSTEM_NAME "qiana")
   		 message("-- This is a Linux Mint 17 system")
			 set(CPACK_DEBIAN_PACKAGE_DEPENDS "python3, libpcre3, libpcrecpp0, libgmpxx4ldbl, libboost-system1.54.0, libboost-filesystem1.54.0, libboost-program-options1.54.0, libboost-regex1.54.0, libstdc++6, uuid-runtime, libgtkmm-3.0-1, texlive, texlive-latex-extra, python3-matplotlib, python3-mpmath, dvipng, python3-sympy")
		  endif()
      endif()
   endif()
endif()

# Ensure that on Windows we also install the libraries provided
# by Visual Studio, e.g. MSVCnnn.DLL. This does mean that the installer
# will now contain both the normal and the debug libraries, but better
# to have both than to have none.
#   set(CMAKE_INSTALL_DEBUG_LIBRARIES TRUE)
# That didn't work... Commented out for future reference.

include (InstallRequiredSystemLibraries)

set(CPACK_SET_DESTDIR true)
set(CPACK_INSTALL_PREFIX /usr)
set(CPACK_PACKAGE_NAME           "cadabra2")
set(CPACK_RESOURCE_FILE_LICENSE  "${CMAKE_CURRENT_SOURCE_DIR}/doc/license.txt")
set(CPACK_RPM_PACKAGE_LICENSE    "GPLv3")
set(CPACK_PACKAGE_VERSION_MAJOR  "${CADABRA_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR  "${CADABRA_VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH  "${CADABRA_VERSION_PATCH}")
if(NOT "${CADABRA_VERSION_TWEAK}" STREQUAL "0")
  set(CPACK_PACKAGE_VERSION_TWEAK  "${CADABRA_VERSION_TWEAK}")
  set(CPACK_PACKAGE_VERSION        "${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}.${CPACK_PACKAGE_VERSION_TWEAK}")
  message("-- Building tweak version")
else()
  message("-- Building normal version (no tweak)")
endif()
set(CPACK_PACKAGE_VENDOR         "Kasper Peeters")
set(CPACK_PACKAGE_CONTACT        "Kasper Peeters <kasper.peeters@phi-sci.com>")
set(CPACK_STRIP_FILES            ON)
set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA ${CMAKE_CURRENT_BINARY_DIR}/postinst)
set(CPACK_RPM_POST_INSTALL_SCRIPT_FILE ${CMAKE_CURRENT_BINARY_DIR}/postinst)
#set(CPACK_RPM_EXCLUDE_FROM_AUTO_FILELIST /usr /usr/lib64 /usr/lib64/python2.7 /usr/bin /usr/lib /usr/share /usr/share/texlive)
unset(CPACK_RPM_PACKAGE_RELOCATABLE)

#xdg-desktop-menu install <install>/share/applications/MyApp.desktop

set(CPACK_DEBIAN_PACKAGE_SECTION "math")
set(CPACK_RPM_PACKAGE_GROUP      "Applications/Productivity")

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "field-theory motivated computer algebra system")
set(CPACK_PACKAGE_DESCRIPTION_FILE ${CMAKE_CURRENT_SOURCE_DIR}/doc/description)
include(CPack)
