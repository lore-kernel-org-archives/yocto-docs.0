Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A057CC10F1E
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 09:09:33 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.98883.1671008966898490242
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Dec 2022 01:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BhRFxW7k;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 696CDC0008;
	Wed, 14 Dec 2022 09:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671008964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=piCebEDSrrf3fyifsCEACkeQfoE03j/VSDLLpjliyIg=;
	b=BhRFxW7k/dz8FgZBtMUpQhU9j0fuVjZQu8R2AOOaCo6Om1mvHtqUAt5+XW0U+st2M6gB/j
	DJJ4Y+Tta0krfFTyYbatzsjhZRA/Qx6RfZuH/mFt5lCvhRQiT0vn547YF/Uo8OJA23dRCM
	MY9Y3A9mrB1Fi3rU4+tuTekR3MjAxwrOY2v9iPqPc3Rxlgtdt5A47SOD5a17rxynd3DVB+
	8OQ5P3AMRZQQ+ioS1snNr4Ku59UHaNhBl6dqPM48KkKA7yTxv37037OQsFgs3vEuUJzGN9
	dni39joUGxmDBOOURXxaJqPLdmmwn1cg0c6ohiEfpf46tSDo5kF91FQGS8E2Hg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] ref-manual/system-requirements.rst: update buildtools instructions
Date: Wed, 14 Dec 2022 10:09:16 +0100
Message-Id: <20221214090917.196629-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 14 Dec 2022 09:09:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3553

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Stop mentioning the buildtools i586 environment setup file,
  no longer available.

- Remove trivial or redundant instructions.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../ref-manual/system-requirements.rst        | 41 ++++++++-----------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 3f27c03e44..ebb6ca6470 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -191,6 +191,8 @@ supported AlmaLinux-8 Linux distribution:
       $ sudo dnf install make python3-pip which inkscape texlive-fncychap
       &PIP3_HOST_PACKAGES_DOC;
 
+.. _system-requirements-buildtools:
+
 Required Git, tar, Python, make and gcc Versions
 ================================================
 
@@ -207,8 +209,8 @@ the following version requirements for Git, tar, and Python:
 
 If your host development system does not meet all these requirements,
 you can resolve this by installing a ``buildtools`` tarball that
-contains these tools. You can get the tarball one of two ways: download
-a pre-built tarball or use BitBake to build the tarball.
+contains these tools. You can either download a pre-built tarball or
+use BitBake to build one.
 
 In addition, your host development system must meet the following
 version requirement for gcc:
@@ -263,7 +265,7 @@ installer and automatically installs the tools for you:
 
    Alternatively if your host development system has a broken ``make``
    version such that you only need a known good version of ``make``,
-   you can use the ``--make-only`` option:
+   you can use the ``--make-only`` option::
 
       $ cd poky
       $ scripts/install-buildtools --make-only
@@ -273,9 +275,6 @@ installer and automatically installs the tools for you:
 
       $ source /path/to/poky/buildtools/environment-setup-x86_64-pokysdk-linux
 
-   Of course, you need to supply your installation directory and be sure to
-   use the right file (i.e. i586 or x86_64).
-
    After you have sourced the setup script, the tools are added to
    ``PATH`` and any other environment variables required to run the
    tools are initialized. The results are working versions versions of
@@ -291,7 +290,9 @@ If you would prefer not to use the ``install-buildtools`` script, you can instea
 download and run a pre-built buildtools installer yourself with the following
 steps:
 
-#. Locate and download the ``*.sh`` at :yocto_dl:`/releases/yocto/yocto-&DISTRO;/buildtools/`
+#. Go to :yocto_dl:`/releases/yocto/yocto-&DISTRO;/buildtools/`, locate and
+   download the ``.sh`` file corresponding to your host architecture
+   and to ``buildtools``, ``buildtools-extended`` or ``buildtools-make``.
 
 #. Execute the installation script. Here is an example for the
    traditional installer::
@@ -310,14 +311,10 @@ steps:
    installation directory. For example, you could choose the following:
    ``/home/your-username/buildtools``
 
-#. Source the tools environment setup script by using a command like the
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
@@ -347,7 +344,7 @@ installer:
 
       $ bitbake buildtools-tarball
 
-   or run the BitBake command to build the extended tarball::
+   or to build the extended tarball::
 
       $ bitbake buildtools-extended-tarball
 
@@ -363,22 +360,21 @@ installer:
    Once the build completes, you can find the ``.sh`` file that installs
    the tools in the ``tmp/deploy/sdk`` subdirectory of the
    :term:`Build Directory`. The installer file has the string
-   "buildtools" (or "buildtools-extended") in the name.
+   "buildtools" or "buildtools-extended" in the name.
 
 #. Transfer the ``.sh`` file from the build host to the machine that
    does not meet the Git, tar, or Python (or gcc) requirements.
 
-#. On the machine that does not meet the requirements, run the ``.sh``
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
 
@@ -391,9 +387,6 @@ installer:
 
       $ source /home/your_username/buildtools/environment-setup-x86_64-poky-linux
 
-   Of course, you need to supply your installation directory and be sure to
-   use the right file (i.e. i586 or x86_64).
-
    After you have sourced the setup script, the tools are added to
    ``PATH`` and any other environment variables required to run the
    tools are initialized. The results are working versions versions of
-- 
2.37.2


