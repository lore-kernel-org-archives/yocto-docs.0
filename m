Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C273CCFA02
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 16:29:18 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.2135.1761841755820519980
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 09:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hEgVokMa;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 42E0F4E413FE
	for <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 16:29:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1A77D60331
	for <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 16:29:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 812B411808C70;
	Thu, 30 Oct 2025 17:29:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761841753; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QgMHRldHdjVIVJprme4/vcxu6jebPXKP6qQu1KYYNtY=;
	b=hEgVokMaXTB72Hy57kGEwb1wwqW9uZDNoXfbslX9ECxrZ8kTLm1Tw1JYkJlMW3aQnmfhr2
	ujt5CTaV8EI8ecLkAY67C3TUQgBDfA8o6oZ8QoQNEeki3oq0200RpL4eK8PPpWpXEEt9nf
	HlgXiRB6REsGsgYi40deh4tnjLyTZeMVCk+2nZ7qiGGnMxDNjxdZ4gCMkCmP75OLr6jJ4z
	cb/xY+9fLT/o4PH3LuQ0rjJ0bVTGYNvZiORQehGtiu2ZshQQb1m9cnsrE1L6bt77WCed21
	Y9NxuZN7xcjISzg/NNUawGzAhzuBA7UJIHhmENVyZmtVJuwGSzzfxUayTgv18g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 30 Oct 2025 17:28:34 +0100
Subject: [PATCH 5/6] dev-manual: add a document to setup poky manually
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-bitbake-setup-v1-5-f44a8a2b7c0b@bootlin.com>
References: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com>
In-Reply-To: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8520;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=qtK6LJRmFMXrNCS0ww5lWujVYN+BieRriuMSXsV4WdE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpA5JVYtxWfGipKG3bLUC3RWudmkcXELO+Ed1d4
 BX4sRy0jZKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaQOSVQAKCRDRgEFAKaOo
 NgNmEACEqLjyxPvBw5nsGg9ykmIllHxD3AoLiCoFKe4EoGD0/CrTEqn34LRsWi5recWlxtw7J0j
 qX6QqfRntWF6fPsHjS4fpKAKQaYUQ0rPCibt/1coLl86+KwYy24h6LoZzkebTDM/BVthR2nCPMQ
 mkpYRRLeI/ztTPVsxzwmKN9ao1heZp54Cw6LAqkYeu7jCuZ5OxV3qIFDT3L6ksNr9FRMYEyl6H1
 z+XnkBR8DJy+0crRuvj6tnoRaANOKuB9sGGVcrUsTa1UC+hmIqQDVt1B3Ue5subF2Jq/04Rx47y
 UaD2iqgw5InTW8YZod6BChS0QLxCnDelUKXxo/DgLBfjzCTVSmnHZbhRroZ3muckH/nPFa9VfK6
 LgOTx+H+7niNWcWLHNRjSaw8M/f+b9NRUZOO2ccKQXyhBuL1mgvD6XOFZl9GwyyqpP9ZW1f7r5L
 lXrj+f9sYaolRNTeJI7CQNtLxQ/+9hzYUvonizHZqwYfeseSPId2NNLEr4tCk4N8WYTqlOg2mUr
 wlxl3e9tR38n+gm5il/i5kYTY7VeyKSHwgKBD0tXVXO9MKdUEUpgjdPt8mdtcZQIAuWaqqKnuxg
 i5sWcwwqow768WkRRUY2jVZZBKQLuT+P/5HDRhjWgef+fxF/6RXQZHTegRqkGtP/2VnZVG4ZeMR
 V2ZyrVwAA6dAxIg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 16:29:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7930

Add a new document describing how to setup the Poky reference
distribution manually. This document is referenced in the Quick Guide,
so that users that _know_ they want to setup Poky without bitbake-setup
have a link to it.

This document is also important to reflect the layout of the layers
expected by the bblayers.conf.sample file, as explained in [1].

[1]: https://lore.kernel.org/poky/20251028-update-bblayers-sample-v1-1-97ec54cda94e@bootlin.com/

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst   |  10 +-
 documentation/dev-manual/index.rst             |   1 +
 documentation/dev-manual/poky-manual-setup.rst | 125 +++++++++++++++++++++++++
 3 files changed, 135 insertions(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index c79b53a8b..74afe638a 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -204,6 +204,12 @@ This directory contains:
 -  A ``config`` directory, representing the current configuration used in this
    directory.
 
+.. note::
+
+   It is also possible to setup the :term:`Poky` reference distro manually. For
+   that refer to the :doc:`/dev-manual/poky-manual-setup` section of the Yocto
+   Project Development Tasks Manual.
+
 Building Your Image
 ===================
 
@@ -267,7 +273,9 @@ an entire Linux distribution, including the toolchain, from source.
 
        These set up the environment similar to what was previously in the local
        configuration file :ref:`local.conf <structure-build-conf-local.conf>`,
-       which is now largely empty.
+       which is now largely empty. To setup the build how it was done
+       previously, see the :doc:`/dev-manual/poky-manual-setup` section of the
+       Yocto Project Development Tasks Manual.
 
     .. note::
 
diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
index 7a581236a..adf776e00 100644
--- a/documentation/dev-manual/index.rst
+++ b/documentation/dev-manual/index.rst
@@ -17,6 +17,7 @@ Yocto Project Development Tasks Manual
    upgrading-recipes
    temporary-source-code
    creating-fragments
+   poky-manual-setup
    quilt.rst
    development-shell
    python-development-shell
diff --git a/documentation/dev-manual/poky-manual-setup.rst b/documentation/dev-manual/poky-manual-setup.rst
new file mode 100644
index 000000000..c760f2c2c
--- /dev/null
+++ b/documentation/dev-manual/poky-manual-setup.rst
@@ -0,0 +1,125 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Setting Up the Poky Reference Distro Manually
+*********************************************
+
+While the default way to setup the :term:`Poky` reference distro is to use
+``bitbake-setup``, it is also possible to manually setup the environment. This
+document guides through this setup step-by-step.
+
+.. note::
+
+   This document will produce a setup similar to what is described in
+   :doc:`/brief-yoctoprojectqs/index`, which shows how to setup :term:`Poky`
+   with ``bitbake-setup``.
+
+Use Git to Clone The Layers
+===========================
+
+Go to :yocto_wiki:`Releases wiki page </Releases>`, and choose a release
+(such as ``&DISTRO_REL_LATEST_TAG;``), corresponding to either the latest stable
+release or a Long Term Support release.
+
+Once you complete the setup instructions for your machine (see the
+:doc:`/ref-manual/system-requirements` section of the Yocto Project Reference
+Manual), you need to get a copy of the different :term:`layers <Layer>` needed
+to setup the :term:`Poky` reference distribution on your build host. Use the
+following commands:
+
+.. code-block:: shell
+
+   $ mkdir layers/
+   $ git clone -b &DISTRO_REL_LATEST_TAG; https://git.openembedded.org/bitbake ./layers/bitbake
+   $ git clone -b &DISTRO_REL_LATEST_TAG; https://git.openembedded.org/openembedded-core ./layers/openembedded-core
+   $ git clone -b &DISTRO_REL_LATEST_TAG; https://git.yoctoproject.org/meta-yocto ./layers/meta-yocto
+
+Building Your Image
+===================
+
+Use the following steps to build your image. The build process creates
+an entire Linux distribution, including the toolchain, from source.
+
+.. note::
+
+   -  If you are working behind a firewall and your build host is not
+      set up for proxies, you could encounter problems with the build
+      process when fetching source code (e.g. fetcher failures or Git
+      failures).
+
+   -  If you do not know your proxy settings, consult your local network
+      infrastructure resources and get that information. A good starting
+      point could also be to check your web browser settings. Finally,
+      you can find more information on the
+      ":yocto_wiki:`Working Behind a Network Proxy </Working_Behind_a_Network_Proxy>`"
+      page of the Yocto Project Wiki.
+
+#.  **Initialize the Build Environment:** From your current working directory,
+    setup a build environment with the following command:
+
+    .. code-block:: shell
+
+       $ TEMPLATECONF=$PWD/layers/meta-yocto/meta-poky/conf/templates/default source ./layers/openembedded-core/oe-init-build-env
+
+    Among other things, the script creates the :term:`Build Directory`, which is
+    ``build`` in this case and is located in the :term:`Source Directory`.
+    After the script runs, your current working directory is set to the
+    :term:`Build Directory`. Later, when the build completes, the :term:`Build
+    Directory` contains all the files created during the build.
+
+#.  **Examine Your Local Configuration File:** When you set up the build
+    environment, a local configuration file named ``local.conf`` becomes
+    available in a ``conf`` sub-directory of the :term:`Build Directory`. For
+    this example, the defaults are set to build for a ``qemux86-64`` target,
+    which is suitable for emulation. The package manager used is set to the RPM
+    package manager.
+
+    .. tip::
+
+       You can significantly speed up your build and guard against fetcher
+       failures by using :ref:`overview-manual/concepts:shared state cache`
+       mirrors and enabling :ref:`overview-manual/concepts:hash equivalence`.
+       This way, you can use pre-built artifacts rather than building them.
+       This is relevant only when your network and the server that you use
+       can download these artifacts faster than you would be able to build them.
+
+       To use such mirrors, uncomment the below lines in your ``conf/local.conf``
+       file in the :term:`Build Directory`::
+
+          BB_HASHSERVE_UPSTREAM = "wss://hashserv.yoctoproject.org/ws"
+          SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
+          BB_HASHSERVE = "auto"
+          BB_SIGNATURE_HANDLER = "OEEquivHash"
+
+       The hash equivalence server needs the websockets python module version 9.1
+       or later. Debian GNU/Linux 12 (Bookworm) and later, Fedora, CentOS Stream
+       9 and later, and Ubuntu 22.04 (LTS) and later, all have a recent enough
+       package. Other supported distributions need to get the module some other
+       place than their package feed, e.g. via ``pip``.
+
+#.  **Start the Build:** Continue with the following command to build an OS
+    image for the target, which is ``core-image-sato`` in this example:
+
+    .. code-block:: shell
+
+       $ bitbake core-image-sato
+
+    For information on using the ``bitbake`` command, see the
+    :ref:`overview-manual/concepts:bitbake` section in the Yocto Project Overview and
+    Concepts Manual, or see
+    :ref:`bitbake-user-manual/bitbake-user-manual-intro:the bitbake command`
+    in the BitBake User Manual.
+
+#.  **Simulate Your Image Using QEMU:** Once this particular image is
+    built, you can start QEMU, which is a Quick EMUlator that ships with
+    the Yocto Project:
+
+    .. code-block:: shell
+
+       $ runqemu qemux86-64
+
+    If you want to learn more about running QEMU, see the
+    :ref:`dev-manual/qemu:using the quick emulator (qemu)` chapter in
+    the Yocto Project Development Tasks Manual.
+
+#.  **Exit QEMU:** Exit QEMU by either clicking on the shutdown icon or by typing
+    ``Ctrl-C`` in the QEMU transcript window from which you evoked QEMU.

-- 
2.51.0


