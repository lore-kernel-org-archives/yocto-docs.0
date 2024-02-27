Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF743C54E5D
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:01:41 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.12832.1709042500794198354
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 06:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ezIdQOo2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5082060011;
	Tue, 27 Feb 2024 14:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZM28rGXbNQLyNnOTjEewozbHU2d1hq4dKCfwRzXHGm8=;
	b=ezIdQOo2N2gqtzxlyWqQKFdKHowcPIQZIDDaYU1ZQDdg+L8Z2pnxkXBW8zBaXuduZz9e8Z
	m+mOTDarz7nNgV9Y/V7p0uH6O5eu3M8vsFsg+7v91xdxCEDuz1wTbCZ/YbS9Twug4h1wbv
	82hi0lT1tVQ/wt89ryDthq8i7ZYss9YSaxhBkem/mSNylk+QpRnIyMxOzpl007AqFtcj7/
	9CcJQGK7CkAzgtALQdXzDSJs6YHLeQ1XiSEXUiH+ll9ai+MjVO3oY0YisZfTIIIrbZ369j
	+gXTbzrGu2Y7SpY46O2spA2VvrrG/jZ+4OUv8e4e205NPqLdygQvj8ieMumBPw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 09/16] manuals: update references to buildtools
Date: Tue, 27 Feb 2024 15:01:21 +0100
Message-Id: <20240227140128.481522-10-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
References: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 14:01:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4900

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Also fix number of corresponding paragraphs

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst  |  2 +-
 documentation/dev-manual/start.rst            |  4 +-
 .../migration-guides/migration-1.5.rst        |  3 +-
 .../migration-guides/migration-1.7.rst        |  4 +-
 .../migration-guides/migration-2.1.rst        |  6 +-
 .../migration-guides/migration-2.2.rst        |  2 +-
 .../migration-guides/migration-3.2.rst        |  2 +-
 .../migration-guides/migration-3.3.rst        |  6 +-
 .../migration-guides/migration-3.4.rst        |  2 +-
 .../migration-guides/migration-4.0.rst        |  2 +-
 documentation/ref-manual/faq.rst              |  2 +-
 .../ref-manual/system-requirements.rst        | 87 +++++++++----------
 documentation/ref-manual/terms.rst            | 18 ++++
 .../test-manual/understand-autobuilder.rst    |  2 +-
 14 files changed, 78 insertions(+), 64 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 462c942961..9eff13f583 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -75,7 +75,7 @@ following requirements:
 If your build host does not meet any of these three listed version
 requirements, you can take steps to prepare the system so that you
 can still use the Yocto Project. See the
-:ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`
+:ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`
 section in the Yocto Project Reference Manual for information.
 
 Build Host Packages
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 9dc9b855b3..834fb13088 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -308,10 +308,12 @@ Project Build Host:
 
    -  gcc &MIN_GCC_VERSION; or greater.
 
+   -  GNU make &MIN_MAKE_VERSION; or greater
+
    If your build host does not meet any of these listed version
    requirements, you can take steps to prepare the system so that you
    can still use the Yocto Project. See the
-   ":ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`"
+   ":ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`"
    section in the Yocto Project Reference Manual for information.
 
 4. *Install Development Host Packages:* Required development host
diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index 81a434d5b7..06334d6fc7 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -26,8 +26,7 @@ provide packages for these, you can install and use the Buildtools
 tarball, which provides an SDK-like environment containing them.
 
 For more information on this requirement, see the
-":ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`"
-section.
+":ref:`system-requirements-buildtools`" section.
 
 .. _migration-1.5-atom-pc-bsp:
 
diff --git a/documentation/migration-guides/migration-1.7.rst b/documentation/migration-guides/migration-1.7.rst
index d4af1277e9..73eb6d1b81 100644
--- a/documentation/migration-guides/migration-1.7.rst
+++ b/documentation/migration-guides/migration-1.7.rst
@@ -30,8 +30,8 @@ version required on the
 build host is now 1.7.8 because the ``--list`` option is now required by
 BitBake's Git fetcher. As always, if your host distribution does not
 provide a version of Git that meets this requirement, you can use the
-``buildtools-tarball`` that does. See the
-":ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`"
+:term:`buildtools` tarball that does. See the
+":ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`"
 section for more information.
 
 .. _migration-1.7-autotools-class-changes:
diff --git a/documentation/migration-guides/migration-2.1.rst b/documentation/migration-guides/migration-2.1.rst
index 6ef3adb443..54d359a67c 100644
--- a/documentation/migration-guides/migration-2.1.rst
+++ b/documentation/migration-guides/migration-2.1.rst
@@ -356,9 +356,9 @@ These additional changes exist:
 
 -  The minimum Git version has been increased to 1.8.3.1. If your host
    distribution does not provide a sufficiently recent version, you can
-   install the buildtools, which will provide it. See the
-   :ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`
-   section for more information on the buildtools tarball.
+   install the :term:`buildtools`, which will provide it. See the
+   :ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`
+   section for more information on the :term:`buildtools` tarball.
 
 -  The buggy and incomplete support for the RPM version 4 package
    manager has been removed. The well-tested and maintained support for
diff --git a/documentation/migration-guides/migration-2.2.rst b/documentation/migration-guides/migration-2.2.rst
index 49cd9b9ae0..979b5aa0f9 100644
--- a/documentation/migration-guides/migration-2.2.rst
+++ b/documentation/migration-guides/migration-2.2.rst
@@ -103,7 +103,7 @@ online package-manager support through SMART still require Python 2.
 ``buildtools-tarball`` Includes Python 3
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-``buildtools-tarball`` now includes Python 3.
+The :term:`buildtools` tarball now includes Python 3.
 
 .. _migration-2.2-uclibc-replaced-by-musl:
 
diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
index d593effe97..40a917bfc7 100644
--- a/documentation/migration-guides/migration-3.2.rst
+++ b/documentation/migration-guides/migration-3.2.rst
@@ -11,7 +11,7 @@ Minimum system requirements
 
 ``gcc`` version 6.0 is now required at minimum on the build host. For older
 host distributions where this is not available, you can use the
-``buildtools-extended-tarball`` (easily installable using
+:term:`buildtools-extended` tarball (easily installable using
 ``scripts/install-buildtools``).
 
 
diff --git a/documentation/migration-guides/migration-3.3.rst b/documentation/migration-guides/migration-3.3.rst
index 1eb494c286..b1b81d6839 100644
--- a/documentation/migration-guides/migration-3.3.rst
+++ b/documentation/migration-guides/migration-3.3.rst
@@ -12,9 +12,9 @@ Minimum system requirements
 
 You will now need at least Python 3.6 installed on your build host. Most recent
 distributions provide this, but should you be building on a distribution that
-does not have it, you can use the ``buildtools-tarball`` (easily installable
-using ``scripts/install-buildtools``) - see
-:ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`
+does not have it, you can use the :term:`buildtools` tarball (easily installable
+using ``scripts/install-buildtools``) --- see
+:ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`
 for details.
 
 
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index b184dde41e..0ef6c435ec 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -93,7 +93,7 @@ The ``lz4c``, ``pzstd`` and ``zstd`` commands are now required to be
 installed on the build host to support LZ4 and Zstandard compression
 functionality. These are typically provided by ``lz4`` and ``zstd``
 packages in most Linux distributions. Alternatively they are available
-as part of ``buildtools-tarball`` if your distribution does not provide
+as part of :term:`buildtools` tarball if your distribution does not provide
 them. For more information see
 :ref:`ref-manual/system-requirements:required packages for the build host`.
 
diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index 9e78fc709f..93576d4538 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -189,7 +189,7 @@ Supported host distribution changes
 
 - ``gcc`` version 7.5 is now required at minimum on the build host. For older
   host distributions where this is not available, you can use the
-  ``buildtools-extended-tarball`` (easily installable using
+  :term:`buildtools-extended` tarball (easily installable using
   ``scripts/install-buildtools``).
 
 :append/:prepend in combination with other operators
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 9fb60899c9..478fbb3a69 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -22,7 +22,7 @@ Can I still use the Yocto Project?
 **A:** You can get the required tools on your host development system a
 couple different ways (i.e. building a tarball or downloading a
 tarball). See the
-":ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`"
+":ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`"
 section for steps on how to update your build tools.
 
 **Q:** How can you claim Poky / OpenEmbedded-Core is stable?
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index e0b8400178..1a6f7647b6 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -276,8 +276,10 @@ supported CentOS-8 Linux distribution:
       $ sudo dnf install make python3-pip which
       &PIP3_HOST_PACKAGES_DOC;
 
-Required Git, tar, Python and gcc Versions
-==========================================
+.. _system-requirements-buildtools:
+
+Required Git, tar, Python, make and gcc Versions
+================================================
 
 In order to use the build system, your host development system must meet
 the following version requirements for Git, tar, and Python:
@@ -288,10 +290,12 @@ the following version requirements for Git, tar, and Python:
 
 -  Python &MIN_PYTHON_VERSION; or greater
 
+-  GNU make &MIN_MAKE_VERSION; or greater
+
 If your host development system does not meet all these requirements,
-you can resolve this by installing a ``buildtools`` tarball that
-contains these tools. You can get the tarball one of two ways: download
-a pre-built tarball or use BitBake to build the tarball.
+you can resolve this by installing a :term:`buildtools` tarball that
+contains these tools. You can either download a pre-built tarball or
+use BitBake to build one.
 
 In addition, your host development system must meet the following
 version requirement for gcc:
@@ -299,26 +303,26 @@ version requirement for gcc:
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
 
-1. Execute the ``install-buildtools`` script. Here is an example::
+#. Execute the ``install-buildtools`` script. Here is an example::
 
       $ cd poky
       $ scripts/install-buildtools \
@@ -327,7 +331,7 @@ installer and automatically installs the tools for you:
         --release yocto-&DISTRO; \
         --installer-version &DISTRO;
 
-   During execution, the buildtools tarball will be downloaded, the
+   During execution, the :term:`buildtools` tarball will be downloaded, the
    checksum of the download will be verified, the installer will be run
    for you, and some basic checks will be run to make sure the
    installation is functional.
@@ -338,7 +342,7 @@ installer and automatically installs the tools for you:
       /path/to/poky/buildtools
 
    If your host development system needs the additional tools provided
-   in the ``buildtools-extended`` tarball, you can instead execute the
+   in the :term:`buildtools-extended` tarball, you can instead execute the
    ``install-buildtools`` script with the default parameters::
 
       $ cd poky
@@ -346,24 +350,21 @@ installer and automatically installs the tools for you:
 
    Alternatively if your host development system has a broken ``make``
    version such that you only need a known good version of ``make``,
-   you can use the ``--make-only`` option:
+   you can use the ``--make-only`` option::
 
       $ cd poky
       $ scripts/install-buildtools --make-only
 
-2. Source the tools environment setup script by using a command like the
+#. Source the tools environment setup script by using a command like the
    following::
 
       $ source /path/to/poky/buildtools/environment-setup-x86_64-pokysdk-linux
 
-   Of course, you need to supply your installation directory and be sure to
-   use the right file (i.e. i586 or x86_64).
-
    After you have sourced the setup script, the tools are added to
    ``PATH`` and any other environment variables required to run the
    tools are initialized. The results are working versions versions of
    Git, tar, Python and ``chrpath``. And in the case of the
-   ``buildtools-extended`` tarball, additional working versions of tools
+   :term:`buildtools-extended` tarball, additional working versions of tools
    including ``gcc``, ``make`` and the other tools included in
    ``packagegroup-core-buildessential``.
 
@@ -371,12 +372,14 @@ Downloading a Pre-Built ``buildtools`` Tarball
 ----------------------------------------------
 
 If you would prefer not to use the ``install-buildtools`` script, you can instead
-download and run a pre-built buildtools installer yourself with the following
+download and run a pre-built :term:`buildtools` installer yourself with the following
 steps:
 
-1. Locate and download the ``*.sh`` at :yocto_dl:`/releases/yocto/yocto-&DISTRO;/buildtools/`
+#. Go to :yocto_dl:`/releases/yocto/yocto-&DISTRO;/buildtools/`, locate and
+   download the ``.sh`` file corresponding to your host architecture
+   and to :term:`buildtools`, :term:`buildtools-extended` or :term:`buildtools-make`.
 
-2. Execute the installation script. Here is an example for the
+#. Execute the installation script. Here is an example for the
    traditional installer::
 
       $ sh ~/Downloads/x86_64-buildtools-nativesdk-standalone-&DISTRO;.sh
@@ -393,44 +396,40 @@ steps:
    installation directory. For example, you could choose the following:
    ``/home/your-username/buildtools``
 
-3. Source the tools environment setup script by using a command like the
-   following::
+#. As instructed by the installer script, you will have to source the tools
+   environment setup script::
 
-      $ source /home/your_username/buildtools/environment-setup-i586-poky-linux
-
-   Of
-   course, you need to supply your installation directory and be sure to
-   use the right file (i.e. i585 or x86-64).
+      $ source /home/your_username/buildtools/environment-setup-x86_64-pokysdk-linux
 
    After you have sourced the setup script, the tools are added to
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
 
-1. On the machine that is able to run BitBake, be sure you have set up
+#. On the machine that is able to run BitBake, be sure you have set up
    your build environment with the setup script
    (:ref:`structure-core-script`).
 
-2. Run the BitBake command to build the tarball::
+#. Run the BitBake command to build the tarball::
 
       $ bitbake buildtools-tarball
 
-   or run the BitBake command to build the extended tarball::
+   or to build the extended tarball::
 
       $ bitbake buildtools-extended-tarball
 
@@ -446,22 +445,21 @@ installer:
    Once the build completes, you can find the ``.sh`` file that installs
    the tools in the ``tmp/deploy/sdk`` subdirectory of the
    :term:`Build Directory`. The installer file has the string
-   "buildtools" (or "buildtools-extended") in the name.
+   "buildtools" or "buildtools-extended" in the name.
 
-3. Transfer the ``.sh`` file from the build host to the machine that
+#. Transfer the ``.sh`` file from the build host to the machine that
    does not meet the Git, tar, or Python (or gcc) requirements.
 
-4. On the machine that does not meet the requirements, run the ``.sh``
-   file to install the tools. Here is an example for the traditional
-   installer::
+#. On this machine, run the ``.sh`` file to install the tools. Here is an
+   example for the traditional installer::
 
       $ sh ~/Downloads/x86_64-buildtools-nativesdk-standalone-&DISTRO;.sh
 
-   Here is an example for the extended installer::
+   For the extended installer::
 
       $ sh ~/Downloads/x86_64-buildtools-extended-nativesdk-standalone-&DISTRO;.sh
 
-   or for the make-only installer::
+   And for the make-only installer::
 
       $ sh ~/Downloads/x86_64-buildtools-make-nativesdk-standalone-&DISTRO;.sh
 
@@ -469,18 +467,15 @@ installer:
    installation directory. For example, you could choose the following:
    ``/home/your_username/buildtools``
 
-5. Source the tools environment setup script by using a command like the
+#. Source the tools environment setup script by using a command like the
    following::
 
       $ source /home/your_username/buildtools/environment-setup-x86_64-poky-linux
 
-   Of course, you need to supply your installation directory and be sure to
-   use the right file (i.e. i586 or x86_64).
-
    After you have sourced the setup script, the tools are added to
    ``PATH`` and any other environment variables required to run the
    tools are initialized. The results are working versions versions of
    Git, tar, Python and ``chrpath``. And in the case of the
-   ``buildtools-extended`` tarball, additional working versions of tools
+   :term:`buildtools-extended` tarball, additional working versions of tools
    including ``gcc``, ``make`` and the other tools included in
    ``packagegroup-core-buildessential``.
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index d602f7ea36..98ca677015 100644
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
index 11e2ceb12f..837109ad7d 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -205,7 +205,7 @@ The ``scripts/run-config`` execution is where most of the work within
 the Autobuilder happens. It runs through a number of steps; the first
 are general setup steps that are run once and include:
 
-#. Set up any ``buildtools-tarball`` if configured.
+#. Set up any :term:`buildtools` tarball if configured.
 
 <<<<<<< HEAD
 #. Call "buildhistory-init" if buildhistory is configured.
-- 
2.34.1


