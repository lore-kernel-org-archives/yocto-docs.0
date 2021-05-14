Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.6101.1620981352949070321
 for <docs@lists.yoctoproject.org>;
 Fri, 14 May 2021 01:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: from localhost (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 83916240009;
	Fri, 14 May 2021 08:35:51 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 6/6] manuals: simplify style
Date: Fri, 14 May 2021 10:35:27 +0200
Message-Id: <20210514083527.281767-7-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514083527.281767-1-michael.opdenacker@bootlin.com>
References: <20210514083527.281767-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/README                         |  2 +-
 documentation/brief-yoctoprojectqs/index.rst | 10 +++---
 documentation/bsp-guide/bsp.rst              | 36 +++++++++-----------
 documentation/toaster-manual/reference.rst   |  6 ++--
 4 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/documentation/README b/documentation/README
index fddf4e706d..3ad23a902d 100644
--- a/documentation/README
+++ b/documentation/README
@@ -32,7 +32,7 @@ these instances.
 Manual Organization
 ===================
 
-Folders exist for individual manuals as follows:
+Here the folders corresponding to individual manuals:
 
 * sdk-manual           - The Yocto Project Software Development Kit (SDK) Developer's Guide.
 * bsp-guide            - The Yocto Project Board Support Package (BSP) Developer's Guide
diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 6a12b19ca0..7ae4526c42 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -297,7 +297,7 @@ modular development and makes it easier to reuse the layer metadata.
 
 Follow these steps to add a hardware layer:
 
-#. **Find a Layer:** Lots of hardware layers exist. The Yocto Project
+#. **Find a Layer:** Many hardware layers are available. The Yocto Project
    :yocto_git:`Source Repositories <>` has many hardware layers.
    This example adds the
    `meta-altera <https://github.com/kraj/meta-altera>`__ hardware layer.
@@ -318,8 +318,8 @@ Follow these steps to add a hardware layer:
       Resolving deltas: 100% (13385/13385), done.
       Checking connectivity... done.
 
-   The hardware layer now exists
-   with other layers inside the Poky reference repository on your build
+   The hardware layer is now available
+   next to other layers inside the Poky reference repository on your build
    host as ``meta-altera`` and contains all the metadata needed to
    support hardware from Altera, which is owned by Intel.
 
@@ -431,8 +431,8 @@ information including the website, wiki pages, and user manuals:
    information.
 
 -  **Yocto Project Mailing Lists:** Related mailing lists provide a forum
-   for discussion, patch submission and announcements. Several mailing
-   lists exist and are grouped according to areas of concern. See the
+   for discussion, patch submission and announcements. There are several
+   mailing lists grouped by topic. See the
    :ref:`ref-manual/resources:mailing lists`
    section in the Yocto Project Reference Manual for a complete list of
    Yocto Project mailing lists.
diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 0b0b52d904..b46773dedd 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -267,7 +267,7 @@ maintain the distinction that the BSP layer, a build system, and tools
 are separate components that could be combined in certain end products.
 
 Before looking at the recommended form for the directory structure
-inside a BSP layer, you should be aware that some requirements do exist
+inside a BSP layer, you should be aware that there are some requirements
 in order for a BSP layer to be considered compliant with the Yocto
 Project. For that list of requirements, see the
 ":ref:`bsp-guide/bsp:released bsp requirements`" section.
@@ -763,8 +763,8 @@ workflow.
 
    .. note::
 
-      -  Four hardware reference BSPs exist that are part of the Yocto
-         Project release and are located in the ``poky/meta-yocto-bsp``
+      -  There are four hardware reference BSPs in the Yocto
+         Project release, located in the ``poky/meta-yocto-bsp``
          BSP layer:
 
          -  Texas Instruments Beaglebone (``beaglebone-yocto``)
@@ -773,8 +773,8 @@ workflow.
 
          -  Two general IA platforms (``genericx86`` and ``genericx86-64``)
 
-      -  Three core Intel BSPs exist as part of the Yocto Project
-         release in the ``meta-intel`` layer:
+      -  There are three core Intel BSPs in the Yocto Project
+         release, in the ``meta-intel`` layer:
 
          -  ``intel-core2-32``, which is a BSP optimized for the Core2
             family of CPUs as well as all CPUs prior to the Silvermont
@@ -832,10 +832,8 @@ workflow.
 Requirements and Recommendations for Released BSPs
 ==================================================
 
-Certain requirements exist for a released BSP to be considered compliant
-with the Yocto Project. Additionally, recommendations also exist. This
-section describes the requirements and recommendations for released
-BSPs.
+This section describes requirements and recommendations for a released
+BSP to be considered compliant with the Yocto Project.
 
 Released BSP Requirements
 -------------------------
@@ -864,7 +862,7 @@ Before looking at BSP requirements, you should consider the following:
 
 -  It is not required that specific packages or package modifications
    exist in the BSP layer, beyond the requirements for general
-   compliance with the Yocto Project. For example, no requirement exists
+   compliance with the Yocto Project. For example, there is no requirement
    dictating that a specific kernel or kernel version be used in a given
    BSP.
 
@@ -900,7 +898,7 @@ Yocto Project:
 -  *License File:* You must include a license file in the
    ``meta-bsp_root_name`` directory. This license covers the BSP
    Metadata as a whole. You must specify which license to use since no
-   default license exists when one is not specified. See the
+   default license exists. See the
    :yocto_git:`COPYING.MIT </meta-raspberrypi/tree/COPYING.MIT>`
    file for the Raspberry Pi BSP in the ``meta-raspberrypi`` BSP layer
    as an example.
@@ -1107,7 +1105,7 @@ system requirements.
    unsuitable functionality or quality, you can use an encumbered
    version.
 
-A couple different methods exist within the OpenEmbedded build system to
+There are two different methods within the OpenEmbedded build system to
 satisfy the licensing requirements for an encumbered BSP. The following
 list describes them in order of preference:
 
@@ -1186,11 +1184,11 @@ Use these steps to create a BSP layer:
 -  *Create a Machine Configuration File:* Create a
    ``conf/machine/bsp_root_name.conf`` file. See
    :yocto_git:`meta-yocto-bsp/conf/machine </poky/tree/meta-yocto-bsp/conf/machine>`
-   for sample ``bsp_root_name.conf`` files. Other samples such as
+   for sample ``bsp_root_name.conf`` files. There are other samples such as
    :yocto_git:`meta-ti </meta-ti/tree/conf/machine>`
    and
    :yocto_git:`meta-freescale </meta-freescale/tree/conf/machine>`
-   exist from other vendors that have more specific machine and tuning
+   from other vendors that have more specific machine and tuning
    examples.
 
 -  *Create a Kernel Recipe:* Create a kernel recipe in
@@ -1241,7 +1239,7 @@ As mentioned earlier in this section, the existence of a machine
 configuration file is what makes a layer a BSP layer as compared to a
 general or kernel layer.
 
-One or more machine configuration files exist in the
+There are one or more machine configuration files in the
 ``bsp_layer/conf/machine/`` directory of the layer::
 
    bsp_layer/conf/machine/machine1\.conf
@@ -1311,7 +1309,7 @@ Project Reference Manual.
 -  :term:`PREFERRED_PROVIDER_virtual/xserver <PREFERRED_PROVIDER>`:
    The recipe that provides "virtual/xserver" when more than one
    provider is found. In this case, the recipe that provides
-   "virtual/xserver" is "xserver-xorg", which exists in
+   "virtual/xserver" is "xserver-xorg", available in
    ``poky/meta/recipes-graphics/xorg-xserver``.
 
 -  :term:`XSERVER`: The packages that
@@ -1326,7 +1324,7 @@ Project Reference Manual.
 
    .. tip::
 
-      Many ``MACHINE*`` variables exist that help you configure a particular piece
+      There are many ``MACHINE*`` variables that help you configure a particular piece
       of hardware.
 
 -  :term:`EXTRA_IMAGEDEPENDS`:
@@ -1339,9 +1337,9 @@ Project Reference Manual.
 -  :term:`DEFAULTTUNE`: Machines
    use tunings to optimize machine, CPU, and application performance.
    These features, which are collectively known as "tuning features",
-   exist in the :term:`OpenEmbedded-Core (OE-Core)` layer (e.g.
+   are set in the :term:`OpenEmbedded-Core (OE-Core)` layer (e.g.
    ``poky/meta/conf/machine/include``). In this example, the default
-   tuning file is "cortexa8hf-neon".
+   tuning file is ``cortexa8hf-neon``.
 
    .. note::
 
diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index 988a262188..c0d02ff9ab 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -9,8 +9,8 @@ concepts and have some basic command reference material available. This
 final chapter provides conceptual information on layer sources,
 releases, and JSON configuration files. Also provided is a quick look at
 some useful ``manage.py`` commands that are Toaster-specific.
-Information on ``manage.py`` commands does exist across the Web and the
-information in this manual by no means attempts to provide a command
+Information on ``manage.py`` commands is available across the Web and
+this manual by no means attempts to provide a command
 comprehensive reference.
 
 Layer Source
@@ -508,7 +508,7 @@ Useful Commands
 ===============
 
 In addition to the web user interface and the scripts that start and
-stop Toaster, command-line commands exist through the ``manage.py``
+stop Toaster, command-line commands are available through the ``manage.py``
 management script. You can find general documentation on ``manage.py``
 at the
 `Django <https://docs.djangoproject.com/en/2.2/topics/settings/>`__
-- 
2.25.1

