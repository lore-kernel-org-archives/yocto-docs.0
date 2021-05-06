Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.151.1620322108214331147
 for <docs@lists.yoctoproject.org>;
 Thu, 06 May 2021 10:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: from localhost (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5A529240004;
	Thu,  6 May 2021 17:28:26 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: reduce verbosity related to "the following" expression
Date: Thu,  6 May 2021 19:28:23 +0200
Message-Id: <20210506172823.127144-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/README                          |  2 +-
 documentation/dev-manual/common-tasks.rst     | 10 +++++-----
 documentation/dev-manual/qemu.rst             |  6 +++---
 documentation/kernel-dev/common.rst           |  4 ++--
 documentation/kernel-dev/concepts-appx.rst    |  3 +--
 documentation/kernel-dev/faq.rst              |  2 +-
 documentation/overview-manual/intro.rst       |  2 +-
 documentation/overview-manual/yp-intro.rst    | 20 ++++++++-----------
 documentation/ref-manual/classes.rst          |  2 +-
 documentation/ref-manual/features.rst         |  2 +-
 .../ref-manual/system-requirements.rst        | 10 +++++-----
 documentation/ref-manual/variables.rst        |  2 +-
 documentation/toaster-manual/reference.rst    | 12 +++++------
 13 files changed, 36 insertions(+), 41 deletions(-)

diff --git a/documentation/README b/documentation/README
index 176c6db35b..fddf4e706d 100644
--- a/documentation/README
+++ b/documentation/README
@@ -167,7 +167,7 @@ The layout of the Yocto Project manuals is organized as follows
           Section
             Section
 
-The following headings styles are defined in Sphinx:
+Here are the heading styles defined in Sphinx:
 
     Book              => overline ===
       Chapter         => overline ***
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 4200b8dd61..5c3fc41772 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2513,7 +2513,7 @@ chapter of the BitBake User Manual.
    syntax, although access to OpenEmbedded variables and internal
    methods are also available.
 
-   The following is an example function from the ``sed`` recipe::
+   Here is an example function from the ``sed`` recipe::
 
       do_install () {
           autotools_do_install
@@ -7413,7 +7413,7 @@ The variable can contain multiple [one-line] metadata fields separated
 by the literal sequence '\\n'. The separator can be redefined using the
 variable flag ``separator``.
 
-The following is an example that adds two custom fields for ipk
+Here is an example that adds two custom fields for ipk
 packages::
 
    PACKAGE_ADD_METADATA_IPK = "Vendor: CustomIpk\nGroup:Applications/Spreadsheets"
@@ -7844,7 +7844,7 @@ Build history information is kept in
 ``${``\ :term:`TOPDIR`\ ``}/buildhistory``
 in the Build Directory as defined by the
 :term:`BUILDHISTORY_DIR`
-variable. The following is an example abbreviated listing:
+variable. Here is an example abbreviated listing:
 
 .. image:: figures/buildhistory.png
    :align: center
@@ -11058,7 +11058,7 @@ this function, you have to follow the following steps:
 3. Meta-spdxscanner provides several methods within the bbclass to create spdx files.
    Please choose one that you want to use and enable the spdx task. You have to
    add some config options in ``local.conf`` file in your :term:`Build
-   Directory`. The following is an example showing how to generate spdx files
+   Directory`. Here is an example showing how to generate spdx files
    during bitbake using the fossology-python.bbclass::
 
       # Select fossology-python.bbclass.
@@ -11088,7 +11088,7 @@ package, by using the
 variable. Using this variable also avoids QA errors when you use a
 non-common, non-CLOSED license in a recipe.
 
-The following is an example that uses the ``LICENSE.Abilis.txt`` file as
+Here is an example that uses the ``LICENSE.Abilis.txt`` file as
 the license from the fetched source::
 
    NO_GENERIC_LICENSE[Firmware-Abilis] = "LICENSE.Abilis.txt"
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 2b6d3d76c7..f7366938dd 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -219,15 +219,15 @@ using an NFS server.
    Should you need to start, stop, or restart the NFS share, you can use
    the following commands:
 
-   -  The following command starts the NFS share::
+   -  To start the NFS share::
 
          runqemu-export-rootfs start file-system-location
 
-   -  The following command stops the NFS share::
+   -  To stop the NFS share::
 
          runqemu-export-rootfs stop file-system-location
 
-   -  The following command restarts the NFS share::
+   -  To restart the NFS share::
 
          runqemu-export-rootfs restart file-system-location
 
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index cea3ce7405..0fede0c012 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -338,7 +338,7 @@ section:
    the ``yocto-4.12`` branch.
 
    The following commands show how to create a local copy of the
-   ``yocto-kernel-cache`` and be in the ``yocto-4.12`` branch::
+   ``yocto-kernel-cache`` and switch to the ``yocto-4.12`` branch::
 
       $ cd ~
       $ git clone git://git.yoctoproject.org/yocto-kernel-cache --branch yocto-4.12
@@ -491,7 +491,7 @@ As an example, consider the following append file used by the BSPs in
 
    meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.12.bbappend
 
-The following listing shows the file. Be aware that the actual commit ID
+Here are the contents of this file. Be aware that the actual commit ID
 strings in this example listing might be different than the actual
 strings in the file from the ``meta-yocto-bsp`` layer upstream.
 ::
diff --git a/documentation/kernel-dev/concepts-appx.rst b/documentation/kernel-dev/concepts-appx.rst
index 63e67315fa..2101f374cb 100644
--- a/documentation/kernel-dev/concepts-appx.rst
+++ b/documentation/kernel-dev/concepts-appx.rst
@@ -379,8 +379,7 @@ or non-hardware. To better show this, consider a situation where the
    yocto-kernel-cache/ktypes/base/hardware.kcf
    yocto-kernel-cache/bsp/qemu-ppc32/hardware.kcf
 
-The following list
-provides explanations for the various files:
+Here are explanations for the various files:
 
 -  ``hardware.kcf``: Specifies a list of kernel Kconfig files that
    contain hardware options only.
diff --git a/documentation/kernel-dev/faq.rst b/documentation/kernel-dev/faq.rst
index 8169511445..cffd1c4330 100644
--- a/documentation/kernel-dev/faq.rst
+++ b/documentation/kernel-dev/faq.rst
@@ -7,7 +7,7 @@ Kernel Development FAQ
 Common Questions and Solutions
 ==============================
 
-The following lists some solutions for common questions.
+Here are some solutions for common questions.
 
 How do I use my own Linux kernel ``.config`` file?
 --------------------------------------------------
diff --git a/documentation/overview-manual/intro.rst b/documentation/overview-manual/intro.rst
index a2afe77564..a8091771f4 100644
--- a/documentation/overview-manual/intro.rst
+++ b/documentation/overview-manual/intro.rst
@@ -12,7 +12,7 @@ introduces the Yocto Project by providing concepts, software overviews,
 best-known-methods (BKMs), and any other high-level introductory
 information suitable for a new Yocto Project user.
 
-The following list describes what you can get from this manual:
+Here is what you can get from this manual:
 
 -  :ref:`overview-manual/yp-intro:introducing the yocto project`\ *:*
    This chapter provides an introduction to the Yocto Project. You will learn
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index fca02e4cec..7a01828c5f 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -38,8 +38,7 @@ to the Yocto Project.
 Features
 --------
 
-The following list describes features and advantages of the Yocto
-Project:
+Here are features and advantages of the Yocto Project:
 
 -  *Widely Adopted Across the Industry:* Many semiconductor, operating
    system, software, and service vendors adopt and support the Yocto
@@ -137,8 +136,7 @@ Project:
 Challenges
 ----------
 
-The following list presents challenges you might encounter when
-developing using the Yocto Project:
+Here are challenges you might encounter when developing using the Yocto Project:
 
 -  *Steep Learning Curve:* The Yocto Project has a steep learning curve
    and has many different ways to accomplish similar tasks. It can be
@@ -292,8 +290,8 @@ associated with the Yocto Project.
 Development Tools
 -----------------
 
-The following list consists of tools that help you develop images and
-applications using the Yocto Project:
+Here are tools that help you develop images and applications using
+the Yocto Project:
 
 -  *CROPS:* `CROPS <https://github.com/crops/poky-container/>`__ is an
    open source, cross-platform development framework that leverages
@@ -347,8 +345,8 @@ applications using the Yocto Project:
 Production Tools
 ----------------
 
-The following list consists of tools that help production related
-activities using the Yocto Project:
+Here are tools that help with production related activities using the
+Yocto Project:
 
 -  *Auto Upgrade Helper:* This utility when used in conjunction with the
    :term:`OpenEmbedded Build System`
@@ -444,8 +442,7 @@ activities using the Yocto Project:
 Open-Embedded Build System Components
 -------------------------------------
 
-The following list consists of components associated with the
-:term:`OpenEmbedded Build System`:
+Here are components associated with the :term:`OpenEmbedded Build System`:
 
 -  *BitBake:* BitBake is a core component of the Yocto Project and is
    used by the OpenEmbedded build system to build images. While BitBake
@@ -511,8 +508,7 @@ section.
 Packages for Finished Targets
 -----------------------------
 
-The following lists components associated with packages for finished
-targets:
+Here are components associated with packages for finished targets:
 
 -  *Matchbox:* Matchbox is an Open Source, base environment for the X
    Window System running on non-desktop, embedded platforms such as
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index a6347449f1..ffa17139fe 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1009,7 +1009,7 @@ Please keep in mind that the QA checks
 exist in order to detect real or potential problems in the packaged
 output. So exercise caution when disabling these checks.
 
-The following list shows the tests you can list with the ``WARN_QA`` and
+Here are the tests you can list with the ``WARN_QA`` and
 ``ERROR_QA`` variables:
 
 -  ``already-stripped:`` Checks that produced binaries have not
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index eb4947d594..31d24b8c28 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -196,7 +196,7 @@ you can add several different predefined packages such as development
 utilities or packages with debug information needed to investigate
 application problems or profile applications.
 
-The following image features are available for all images:
+Here are the image features available for all images:
 
 -  *allow-empty-password:* Allows Dropbear and OpenSSH to accept root
    logins and logins from accounts having an empty password string.
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 4fa4d3ef52..fc251945db 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -111,7 +111,7 @@ function.
 Ubuntu and Debian
 -----------------
 
-The following list shows the required packages by function given a
+Here are the required packages by function given a
 supported Ubuntu or Debian Linux distribution:
 
 .. note::
@@ -150,7 +150,7 @@ supported Ubuntu or Debian Linux distribution:
 Fedora Packages
 ---------------
 
-The following list shows the required packages by function given a
+Here are the required packages by function given a
 supported Fedora Linux distribution:
 
 -  *Essentials:* Packages needed to build an image for a headless
@@ -167,7 +167,7 @@ supported Fedora Linux distribution:
 openSUSE Packages
 -----------------
 
-The following list shows the required packages by function given a
+Here are the required packages by function given a
 supported openSUSE Linux distribution:
 
 -  *Essentials:* Packages needed to build an image for a headless
@@ -185,7 +185,7 @@ supported openSUSE Linux distribution:
 CentOS-7 Packages
 -----------------
 
-The following list shows the required packages by function given a
+Here are the required packages by function given a
 supported CentOS-7 Linux distribution:
 
 -  *Essentials:* Packages needed to build an image for a headless
@@ -212,7 +212,7 @@ supported CentOS-7 Linux distribution:
 CentOS-8 Packages
 -----------------
 
-The following list shows the required packages by function given a
+Here are the required packages by function given a
 supported CentOS-8 Linux distribution:
 
 -  *Essentials:* Packages needed to build an image for a headless
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 957362bb6d..0b61f77cb4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4754,7 +4754,7 @@ system and gives an overview of their function and contents.
 
          NO_GENERIC_LICENSE[license_name] = "license_file_in_fetched_source"
 
-      The following is an example that
+      Here is an example that
       uses the ``LICENSE.Abilis.txt`` file as the license from the fetched
       source::
 
diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index 5d52c449cd..988a262188 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -186,7 +186,7 @@ Configuring the Workflow
 ------------------------
 
 The ``bldcontrol/management/commands/checksettings.py`` file controls
-workflow configuration. The following steps outline the process to
+workflow configuration. Here is the process to
 initially populate this database.
 
 1. The default project settings are set from
@@ -237,7 +237,7 @@ The following example sets "name" to "CUSTOM_XML_ONLY" and its value to
 Understanding Fixture File Format
 ---------------------------------
 
-The following is an overview of the file format used by the
+Here is an overview of the file format used by the
 ``oe-core.xml``, ``poky.xml``, and ``custom.xml`` files.
 
 The following subsections describe each of the sections in the fixture
@@ -407,7 +407,7 @@ To get the status of pending builds, use the following call::
 Be sure to provide values for host and port. The output is a JSON file that
 itemizes all builds in progress. This file includes the time in seconds since
 each respective build started as well as the progress of the cloning, parsing,
-and task execution. The following is sample output for a build in progress:
+and task execution. Here is sample output for a build in progress:
 
 .. code-block:: JSON
 
@@ -440,8 +440,8 @@ call::
    http://host:port/toastergui/api/builds
 
 Be sure to provide values for host and port. The output is a JSON file that
-itemizes all complete builds, and includes build summary information. The
-following is sample output for a completed build:
+itemizes all complete builds, and includes build summary information. Here
+is sample output for a completed build:
 
 .. code-block:: JSON
 
@@ -479,7 +479,7 @@ Completed query. See the ":ref:`toaster-manual/reference:checking status of buil
 section for more information.
 
 The output is a JSON file that itemizes the specific build and includes
-build summary information. The following is sample output for a specific
+build summary information. Here is sample output for a specific
 build:
 
 .. code-block:: JSON
-- 
2.25.1

