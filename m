Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC71C4167B
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 09:09:33 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.98252.1671008972351123135
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Dec 2022 01:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LsOIMDgD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 629AA1BF20C;
	Wed, 14 Dec 2022 09:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671008970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iK03lAJu+xxy6qHkxF+/2c6Omg7of9pqnAqTR7moMiw=;
	b=LsOIMDgDsG7f7U6Z2HOpAm8GAZdT7gerRzPicavekBR/eZW1yBsAelzdZXB8qn4m/Tw1V5
	3opgLI6r+2/aVONBTtK5KEYI460ZqSyvMGlgvUzZEfhbC736lz+e1IBYREtmuuTz5RUfHX
	UsYlDv/sLAXqXSblx5oMX9FoFQmnMo9/91J6s/4UYmhmq6g2mpSSlc8dEac+FL5SFPNiNn
	WKwh+RK3aF3g49UXhmNADJoBQECSlLjY48MlvZrS/kAJa2jqhaThOZcaL8rYmswGRTSV4Y
	q3kJ2HT+EDy1vq5yuy4COHrrCuLeIYvjwifu0Arw6ekuIzDGhXzBsg6wy7S2/w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] manuals: create references to buildtools
Date: Wed, 14 Dec 2022 10:09:17 +0100
Message-Id: <20221214090917.196629-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221214090917.196629-1-michael.opdenacker@bootlin.com>
References: <20221214090917.196629-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 14 Dec 2022 09:09:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3554

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

On the side, also simplify a reference to the section describing them.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/migration-1.5.rst        |  3 +-
 .../migration-guides/migration-1.7.rst        |  2 +-
 .../migration-guides/migration-2.1.rst        |  4 +--
 .../migration-guides/migration-2.2.rst        |  2 +-
 .../migration-guides/migration-3.2.rst        |  2 +-
 .../migration-guides/migration-3.3.rst        |  2 +-
 .../migration-guides/migration-3.4.rst        |  2 +-
 .../migration-guides/migration-4.0.rst        |  2 +-
 .../migration-guides/migration-4.1.rst        |  4 +--
 .../migration-guides/release-notes-4.1.rst    |  2 +-
 .../ref-manual/system-requirements.rst        | 28 +++++++++----------
 documentation/ref-manual/terms.rst            | 18 ++++++++++++
 .../test-manual/understand-autobuilder.rst    |  2 +-
 13 files changed, 45 insertions(+), 28 deletions(-)

diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index e566785b73..14b1f4a0a5 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -28,8 +28,7 @@ provide packages for these, you can install and use the Buildtools
 tarball, which provides an SDK-like environment containing them.
 
 For more information on this requirement, see the
-":ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`"
-section.
+":ref:`system-requirements-buildtools`" section.
 
 .. _migration-1.5-atom-pc-bsp:
 
diff --git a/documentation/migration-guides/migration-1.7.rst b/documentation/migration-guides/migration-1.7.rst
index 4dc45ef090..94e9904b66 100644
--- a/documentation/migration-guides/migration-1.7.rst
+++ b/documentation/migration-guides/migration-1.7.rst
@@ -32,7 +32,7 @@ version required on the
 build host is now 1.7.8 because the ``--list`` option is now required by
 BitBake's Git fetcher. As always, if your host distribution does not
 provide a version of Git that meets this requirement, you can use the
-``buildtools-tarball`` that does. See the
+:term:`buildtools` tarball that does. See the
 ":ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`"
 section for more information.
 
diff --git a/documentation/migration-guides/migration-2.1.rst b/documentation/migration-guides/migration-2.1.rst
index c2fe2e9528..01352acbfa 100644
--- a/documentation/migration-guides/migration-2.1.rst
+++ b/documentation/migration-guides/migration-2.1.rst
@@ -358,9 +358,9 @@ These additional changes exist:
 
 -  The minimum Git version has been increased to 1.8.3.1. If your host
    distribution does not provide a sufficiently recent version, you can
-   install the buildtools, which will provide it. See the
+   install the :term:`buildtools`, which will provide it. See the
    :ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`
-   section for more information on the buildtools tarball.
+   section for more information on the :term:`buildtools` tarball.
 
 -  The buggy and incomplete support for the RPM version 4 package
    manager has been removed. The well-tested and maintained support for
diff --git a/documentation/migration-guides/migration-2.2.rst b/documentation/migration-guides/migration-2.2.rst
index 751fa06ee8..2d4f4d603e 100644
--- a/documentation/migration-guides/migration-2.2.rst
+++ b/documentation/migration-guides/migration-2.2.rst
@@ -105,7 +105,7 @@ online package-manager support through SMART still require Python 2.
 ``buildtools-tarball`` Includes Python 3
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-``buildtools-tarball`` now includes Python 3.
+The :term:`buildtools` tarball now includes Python 3.
 
 .. _migration-2.2-uclibc-replaced-by-musl:
 
diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
index a5fd8acb62..b53f2b7802 100644
--- a/documentation/migration-guides/migration-3.2.rst
+++ b/documentation/migration-guides/migration-3.2.rst
@@ -13,7 +13,7 @@ Minimum system requirements
 
 ``gcc`` version 6.0 is now required at minimum on the build host. For older
 host distributions where this is not available, you can use the
-``buildtools-extended-tarball`` (easily installable using
+:term:`buildtools-extended` tarball (easily installable using
 ``scripts/install-buildtools``).
 
 
diff --git a/documentation/migration-guides/migration-3.3.rst b/documentation/migration-guides/migration-3.3.rst
index 4ba39d6e32..16d5e2a3ee 100644
--- a/documentation/migration-guides/migration-3.3.rst
+++ b/documentation/migration-guides/migration-3.3.rst
@@ -14,7 +14,7 @@ Minimum system requirements
 
 You will now need at least Python 3.6 installed on your build host. Most recent
 distributions provide this, but should you be building on a distribution that
-does not have it, you can use the ``buildtools-tarball`` (easily installable
+does not have it, you can use the :term:`buildtools` tarball (easily installable
 using ``scripts/install-buildtools``) --- see
 :ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`
 for details.
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index efa4a6d097..88238091a1 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -95,7 +95,7 @@ The ``lz4c``, ``pzstd`` and ``zstd`` commands are now required to be
 installed on the build host to support LZ4 and Zstandard compression
 functionality. These are typically provided by ``lz4`` and ``zstd``
 packages in most Linux distributions. Alternatively they are available
-as part of ``buildtools-tarball`` if your distribution does not provide
+as part of :term:`buildtools` tarball if your distribution does not provide
 them. For more information see
 :ref:`ref-manual/system-requirements:required packages for the build host`.
 
diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index b3d30d2a5e..e11809b49c 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -191,7 +191,7 @@ Supported host distribution changes
 
 - ``gcc`` version 7.5 is now required at minimum on the build host. For older
   host distributions where this is not available, you can use the
-  ``buildtools-extended-tarball`` (easily installable using
+  :term:`buildtools-extended` tarball (easily installable using
   ``scripts/install-buildtools``).
 
 :append/:prepend in combination with other operators
diff --git a/documentation/migration-guides/migration-4.1.rst b/documentation/migration-guides/migration-4.1.rst
index 14263f70c7..8b9db40ddc 100644
--- a/documentation/migration-guides/migration-4.1.rst
+++ b/documentation/migration-guides/migration-4.1.rst
@@ -16,10 +16,10 @@ make 4.0 is now the minimum required make version
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 glibc now requires ``make`` 4.0 to build, thus it is now the version required to
-be installed on the build host. A new ``buildtools-make-tarball`` has been
+be installed on the build host. A new :term:`buildtools-make` tarball has been
 introduced to provide just make 4.0 for host distros without a current/working
 make 4.x version; if you also need other tools you can use the updated
-``buildtools-tarball``. For more information see
+:term:`buildtools` tarball. For more information see
 :ref:`ref-manual/system-requirements:required packages for the build host`.
 
 
diff --git a/documentation/migration-guides/release-notes-4.1.rst b/documentation/migration-guides/release-notes-4.1.rst
index b85a18c32c..09eb6d8c06 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -11,7 +11,7 @@ New Features / Enhancements in 4.1
 
 - ``make`` 4.0 is now the minimum make version required on the build host.
   For host distros that do not provide it, this is included as part of the
-  ``buildtools-tarball``, and additionally a new ``buildtools-make-tarball``
+  :term:`buildtools` tarball, and additionally a new :term:`buildtools-make` tarball
   has been introduced to provide this in particular for host distros with
   a broken make 4.x version. For more details see
   :ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`.
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index ebb6ca6470..1f9b3b1b58 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -208,7 +208,7 @@ the following version requirements for Git, tar, and Python:
 -  GNU make &MIN_MAKE_VERSION; or greater
 
 If your host development system does not meet all these requirements,
-you can resolve this by installing a ``buildtools`` tarball that
+you can resolve this by installing a :term:`buildtools` tarball that
 contains these tools. You can either download a pre-built tarball or
 use BitBake to build one.
 
@@ -218,23 +218,23 @@ version requirement for gcc:
 -  gcc &MIN_GCC_VERSION; or greater
 
 If your host development system does not meet this requirement, you can
-resolve this by installing a ``buildtools-extended`` tarball that
+resolve this by installing a :term:`buildtools-extended` tarball that
 contains additional tools, the equivalent of the Debian/Ubuntu ``build-essential``
 package.
 
 For systems with a broken make version (e.g. make 4.2.1 without patches) but
-where the rest of the host tools are usable, you can use the ``buildtools-make``
+where the rest of the host tools are usable, you can use the :term:`buildtools-make`
 tarball instead.
 
 In the sections that follow, three different methods will be described for
-installing the ``buildtools``, ``buildtools-extended`` or ``buildtools-make``
+installing the :term:`buildtools`, :term:`buildtools-extended` or :term:`buildtools-make`
 toolset.
 
 Installing a Pre-Built ``buildtools`` Tarball with ``install-buildtools`` script
 --------------------------------------------------------------------------------
 
 The ``install-buildtools`` script is the easiest of the three methods by
-which you can get these tools. It downloads a pre-built buildtools
+which you can get these tools. It downloads a pre-built :term:`buildtools`
 installer and automatically installs the tools for you:
 
 #. Execute the ``install-buildtools`` script. Here is an example::
@@ -246,7 +246,7 @@ installer and automatically installs the tools for you:
         --release yocto-&DISTRO; \
         --installer-version &DISTRO;
 
-   During execution, the buildtools tarball will be downloaded, the
+   During execution, the :term:`buildtools` tarball will be downloaded, the
    checksum of the download will be verified, the installer will be run
    for you, and some basic checks will be run to make sure the
    installation is functional.
@@ -257,7 +257,7 @@ installer and automatically installs the tools for you:
       /path/to/poky/buildtools
 
    If your host development system needs the additional tools provided
-   in the ``buildtools-extended`` tarball, you can instead execute the
+   in the :term:`buildtools-extended` tarball, you can instead execute the
    ``install-buildtools`` script with the default parameters::
 
       $ cd poky
@@ -279,7 +279,7 @@ installer and automatically installs the tools for you:
    ``PATH`` and any other environment variables required to run the
    tools are initialized. The results are working versions versions of
    Git, tar, Python and ``chrpath``. And in the case of the
-   ``buildtools-extended`` tarball, additional working versions of tools
+   :term:`buildtools-extended` tarball, additional working versions of tools
    including ``gcc``, ``make`` and the other tools included in
    ``packagegroup-core-buildessential``.
 
@@ -287,12 +287,12 @@ Downloading a Pre-Built ``buildtools`` Tarball
 ----------------------------------------------
 
 If you would prefer not to use the ``install-buildtools`` script, you can instead
-download and run a pre-built buildtools installer yourself with the following
+download and run a pre-built :term:`buildtools` installer yourself with the following
 steps:
 
 #. Go to :yocto_dl:`/releases/yocto/yocto-&DISTRO;/buildtools/`, locate and
    download the ``.sh`` file corresponding to your host architecture
-   and to ``buildtools``, ``buildtools-extended`` or ``buildtools-make``.
+   and to :term:`buildtools`, :term:`buildtools-extended` or :term:`buildtools-make`.
 
 #. Execute the installation script. Here is an example for the
    traditional installer::
@@ -320,20 +320,20 @@ steps:
    ``PATH`` and any other environment variables required to run the
    tools are initialized. The results are working versions versions of
    Git, tar, Python and ``chrpath``. And in the case of the
-   ``buildtools-extended`` tarball, additional working versions of tools
+   :term:`buildtools-extended` tarball, additional working versions of tools
    including ``gcc``, ``make`` and the other tools included in
    ``packagegroup-core-buildessential``.
 
 Building Your Own ``buildtools`` Tarball
 ----------------------------------------
 
-Building and running your own buildtools installer applies only when you
+Building and running your own :term:`buildtools` installer applies only when you
 have a build host that can already run BitBake. In this case, you use
 that machine to build the ``.sh`` file and then take steps to transfer
 and run it on a machine that does not meet the minimal Git, tar, and
 Python (or gcc) requirements.
 
-Here are the steps to take to build and run your own buildtools
+Here are the steps to take to build and run your own :term:`buildtools`
 installer:
 
 #. On the machine that is able to run BitBake, be sure you have set up
@@ -391,6 +391,6 @@ installer:
    ``PATH`` and any other environment variables required to run the
    tools are initialized. The results are working versions versions of
    Git, tar, Python and ``chrpath``. And in the case of the
-   ``buildtools-extended`` tarball, additional working versions of tools
+   :term:`buildtools-extended` tarball, additional working versions of tools
    including ``gcc``, ``make`` and the other tools included in
    ``packagegroup-core-buildessential``.
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 4081dbebd7..ec447d35d2 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -109,6 +109,24 @@ universal, the list includes them just in case:
       environment. The build system is sometimes referred to as the development
       host.
 
+   :term:`buildtools`
+      Build tools in binary form, providing required versions of development
+      tools (such as Git, GCC, Python and make), to run the OpenEmbedded build
+      system on a development host without such minimum versions.
+
+      See the ":ref:`system-requirements-buildtools`" paragraph in the
+      Reference Manual for details about downloading or building an archive
+      of such tools.
+
+   :term:`buildtools-extended`
+      A set of :term:`buildtools` binaries extended with additional development
+      tools, such as a required version of the GCC compiler to run the
+      OpenEmbedded build system.
+
+   :term:`buildtools-make`
+      A variant of :term:`buildtools`, just providing the required
+      version of ``make`` to run the OpenEmbedded build system.
+
    :term:`Classes`
       Files that provide for logic encapsulation and inheritance so that
       commonly used patterns can be defined once and then easily used in
diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index bfdc678164..b6e331f68c 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -204,7 +204,7 @@ The ``scripts/run-config`` execution is where most of the work within
 the Autobuilder happens. It runs through a number of steps; the first
 are general setup steps that are run once and include:
 
-#. Set up any ``buildtools-tarball`` if configured.
+#. Set up any :term:`buildtools` tarball if configured.
 
 #. Call "buildhistory-init" if :ref:`buildhistory <ref-classes-buildhistory>` is configured.
 
-- 
2.37.2


