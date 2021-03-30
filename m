Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.231.1617117557587653400
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 08:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from localhost (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id CA0A560011;
	Tue, 30 Mar 2021 15:19:15 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/1] YP overview manual: style improvements
Date: Tue, 30 Mar 2021 17:19:05 +0200
Message-Id: <20210330151905.13402-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330151905.13402-1-michael.opdenacker@bootlin.com>
References: <20210330151905.13402-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- A few style improvements
- Fix a few typos
- Fix one of these typos happening in ref-manual/migration-2.1.rst
  too

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/yp-intro.rst | 54 +++++++++++-----------
 documentation/ref-manual/migration-2.1.rst |  2 +-
 2 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 176e5b24c..b146db5e4 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -41,9 +41,9 @@ Features
 The following list describes features and advantages of the Yocto
 Project:
 
--  *Widely Adopted Across the Industry:* Semiconductor, operating
-   system, software, and service vendors exist whose products and
-   services adopt and support the Yocto Project. For a look at the Yocto
+-  *Widely Adopted Across the Industry:* Many semiconductor, operating
+   system, software, and service vendors adopt and support the Yocto
+   Project in their products and services. For a look at the Yocto
    Project community and the companies involved with the Yocto Project,
    see the "COMMUNITY" and "ECOSYSTEM" tabs on the
    :yocto_home:`Yocto Project <>` home page.
@@ -53,8 +53,8 @@ Project:
    create and supply BSPs that support their hardware. If you have
    custom silicon, you can create a BSP that supports that architecture.
 
-   Aside from lots of architecture support, the Yocto Project fully
-   supports a wide range of device emulation through the Quick EMUlator
+   Aside from broad architecture support, the Yocto Project fully
+   supports a wide range of devices emulated by the Quick EMUlator
    (QEMU).
 
 -  *Images and Code Transfer Easily:* Yocto Project output can easily
@@ -78,10 +78,10 @@ Project:
    you need for embedded devices. You only add the feature support or
    packages that you absolutely need for the device. For devices that
    have display hardware, you can use available system components such
-   as X11, GTK+, Qt, Clutter, and SDL (among others) to create a rich
-   user experience. For devices that do not have a display or where you
-   want to use alternative UI frameworks, you can choose to not install
-   these components.
+   as X11, Wayland, GTK+, Qt, Clutter, and SDL (among others) to create
+   a rich user experience. For devices that do not have a display or
+   where you want to use alternative UI frameworks, you can choose to
+   not build these components.
 
 -  *Comprehensive Toolchain Capabilities:* Toolchains for supported
    architectures satisfy most use cases. However, if your hardware
@@ -431,11 +431,14 @@ activities using the Yocto Project:
 
    During a build, it can be necessary to perform operations that
    require system administrator privileges. For example, file ownership
-   or permissions might need definition. Pseudo is a tool that you can
-   either use directly or through the environment variable
+   or permissions might need to be defined. Pseudo is a tool that you
+   can either use directly or through the environment variable
    ``LD_PRELOAD``. Either method allows these operations to succeed as
    if system administrator privileges exist even when they do not.
 
+   Thanks to Pseudo, the Yocto Project never needs root privileges to
+   build images for your target system.
+
    You can read more about Pseudo in the "`Fakeroot and
    Pseudo <#fakeroot-and-pseudo>`__" section.
 
@@ -574,11 +577,11 @@ Development Methods
 The Yocto Project development environment usually involves a
 :term:`Build Host` and target
 hardware. You use the Build Host to build images and develop
-applications, while you use the target hardware to test deployed
+applications, while you use the target hardware to execute deployed
 software.
 
 This section provides an introduction to the choices or development
-methods you have when setting up your Build Host. Depending on the your
+methods you have when setting up your Build Host. Depending on your
 particular workflow preference and the type of operating system your
 Build Host runs, several choices exist that allow you to use the Yocto
 Project.
@@ -593,7 +596,7 @@ Project.
    system running Linux as its native operating system allows you to
    develop software by directly using the
    :term:`BitBake` tool. You can
-   accomplish all aspects of development from a familiar shell of a
+   accomplish all aspects of development from a regular shell in a
    supported Linux distribution.
 
    For information on how to set up a Build Host on a system running
@@ -622,7 +625,7 @@ Project.
    section in the Yocto Project Development Tasks Manual.
 
 -  *Windows Subsystem For Linux (WSLv2):* You may use Windows Subsystem
-   For Linux v2 to set up a build host using Windows 10.
+   For Linux v2 to set up a Build Host using Windows 10.
 
    .. note::
 
@@ -631,8 +634,7 @@ Project.
       still decide to use WSL please upgrade to WSLv2.
 
    The Windows Subsystem For Linux allows Windows 10 to run a real Linux
-   kernel inside of a lightweight utility virtual machine (VM) using
-   virtualization technology.
+   kernel inside of a lightweight virtual machine (VM).
 
    For information on how to set up a Build Host with WSLv2, see the
    ":ref:`dev-manual/start:setting up to use windows subsystem for linux (wslv2)`"
@@ -641,10 +643,9 @@ Project.
 -  *Toaster:* Regardless of what your Build Host is running, you can use
    Toaster to develop software using the Yocto Project. Toaster is a web
    interface to the Yocto Project's :term:`OpenEmbedded Build System`.
-   The interface
-   enables you to configure and run your builds. Information about
-   builds is collected and stored in a database. You can use Toaster to
-   configure and start builds on multiple remote build servers.
+   The interface allows you to configure and run your builds. Information
+   about builds is collected and stored in a database. You can use Toaster
+   to configure and start builds on multiple remote build servers.
 
    For information about and how to use Toaster, see the
    :doc:`/toaster-manual/index`.
@@ -816,9 +817,9 @@ helpful for getting started:
    isolate information used when building for multiple architectures.
    Layers are hierarchical in their ability to override previous
    specifications. You can include any number of available layers from
-   the Yocto Project and customize the build by adding your layers after
-   them. You can search the Layer Index for layers used within Yocto
-   Project.
+   the Yocto Project and customize the build by adding your own layers
+   after them. You can search the Layer Index for layers used within
+   Yocto Project.
 
    For more detailed information on layers, see the
    ":ref:`dev-manual/common-tasks:understanding and creating layers`"
@@ -851,7 +852,7 @@ helpful for getting started:
    BitBake is similar to the ``make`` tool.
 
    During a build process, the build system tracks dependencies and
-   performs a native or cross-compilation of the package. As a first
+   performs a native or cross-compilation of each package. As a first
    step in a cross-build setup, the framework attempts to create a
    cross-compiler toolchain (i.e. Extensible SDK) suited for the target
    platform.
@@ -878,7 +879,8 @@ helpful for getting started:
    subtle meanings. For example, the packages referred to in the
    ":ref:`ref-manual/system-requirements:required packages for the build host`"
    section in the Yocto Project Reference Manual are compiled binaries
-   that, when installed, add functionality to your Linux distribution.
+   that, when installed, add functionality to your host Linux
+   distribution.
 
    Another point worth noting is that historically within the Yocto
    Project, recipes were referred to as packages - thus, the existence
diff --git a/documentation/ref-manual/migration-2.1.rst b/documentation/ref-manual/migration-2.1.rst
index 861d04861..4a5acc45c 100644
--- a/documentation/ref-manual/migration-2.1.rst
+++ b/documentation/ref-manual/migration-2.1.rst
@@ -134,7 +134,7 @@ or that mention ``do_rootfs``, you might need to update those changes.
 In particular, if you had added any tasks after ``do_rootfs``, you
 should make edits so that those tasks are after the
 :ref:`ref-tasks-image-complete` task rather than
-after ``do_rootfs`` so that the your added tasks run at the correct
+after ``do_rootfs`` so that your added tasks run at the correct
 time.
 
 A minor part of this restructuring is that the post-processing
-- 
2.25.1

