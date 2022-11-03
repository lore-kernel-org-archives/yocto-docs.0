Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C726C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 15:09:23 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.20569.1667488152755424175
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Nov 2022 08:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SS4ia/YB;
 spf=temperror, err=temporary DNS error (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A490C24000E;
	Thu,  3 Nov 2022 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667488150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b/vwXUiW63NtABPblF5UGwYxEWWqWFTtm17Os1l2a/g=;
	b=SS4ia/YBcUEh1KRQT+nj4d9M1mT7rd+Zdl/kzUgHNID+fZHw9BOvIEVgps0L7rQhWGllZT
	8PvabPF/GppRrx7o86+732T5IcNFHxZBBQtboe4HP4mKRTiV6Hw75tJYMB3rl0NX2p894J
	DdAVF6HscZyB1GBSNsrEd3mmtzujl+UKQqOzHSQA1WT6SzMPhdtgDzWuxPkKliJc5LodUi
	tqnjlcGvD5TwA5e2pRQg1vIFWxcFlys6FwXCPh9+Kf4eLxHp/5fBRYGJOk3tWREwanG7nS
	UdZ9eLxo5iHCqHuw7RuItJKc6+yGznSi6l2eZXZ3I746Rl/ZQtyiL9JbhbtetA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: add shortcut for Wikipedia links
Date: Thu,  3 Nov 2022 16:09:08 +0100
Message-Id: <20221103150908.24588-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Nov 2022 15:09:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3456

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst               |  2 +-
 documentation/conf.py                         |  1 +
 documentation/dev-manual/common-tasks.rst     | 26 ++++++++-----------
 documentation/dev-manual/start.rst            |  2 +-
 documentation/kernel-dev/common.rst           |  2 +-
 .../migration-guides/migration-3.0.rst        |  2 +-
 .../migration-guides/migration-4.0.rst        |  4 +--
 .../migration-guides/release-notes-4.0.rst    |  4 +--
 documentation/overview-manual/concepts.rst    |  4 +--
 .../development-environment.rst               | 15 +++++------
 documentation/ref-manual/classes.rst          |  6 ++---
 documentation/ref-manual/features.rst         | 22 +++++++---------
 documentation/ref-manual/kickstart.rst        |  2 +-
 documentation/ref-manual/terms.rst            |  4 +--
 documentation/ref-manual/variables.rst        |  6 ++---
 .../sdk-manual/appendix-customizing.rst       | 10 +++----
 documentation/sdk-manual/working-projects.rst |  6 ++---
 documentation/test-manual/intro.rst           |  3 +--
 documentation/toaster-manual/reference.rst    |  7 +++--
 19 files changed, 58 insertions(+), 70 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index efdaf80f63..117056ebd1 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1356,7 +1356,7 @@ Project Reference Manual.
 -  :term:`EXTRA_IMAGECMD`:
    Specifies additional options for image creation commands. In this
    example, the "-lnp " option is used when creating the
-   `JFFS2 <https://en.wikipedia.org/wiki/JFFS2>`__ image.
+   :wikipedia:`JFFS2 <JFFS2>` image.
 
 -  :term:`WKS_FILE`: The location of
    the :ref:`Wic kickstart <ref-manual/kickstart:openembedded kickstart (\`\`.wks\`\`) reference>` file used
diff --git a/documentation/conf.py b/documentation/conf.py
index 07a15ce7de..bd45a73fa6 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -106,6 +106,7 @@ extlinks = {
     'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
     'oe_layerindex': ('https://layers.openembedded.org%s', None),
     'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer%s', None),
+    'wikipedia': ('https://en.wikipedia.org/wiki/%s', None),
 }
 
 # Intersphinx config to use cross reference with BitBake user manual
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 21215d1203..b9c467526a 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -7157,8 +7157,7 @@ system. This section provides information for RPM, IPK, and DEB.
 Using RPM
 ^^^^^^^^^
 
-The `Dandified Packaging
-Tool <https://en.wikipedia.org/wiki/DNF_(software)>`__ (DNF) performs
+The :wikipedia:`Dandified Packaging <DNF_(software)>` (DNF) performs
 runtime package management of RPM packages. In order to use DNF for
 runtime package management, you must perform an initial setup on the
 target machine for cases where the ``PACKAGE_FEED_*`` variables were not
@@ -7501,7 +7500,7 @@ test. Here is what you have to do for each recipe:
 Creating Node Package Manager (NPM) Packages
 --------------------------------------------
 
-`NPM <https://en.wikipedia.org/wiki/Npm_(software)>`__ is a package
+:wikipedia:`NPM <Npm_(software)>` is a package
 manager for the JavaScript programming language. The Yocto Project
 supports the NPM :ref:`fetcher <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`. You can
 use this fetcher in combination with
@@ -9374,8 +9373,7 @@ This command writes the following files in the current directory:
 
 -  ``task-depends.dot``: A graph showing dependencies between tasks.
 
-The graphs are in
-`DOT <https://en.wikipedia.org/wiki/DOT_%28graph_description_language%29>`__
+The graphs are in :wikipedia:`DOT <DOT_%28graph_description_language%29>`
 format and can be converted to images (e.g. using the ``dot`` tool from
 `Graphviz <https://www.graphviz.org/>`__).
 
@@ -11435,7 +11433,7 @@ Vulnerabilities in Poky and OE-Core
 
 The Yocto Project has an infrastructure to track and address unfixed
 known security vulnerabilities, as tracked by the public
-`Common Vulnerabilities and Exposures (CVE) <https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures>`__
+:wikipedia:`Common Vulnerabilities and Exposures (CVE) <Common_Vulnerabilities_and_Exposures>`
 database.
 
 The Yocto Project maintains a `list of known vulnerabilities
@@ -11791,7 +11789,7 @@ Instructions on how to set it up are in the README document.
 Using Wayland and Weston
 ========================
 
-`Wayland <https://en.wikipedia.org/wiki/Wayland_(display_server_protocol)>`__
+:wikipedia:`Wayland <Wayland_(display_server_protocol)>`
 is a computer display server protocol that provides a method for
 compositing window managers to communicate directly with applications
 and video hardware and expects them to communicate with input hardware
@@ -11800,20 +11798,18 @@ in better control over graphics frame rendering than an application
 might otherwise achieve.
 
 The Yocto Project provides the Wayland protocol libraries and the
-reference
-`Weston <https://en.wikipedia.org/wiki/Wayland_(display_server_protocol)#Weston>`__
+reference :wikipedia:`Weston <Wayland_(display_server_protocol)#Weston>`
 compositor as part of its release. You can find the integrated packages
 in the ``meta`` layer of the :term:`Source Directory`.
 Specifically, you
 can find the recipes that build both Wayland and Weston at
 ``meta/recipes-graphics/wayland``.
 
-You can build both the Wayland and Weston packages for use only with
-targets that accept the `Mesa 3D and Direct Rendering
-Infrastructure <https://en.wikipedia.org/wiki/Mesa_(computer_graphics)>`__,
-which is also known as Mesa DRI. This implies that you cannot build and
-use the packages if your target uses, for example, the Intel Embedded
-Media and Graphics Driver (Intel EMGD) that overrides Mesa DRI.
+You can build both the Wayland and Weston packages for use only with targets
+that accept the :wikipedia:`Mesa 3D and Direct Rendering Infrastructure
+<Mesa_(computer_graphics)>`, which is also known as Mesa DRI. This implies that
+you cannot build and use the packages if your target uses, for example, the
+Intel Embedded Media and Graphics Driver (Intel EMGD) that overrides Mesa DRI.
 
 .. note::
 
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index f90375471f..63d63fc27e 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -273,7 +273,7 @@ For Linux (WSL 2).
 .. note::
 
    The Yocto Project is not compatible with version 1 of
-   `Windows Subsystem for Linux <https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux>`__.
+   :wikipedia:`Windows Subsystem for Linux <Windows_Subsystem_for_Linux>`.
    It is compatible but neither officially supported nor validated with
    WSL 2. If you still decide to use WSL please upgrade to
    `WSL 2 <https://learn.microsoft.com/en-us/windows/wsl/install>`__.
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 690f61110b..028b6af84c 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1043,7 +1043,7 @@ Using  ``menuconfig``
 The easiest way to define kernel configurations is to set them through
 the ``menuconfig`` tool. This tool provides an interactive method with
 which to set kernel configurations. For general information on
-``menuconfig``, see https://en.wikipedia.org/wiki/Menuconfig.
+``menuconfig``, see :wikipedia:`Menuconfig`.
 
 To use the ``menuconfig`` tool in the Yocto Project development
 environment, you must do the following:
diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index 96aea2f332..90736e6009 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -108,7 +108,7 @@ Packaging Changes
 
 The following packaging changes have occurred.
 
--  The `Epiphany <https://en.wikipedia.org/wiki/GNOME_Web>`__ browser
+-  The :wikipedia:`Epiphany <GNOME_Web>` browser
    has been dropped from ``packagegroup-self-hosted`` as it has not been
    needed inside ``build-appliance-image`` for quite some time and was
    causing resource problems.
diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index 02d3c3e2bd..17b1d3c619 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -183,8 +183,8 @@ a new :term:`KERNEL_DEBUG_TIMESTAMPS` variable to "1".
 Supported host distribution changes
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- Support for `AlmaLinux <https://en.wikipedia.org/wiki/AlmaLinux>`__
-  hosts replacing `CentOS <https://en.wikipedia.org/wiki/CentOS>`__.
+- Support for :wikipedia:`AlmaLinux <AlmaLinux>`
+  hosts replacing :wikipedia:`CentOS <CentOS>`.
   The following distribution versions were dropped: CentOS 8, Ubuntu 16.04 and Fedora 30, 31 and 32.
 
 - ``gcc`` version 7.5 is now required at minimum on the build host. For older
diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index a61ccc6913..02cde0e3f3 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -32,7 +32,7 @@ New Features / Enhancements in 4.0
   :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` classes and
   ``overlayroot`` support in the :term:`Initramfs` framework to make it easier to
   overlay read-only filesystems (for example) with
-  `OverlayFS <https://en.wikipedia.org/wiki/OverlayFS>`__.
+  :wikipedia:`OverlayFS <OverlayFS>`.
 
 - Inclusive language adjustments to some variable names - see the
   :ref:`4.0 migration guide <migration-4.0-inclusive-language>` for details.
@@ -104,7 +104,7 @@ New Features / Enhancements in 4.0
 
 - Shared state (sstate) improvements:
 
-   - Switched to `ZStandard (zstd) <https://en.wikipedia.org/wiki/Zstd>`__ instead
+   - Switched to :wikipedia:`ZStandard (zstd) <Zstd>` instead
      of Gzip, for better performance.
    - Allow validation of sstate signatures against a list of keys
    - Improved error messages and exception handling
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index b323a6fdf4..c495e4cc41 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -110,7 +110,7 @@ Class files (``.bbclass``) contain information that is useful to share
 between recipes files. An example is the
 :ref:`autotools <ref-classes-autotools>` class,
 which contains common settings for any application that is built with
-the `GNU Autotools <https://en.wikipedia.org/wiki/GNU_Autotools>`__.
+the :wikipedia:`GNU Autotools <GNU_Autotools>`.
 The ":ref:`ref-manual/classes:Classes`" chapter in the Yocto Project
 Reference Manual provides details about classes and how to use them.
 
@@ -2061,7 +2061,7 @@ dependencies, you must manually declare the dependencies.
    located. For each shared library, the package that contains the
    shared library is registered as providing the shared library. More
    specifically, the package is registered as providing the
-   `soname <https://en.wikipedia.org/wiki/Soname>`__ of the library. The
+   :wikipedia:`soname <Soname>` of the library. The
    resulting shared-library-to-package mapping is saved globally in
    :term:`PKGDATA_DIR` by the
    :ref:`ref-tasks-packagedata`
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 04aea1373c..7d5953db33 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -39,10 +39,9 @@ Linus Torvalds in 1991. Conversely, a good example of a non-open source
 project is the Windows family of operating systems developed by
 Microsoft Corporation.
 
-Wikipedia has a good historical description of the Open Source
-Philosophy `here <https://en.wikipedia.org/wiki/Open_source>`__. You can
-also find helpful information on how to participate in the Linux
-Community
+Wikipedia has a good :wikipedia:`historical description of the Open Source
+Philosophy <Open_source>`. You can also find helpful information on how
+to participate in the Linux Community
 `here <https://www.kernel.org/doc/html/latest/process/index.html>`__.
 
 The Development Host
@@ -608,18 +607,16 @@ licensing structures in place. License evolution for both Open Source
 and Free Software has an interesting history. If you are interested in
 this history, you can find basic information here:
 
--  `Open source license
-   history <https://en.wikipedia.org/wiki/Open-source_license>`__
+-  :wikipedia:`Open source license history <Open-source_license>`
 
--  `Free software license
-   history <https://en.wikipedia.org/wiki/Free_software_license>`__
+-  :wikipedia:`Free software license history <Free_software_license>`
 
 In general, the Yocto Project is broadly licensed under the
 Massachusetts Institute of Technology (MIT) License. MIT licensing
 permits the reuse of software within proprietary software as long as the
 license is distributed with that software. Patches to the Yocto Project
 follow the upstream licensing scheme. You can find information on the
-MIT license `here <https://en.wikipedia.org/wiki/MIT_License>`__.
+MIT license :wikipedia:`here <MIT_License>`.
 
 When you build an image using the Yocto Project, the build process uses
 a known list of licenses to ensure compliance. You can find this list in
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 0d3d2586b4..6bab15257e 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -85,7 +85,7 @@ about the variable flags (varflags) that help control archive creation.
 ======================
 
 The :ref:`autotools* <ref-classes-autotools>` classes support packages built with the
-`GNU Autotools <https://en.wikipedia.org/wiki/GNU_Autotools>`__.
+:wikipedia:`GNU Autotools <GNU_Autotools>`.
 
 The ``autoconf``, ``automake``, and ``libtool`` packages bring
 standardization. This class defines a set of tasks (e.g. ``configure``,
@@ -1775,8 +1775,8 @@ is not needed.
 ``npm.bbclass``
 ===============
 
-Provides support for building Node.js software fetched using the `node
-package manager (NPM) <https://en.wikipedia.org/wiki/Npm_(software)>`__.
+Provides support for building Node.js software fetched using the
+:wikipedia:`node package manager (NPM) <Npm_(software)>`.
 
 .. note::
 
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index a5b01e8df7..71d3c5e2aa 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -126,10 +126,9 @@ metadata, as extra layers can define their own:
 
 -  *3g:* Include support for cellular data.
 
--  *acl:* Include
-   `Access Control List <https://en.wikipedia.org/wiki/Access-control_list>`__ support.
+-  *acl:* Include :wikipedia:`Access Control List <Access-control_list>` support.
 
--  *alsa:* Include `Advanced Linux Sound Architecture <https://en.wikipedia.org/wiki/Advanced_Linux_Sound_Architecture>`__
+-  *alsa:* Include :wikipedia:`Advanced Linux Sound Architecture <Advanced_Linux_Sound_Architecture>`
    support (OSS compatibility kernel modules installed if available).
 
 -  *api-documentation:* Enables generation of API documentation during
@@ -167,7 +166,7 @@ metadata, as extra layers can define their own:
 -  *multiarch:* Enable building applications with multiple architecture
    support.
 
--  *ld-is-gold:* Use the `gold <https://en.wikipedia.org/wiki/Gold_(linker)>`__
+-  *ld-is-gold:* Use the :wikipedia:`gold <Gold_(linker)>`
    linker instead of the standard GCC linker (bfd).
 
 -  *ldconfig:* Include support for ldconfig and ``ld.so.conf`` on the
@@ -190,14 +189,14 @@ metadata, as extra layers can define their own:
 -  *overlayfs:* Include `OverlayFS <https://docs.kernel.org/filesystems/overlayfs.html>`__
    support.
 
--  *pam:* Include `Pluggable Authentication Module (PAM) <https://en.wikipedia.org/wiki/Pluggable_authentication_module>`__
+-  *pam:* Include :wikipedia:`Pluggable Authentication Module (PAM) <Pluggable_authentication_module>`
    support.
 
 -  *pci:* Include PCI bus support.
 
 -  *pcmcia:* Include PCMCIA/CompactFlash support.
 
--  *polkit:* Include `Polkit <https://en.wikipedia.org/wiki/Polkit>`__ support.
+-  *polkit:* Include :wikipedia:`Polkit <Polkit>` support.
 
 -  *ppp:* Include PPP dialup support.
 
@@ -210,11 +209,11 @@ metadata, as extra layers can define their own:
    `PulseAudio <https://www.freedesktop.org/wiki/Software/PulseAudio/>`__.
 
 -  *selinux:* Include support for
-   `Security-Enhanced Linux (SELinux) <https://en.wikipedia.org/wiki/Security-Enhanced_Linux>`__
+   :wikipedia:`Security-Enhanced Linux (SELinux) <Security-Enhanced_Linux>`
    (requires `meta-selinux <https://layers.openembedded.org/layerindex/layer/meta-selinux/>`__).
 
 -  *seccomp:* Enables building applications with
-   `seccomp <https://en.wikipedia.org/wiki/Seccomp>`__ support, to
+   :wikipedia:`seccomp <Seccomp>` support, to
    allow them to strictly restrict the system calls that they are allowed
    to invoke.
 
@@ -236,11 +235,10 @@ metadata, as extra layers can define their own:
    directories into their respective counterparts in the ``/usr``
    directory to provide better package and application compatibility.
 
--  *vfat:* Include `FAT filesystem <https://en.wikipedia.org/wiki/File_Allocation_Table>`__
+-  *vfat:* Include :wikipedia:`FAT filesystem <File_Allocation_Table>`
    support.
 
--  *vulkan:* Include support for the
-   `Vulkan API <https://en.wikipedia.org/wiki/Vulkan>`__.
+-  *vulkan:* Include support for the :wikipedia:`Vulkan API <Vulkan>`.
 
 -  *wayland:* Include the Wayland display server protocol and the
    library that supports it.
@@ -250,7 +248,7 @@ metadata, as extra layers can define their own:
 -  *x11:* Include the X server and libraries.
 
 -  *xattr:* Include support for
-   `extended file attributes <https://en.wikipedia.org/wiki/Extended_file_attributes>`__.
+   :wikipedia:`extended file attributes <Extended_file_attributes>`.
 
 -  *zeroconf:* Include support for
    `zero configuration networking <https://en.wikipedia.org/wiki/Zero-configuration_networking>`__.
diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index 48bba58995..11bc373b3c 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -177,7 +177,7 @@ the ``part`` and ``partition`` commands:
 -  ``--part-type``: This option is a Wic-specific option that
    specifies the partition type globally unique identifier (GUID) for
    GPT partitions. You can find the list of partition type GUIDs at
-   https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs.
+   :wikipedia:`GUID_Partition_Table#Partition_type_GUIDs`.
 
 -  ``--use-uuid``: This option is a Wic-specific option that causes
    Wic to generate a random GUID for the partition. The generated
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index b4a78efad3..51f6e79200 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -330,7 +330,7 @@ universal, the list includes them just in case:
       This can be used by the recipients of the software to assess
       their exposure to license compliance and security vulnerability issues.
 
-      See the `Software Supply Chain <https://en.wikipedia.org/wiki/Software_supply_chain>`__
+      See the :wikipedia:`Software Supply Chain <Software_supply_chain>`
       article on Wikipedia for more details.
 
       The OpenEmbedded Build System can generate such documentation for your
@@ -405,7 +405,7 @@ universal, the list includes them just in case:
       <https://spdx.dev/>`__ and is used by the OpenEmbedded Build System to
       provide an :term:`SBOM` associated to each a software image.
 
-      For details, see Wikipedia's `SPDX page <https://en.wikipedia.org/wiki/Software_Package_Data_Exchange>`__
+      For details, see Wikipedia's :wikipedia:`SPDX page <Software_Package_Data_Exchange>`
       and the ":ref:`dev-manual/common-tasks:creating a software bill of materials`"
       section of the Development Tasks manual.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 440e1a0833..9909622d7a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3699,8 +3699,8 @@ system and gives an overview of their function and contents.
 
    :term:`Initramfs`
       An Initial RAM Filesystem (:term:`Initramfs`) is an optionally compressed
-      `cpio <https://en.wikipedia.org/wiki/Cpio>`__ archive which is extracted
-      by the Linux kernel into RAM in a special `tmpfs <https://en.wikipedia.org/wiki/Tmpfs>`__
+      :wikipedia:`cpio <Cpio>` archive which is extracted
+      by the Linux kernel into RAM in a special :wikipedia:`tmpfs <Tmpfs>`
       instance, used as the initial root filesystem.
 
       This is a replacement for the legacy init RAM disk ("initrd")
@@ -3756,7 +3756,7 @@ system and gives an overview of their function and contents.
       ``meta/conf/bitbake.conf`` configuration file in the
       :term:`Source Directory`, is "cpio.gz". The Linux kernel's
       :term:`Initramfs` mechanism, as opposed to the initial RAM filesystem
-      `initrd <https://en.wikipedia.org/wiki/Initrd>`__ mechanism, expects
+      :wikipedia:`initrd <Initrd>` mechanism, expects
       an optionally compressed cpio archive.
 
    :term:`INITRAMFS_IMAGE`
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index d6bca44947..66218fccd6 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -176,9 +176,8 @@ the installed SDKs to update the installed SDKs by using the
 ``devtool sdk-update`` command:
 
 1. Create a directory that can be shared over HTTP or HTTPS. You can do
-   this by setting up a web server such as an `Apache HTTP
-   Server <https://en.wikipedia.org/wiki/Apache_HTTP_Server>`__ or
-   `Nginx <https://en.wikipedia.org/wiki/Nginx>`__ server in the cloud
+   this by setting up a web server such as an :wikipedia:`Apache HTTP Server
+   <Apache_HTTP_Server>` or :wikipedia:`Nginx <Nginx>` server in the cloud
    to host the directory. This directory must contain the published SDK.
 
 2. Set the
@@ -262,9 +261,8 @@ source, you need to do a number of things:
 
 2. Expose the ``sstate-cache`` directory produced by the build.
    Typically, you expose this directory by making it available through
-   an `Apache HTTP
-   Server <https://en.wikipedia.org/wiki/Apache_HTTP_Server>`__ or
-   `Nginx <https://en.wikipedia.org/wiki/Nginx>`__ server.
+   an :wikipedia:`Apache HTTP Server <Apache_HTTP_Server>` or
+   :wikipedia:`Nginx <Nginx>` server.
 
 3. Set the appropriate configuration so that the produced SDK knows how
    to find the configuration. The variable you need to set is
diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index 91d8d6ad93..0eddee08e3 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -11,9 +11,9 @@ Autotools-Based Projects
 ========================
 
 Once you have a suitable :ref:`sdk-manual/intro:the cross-development toolchain`
-installed, it is very easy to develop a project using the `GNU
-Autotools-based <https://en.wikipedia.org/wiki/GNU_Build_System>`__
-workflow, which is outside of the :term:`OpenEmbedded Build System`.
+installed, it is very easy to develop a project using the :wikipedia:`GNU
+Autotools-based <GNU_Build_System>` workflow, which is outside of the
+:term:`OpenEmbedded Build System`.
 
 The following figure presents a simple Autotools workflow.
 
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 36958d00ad..0831f80466 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -74,8 +74,7 @@ simple JSON files.
    The project uses Buildbot for historical reasons but also because
    many of the project developers have knowledge of Python. It is
    possible to use the outer layers from another Continuous Integration
-   (CI) system such as
-   `Jenkins <https://en.wikipedia.org/wiki/Jenkins_(software)>`__
+   (CI) system such as :wikipedia:`Jenkins <Jenkins_(software)>`
    instead of Buildbot.
 
 The following figure shows the Yocto Project Autobuilder stack with a
diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index b181d12d86..f8aabeed04 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -28,8 +28,7 @@ at :oe_layerindex:`/`. You can find the code for this
 layer index's web application at :yocto_git:`/layerindex-web/`.
 
 When you tie a layer source into Toaster, it can query the layer source
-through a
-`REST <https://en.wikipedia.org/wiki/Representational_state_transfer>`__
+through a :wikipedia:`REST <Representational_state_transfer>`
 API, store the information about the layers in the Toaster database, and
 then show the information to users. Users are then able to view that
 information and build layers from Toaster itself without having to
@@ -369,8 +368,8 @@ Remote Toaster Monitoring
 Toaster has an API that allows remote management applications to
 directly query the state of the Toaster server and its builds in a
 machine-to-machine manner. This API uses the
-`REST <https://en.wikipedia.org/wiki/Representational_state_transfer>`__
-interface and the transfer of JSON files. For example, you might monitor
+:wikipedia:`REST <Representational_state_transfer>` interface and the
+transfer of JSON files. For example, you might monitor
 a build inside a container through well supported known HTTP ports in
 order to easily access a Toaster server inside the container. In this
 example, when you use this direct JSON API, you avoid having web page
-- 
2.34.1


