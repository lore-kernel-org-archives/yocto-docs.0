Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.4615.1600377051455709371
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Sep 2020 14:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.232, mailfrom: foss@0leil.net)
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay12.mail.gandi.net (Postfix) with ESMTPA id 56269200007;
	Thu, 17 Sep 2020 21:10:48 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 2/2] docs: fix broken links
Date: Thu, 17 Sep 2020 23:09:47 +0200
Message-Id: <20200917210947.51974-2-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917210947.51974-1-foss@0leil.net>
References: <20200917210947.51974-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 .../dev-manual/dev-manual-common-tasks.rst          | 13 +++++++------
 documentation/dev-manual/dev-manual-qemu.rst        |  2 +-
 documentation/dev-manual/dev-manual-start.rst       | 10 +++++-----
 .../overview-manual/overview-manual-concepts.rst    |  2 +-
 .../overview-manual-development-environment.rst     |  6 +++---
 .../overview-manual/overview-manual-yp-intro.rst    |  2 +-
 documentation/ref-manual/migration-1.5.rst          |  2 +-
 documentation/ref-manual/ref-images.rst             |  2 +-
 documentation/ref-manual/ref-terms.rst              |  2 +-
 documentation/ref-manual/ref-variables.rst          |  4 ++--
 documentation/sdk-manual/sdk-appendix-obtain.rst    |  6 +++---
 documentation/sdk-manual/sdk-extensible.rst         |  2 +-
 documentation/sdk-manual/sdk-intro.rst              |  4 ++--
 documentation/sdk-manual/sdk-using.rst              |  2 +-
 14 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 5eb7c5164..179979c76 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -10746,14 +10746,15 @@ varies by component:
    `bitbake-devel <http://lists.openembedded.org/mailman/listinfo/bitbake-devel>`__
    mailing list.
 
--  *"meta-*" trees:* These trees contain Metadata. Use the
-   `poky <https://lists.yoctoproject.org/listinfo/poky>`__ mailing list.
+-  *"meta-\*" trees:* These trees contain Metadata. Use the
+   `poky <https://lists.yoctoproject.org/g/poky>`__ mailing list.
+
+-  *Documentation*: For changes to the Yocto Project documentation, use the `docs
+   <https://lists.yoctoproject.org/g/docs>`__ mailing list.
 
 For changes to other layers hosted in the Yocto Project source
-repositories (i.e. ``yoctoproject.org``), tools, and the Yocto Project
-documentation, use the `Yocto
-Project <https://lists.yoctoproject.org/listinfo/yocto>`__ general
-mailing list.
+repositories (i.e. ``yoctoproject.org``) and tools use the `Yocto Project
+<https://lists.yoctoproject.org/g/yocto/>`__ general mailing list.
 
 .. note::
 
diff --git a/documentation/dev-manual/dev-manual-qemu.rst b/documentation/dev-manual/dev-manual-qemu.rst
index 88b03745f..2833689d5 100644
--- a/documentation/dev-manual/dev-manual-qemu.rst
+++ b/documentation/dev-manual/dev-manual-qemu.rst
@@ -81,7 +81,7 @@ available. Follow these general steps to run QEMU:
       your :term:`Build Directory`.
 
    -  If you have not built an image, you can go to the
-      :yocto_dl:`machines/qemu <releases/yocto/yocto-3.1.2/machines/qemu/>` area and download a
+      :yocto_dl:`machines/qemu </releases/yocto/yocto-3.1.2/machines/qemu/>` area and download a
       pre-built image that matches your architecture and can be run on
       QEMU.
 
diff --git a/documentation/dev-manual/dev-manual-start.rst b/documentation/dev-manual/dev-manual-start.rst
index 536d5a9cd..d9c1e4de0 100644
--- a/documentation/dev-manual/dev-manual-start.rst
+++ b/documentation/dev-manual/dev-manual-start.rst
@@ -380,7 +380,7 @@ as your Yocto Project build host:
    Depending on your build host, you might have to install different
    software to support Docker containers. Go to the Docker installation
    page and read about the platform requirements in "`Supported
-   Platforms <https://docs.docker.com/install/#supported-platforms>`__"
+   Platforms <https://docs.docker.com/engine/install/#supported-platforms>`__"
    your build host needs to run containers.
 
 2. *Choose What To Install:* Depending on whether or not your build host
@@ -402,11 +402,11 @@ as your Yocto Project build host:
    type of the software you need to install:
 
    -  Install `Docker CE for
-      Windows <https://docs.docker.com/docker-for-windows/install/#install-docker-for-windows-desktop-app>`__
+      Windows <https://docs.docker.com/docker-for-windows/install/#install-docker-desktop-on-windows>`__
       for Windows build hosts that meet requirements.
 
    -  Install `Docker CE for
-      Macs <https://docs.docker.com/docker-for-mac/install/#install-and-run-docker-for-mac>`__
+      MacOs <https://docs.docker.com/docker-for-mac/install/#install-and-run-docker-desktop-on-mac>`__
       for Mac build hosts that meet requirements.
 
    -  Install `Docker Toolbox for
@@ -619,7 +619,7 @@ Use the following procedure to locate the latest upstream copy of the
 
 3. *Find the URL Used to Clone the Repository:* At the bottom of the
    page, note the URL used to clone that repository
-   (e.g. :yocto_git:`/git/poky`).
+   (e.g. :yocto_git:`/cgit.cgi/poky`).
 
    .. note::
 
@@ -647,7 +647,7 @@ of a given component.
 Follow these steps to locate and download a particular tarball:
 
 1. *Access the Index of Releases:* Open a browser and go to
-   :yocto_dl:`Index of Releases <releases>`. The
+   :yocto_dl:`Index of Releases </releases>`. The
    list represents released components (e.g. ``bitbake``, ``sato``, and
    so on).
 
diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
index 3d8dc7afd..6ce5f80af 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/overview-manual-concepts.rst
@@ -153,7 +153,7 @@ several pieces of hardware.
 
 Many layers exist that work in the Yocto Project development
 environment. The `Yocto Project Curated Layer
-Index <https://caffelli-staging.yoctoproject.org/software-overview/layers/>`__
+Index <https://www.yoctoproject.org/software-overview/layers/>`__
 and `OpenEmbedded Layer
 Index <http://layers.openembedded.org/layerindex/branch/master/layers/>`__
 both contain layers from which you can use or leverage.
diff --git a/documentation/overview-manual/overview-manual-development-environment.rst b/documentation/overview-manual/overview-manual-development-environment.rst
index 3b5147d73..bb2c8e72e 100644
--- a/documentation/overview-manual/overview-manual-development-environment.rst
+++ b/documentation/overview-manual/overview-manual-development-environment.rst
@@ -43,7 +43,7 @@ Wikipedia has a good historical description of the Open Source
 Philosophy `here <http://en.wikipedia.org/wiki/Open_source>`__. You can
 also find helpful information on how to participate in the Linux
 Community
-`here <http://ldn.linuxfoundation.org/book/how-participate-linux-community>`__.
+`here <https://www.kernel.org/doc/html/latest/process/index.html>`__.
 
 .. _gs-the-development-host:
 
@@ -185,7 +185,7 @@ development:
    see the ":ref:`dev-manual/dev-manual-start:accessing source repositories`"
    Section in the Yocto Project Development Tasks Manual.
 
--  :yocto_dl:`Index of /releases: <releases>` This is an index
+-  :yocto_dl:`Index of /releases: </releases>` This is an index
    of releases such as Poky, Pseudo, installers for cross-development
    toolchains, miscellaneous support and all released versions of Yocto
    Project in the form of images or tarballs. Downloading and extracting
@@ -205,7 +205,7 @@ development:
    through the "SOFTWARE" menu that allows you to download any Yocto
    Project release, tool, and Board Support Package (BSP) in tarball
    form. The tarballs are similar to those found in the
-   :yocto_dl:`Index of /releases: <releases>` area.
+   :yocto_dl:`Index of /releases: </releases>` area.
 
    .. image:: figures/yp-download.png
       :align: center
diff --git a/documentation/overview-manual/overview-manual-yp-intro.rst b/documentation/overview-manual/overview-manual-yp-intro.rst
index 265fbda7f..5cdab7ca4 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.rst
+++ b/documentation/overview-manual/overview-manual-yp-intro.rst
@@ -224,7 +224,7 @@ your Metadata, the easier it is to cope with future changes.
       possible.
 
    -  Familiarize yourself with the `Yocto Project curated layer
-      index <https://caffelli-staging.yoctoproject.org/software-overview/layers/>`__
+      index <https://www.yoctoproject.org/software-overview/layers/>`__
       or the `OpenEmbedded layer
       index <http://layers.openembedded.org/layerindex/branch/master/layers/>`__.
       The latter contains more layers but they are less universally
diff --git a/documentation/ref-manual/migration-1.5.rst b/documentation/ref-manual/migration-1.5.rst
index ce55199df..fa6ff92f1 100644
--- a/documentation/ref-manual/migration-1.5.rst
+++ b/documentation/ref-manual/migration-1.5.rst
@@ -185,7 +185,7 @@ been introduced. You can find some of the implications for this change
 `here <http://cgit.openembedded.org/openembedded-core/commit/?id=0e326280a15b0f2c4ef2ef4ec441f63f55b75873>`__.
 The change also means that recipes that install files to ``/var/run``
 must be changed. You can find a guide on how to make these changes
-`here <http://permalink.gmane.org/gmane.comp.handhelds.openembedded/58530>`__.
+`here <https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg31649.html>`__.
 
 .. _migration-1.5-removal-of-package-manager-database-within-image-recipes:
 
diff --git a/documentation/ref-manual/ref-images.rst b/documentation/ref-manual/ref-images.rst
index f0229c3bb..c88d4d75c 100644
--- a/documentation/ref-manual/ref-images.rst
+++ b/documentation/ref-manual/ref-images.rst
@@ -42,7 +42,7 @@ Following is a list of supported recipes:
    `VMware
    Workstation <http://www.vmware.com/products/workstation/overview.html>`__.
    For more information on this image, see the :yocto_home:`Build
-   Appliance <software-item/build-appliance>` page
+   Appliance </software-item/build-appliance>` page
    on the Yocto Project website.
 
 -  ``core-image-base``: A console-only image that fully supports the
diff --git a/documentation/ref-manual/ref-terms.rst b/documentation/ref-manual/ref-terms.rst
index 6e7e5169c..600cc23c3 100644
--- a/documentation/ref-manual/ref-terms.rst
+++ b/documentation/ref-manual/ref-terms.rst
@@ -355,7 +355,7 @@ universal, the list includes them just in case:
      the Source Directory, if you do, the top-level directory name of the
      Source Directory is derived from the Yocto Project release tarball.
      For example, downloading and unpacking
-     :yocto_dl:`releases/yocto/&DISTRO_REL_TAG;/&YOCTO_POKY;.tar.bz2`
+     :yocto_dl:`/releases/yocto/&DISTRO_REL_TAG;/&YOCTO_POKY;.tar.bz2`
      results in a Source Directory whose root folder is named ``poky``.
 
      It is important to understand the differences between the Source
diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 625a37c15..c49c208bc 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -696,7 +696,7 @@ system and gives an overview of their function and contents.
       compiler. Consequently, the syntax follows Python's Regular
       Expression (re) syntax. The expressions are compared against the full
       paths to the files. For complete syntax information, see Python's
-      documentation at http://docs.python.org/3/library/re.html#re.
+      documentation at https://docs.python.org/3/library/re.html#regular-expression-syntax.
 
       The following example uses a complete regular expression to tell
       BitBake to ignore all recipe and recipe append files in the
@@ -3669,7 +3669,7 @@ system and gives an overview of their function and contents.
       The value in ``INITSCRIPT_PARAMS`` is passed through to the
       ``update-rc.d`` command. For more information on valid parameters,
       please see the ``update-rc.d`` manual page at
-      http://www.tin.org/bin/man.cgi?section=8&topic=update-rc.d.
+      https://manpages.debian.org/buster/init-system-helpers/update-rc.d.8.en.html
 
    INSANE_SKIP
       Specifies the QA checks to skip for a specific package within a
diff --git a/documentation/sdk-manual/sdk-appendix-obtain.rst b/documentation/sdk-manual/sdk-appendix-obtain.rst
index ffaed9dee..97ab9169e 100644
--- a/documentation/sdk-manual/sdk-appendix-obtain.rst
+++ b/documentation/sdk-manual/sdk-appendix-obtain.rst
@@ -17,7 +17,7 @@ and then run the script to hand-install the toolchain.
 Follow these steps to locate and hand-install the toolchain:
 
 1. *Go to the Installers Directory:* Go to
-   :yocto_dl:`releases/yocto/yocto-3.1.2/toolchain/`
+   :yocto_dl:`/releases/yocto/yocto-3.1.2/toolchain/`
 
 2. *Open the Folder for Your Build Host:* Open the folder that matches
    your :term:`Build Host` (i.e.
@@ -204,7 +204,7 @@ Follow these steps to extract the root filesystem:
    Image File:* You need to find and download the root filesystem image
    file that is appropriate for your target system. These files are kept
    in machine-specific folders in the
-   :yocto_dl:`Index of Releases <releases/yocto/yocto-3.1.2/machines/>`
+   :yocto_dl:`Index of Releases </releases/yocto/yocto-3.1.2/machines/>`
    in the "machines" directory.
 
    The machine-specific folders of the "machines" directory contain
@@ -258,7 +258,7 @@ Follow these steps to extract the root filesystem:
 
    Following is an example command that extracts the root filesystem
    from a previously built root filesystem image that was downloaded
-   from the :yocto_dl:`Index of Releases <releases/yocto/yocto-3.1.2/machines/>`.
+   from the :yocto_dl:`Index of Releases </releases/yocto/yocto-3.1.2/machines/>`.
    This command extracts the root filesystem into the ``core2-64-sato``
    directory:
    ::
diff --git a/documentation/sdk-manual/sdk-extensible.rst b/documentation/sdk-manual/sdk-extensible.rst
index 1ad5c46be..0f92ac9f0 100644
--- a/documentation/sdk-manual/sdk-extensible.rst
+++ b/documentation/sdk-manual/sdk-extensible.rst
@@ -51,7 +51,7 @@ Host` by running the ``*.sh`` installation script.
 You can download a tarball installer, which includes the pre-built
 toolchain, the ``runqemu`` script, the internal build system,
 ``devtool``, and support files from the appropriate
-:yocto_dl:`toolchain <releases/yocto/yocto-3.1.2/toolchain/>` directory within the Index of
+:yocto_dl:`toolchain </releases/yocto/yocto-3.1.2/toolchain/>` directory within the Index of
 Releases. Toolchains are available for several 32-bit and 64-bit
 architectures with the ``x86_64`` directories, respectively. The
 toolchains the Yocto Project provides are based off the
diff --git a/documentation/sdk-manual/sdk-intro.rst b/documentation/sdk-manual/sdk-intro.rst
index 2e01cf136..82b7bcf3c 100644
--- a/documentation/sdk-manual/sdk-intro.rst
+++ b/documentation/sdk-manual/sdk-intro.rst
@@ -195,7 +195,7 @@ You just need to follow these general steps:
    root filesystem images.
 
    If you are going to develop your application on hardware, go to the
-   :yocto_dl:`machines <releases/yocto/yocto-3.1.2/machines/>` download area and choose a
+   :yocto_dl:`machines </releases/yocto/yocto-3.1.2/machines/>` download area and choose a
    target machine area from which to download the kernel image and root
    filesystem. This download area could have several files in it that
    support development using actual hardware. For example, the area
@@ -205,7 +205,7 @@ You just need to follow these general steps:
 
    If you are going to develop your application and then run and test it
    using the QEMU emulator, go to the
-   :yocto_dl:`machines/qemu <releases/yocto/yocto-3.1.2/machines/qemu>` download area. From this
+   :yocto_dl:`machines/qemu </releases/yocto/yocto-3.1.2/machines/qemu>` download area. From this
    area, go down into the directory for your target architecture (e.g.
    ``qemux86_64`` for an Intel-based 64-bit architecture). Download the
    kernel, root filesystem, and any other files you need for your
diff --git a/documentation/sdk-manual/sdk-using.rst b/documentation/sdk-manual/sdk-using.rst
index cd57f07ee..09a194cab 100644
--- a/documentation/sdk-manual/sdk-using.rst
+++ b/documentation/sdk-manual/sdk-using.rst
@@ -47,7 +47,7 @@ Host` by running the ``*.sh`` installation script.
 
 You can download a tarball installer, which includes the pre-built
 toolchain, the ``runqemu`` script, and support files from the
-appropriate :yocto_dl:`toolchain <releases/yocto/yocto-3.1.2/toolchain/>` directory within
+appropriate :yocto_dl:`toolchain </releases/yocto/yocto-3.1.2/toolchain/>` directory within
 the Index of Releases. Toolchains are available for several 32-bit and
 64-bit architectures with the ``x86_64`` directories, respectively. The
 toolchains the Yocto Project provides are based off the
-- 
2.26.2

