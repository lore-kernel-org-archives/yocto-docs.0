Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8201FCCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 16:33:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1766.1762187620637668034
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 08:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fQ/hAtTL;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 53BD61A184F
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 16:33:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A2B660628
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 16:33:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AA3F10B5009C
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 17:33:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762187618; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V69Tlp92Ezj4iicJV4EPfrymBxe1pKGX7wEao2pR9tk=;
	b=fQ/hAtTL2I49tFvsAUMoW6z1hDhlMwsmQHhHzCv8O2GIy5Liow2ei7VteD/uE3Lir/wueu
	L1hD3vNf0zu24ai0MzU+BCLIox47O93nrmUMEAW1F0wuCobm/aKPjaIujxy8RaJZlfoqpG
	Qzz1jhp575lPcSZlGvtXB+DzPToEd3rKIpX/oP6xIz5tJ+4MRd6Y9ws+fuzd5CoaA4zKkp
	fxsIwmi6Hnx2O9gKf4vdeO6jFLwuPS4M62QHpTAX74OHNN7CTFEEI8aAehMdNFX3O60kwR
	NXNoNeuYjuedMSbDL+9Guqx8DZi4cFWx5dNwnYaqvFKZjuvQODvL4++Xuz++tw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 03 Nov 2025 17:33:09 +0100
Subject: [PATCH v2 5/6] dev-manual: add a document to setup poky manually
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-bitbake-setup-v2-5-89fbb14cfbbd@bootlin.com>
References: <20251103-bitbake-setup-v2-0-89fbb14cfbbd@bootlin.com>
In-Reply-To: <20251103-bitbake-setup-v2-0-89fbb14cfbbd@bootlin.com>
To: docs@lists.yoctoproject.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8679;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Z5gU/CkotIzlC0/PPNe+2fbpeufc/Z03YlSZ4BNkOn0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpCNlf++GMVPSJJnMKVLVl6KTYN22R0SQ2v/4JK
 Jmb+qxzFr2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaQjZXwAKCRDRgEFAKaOo
 NuwwEAC0N5h37Rb9c2tYkj0TCp5DwQ2t6KdxA+zSS9cy71b608tZ/YDTFZMz+Im1nQTT+f7p0QA
 P/BtKRRk/MsjI/6miZgT5+H2KcXidEjYYl5hfWQ1KpwZqE/UCPlvMMEedgoFORaYJMJn4j4GP2V
 tzCB5Zv7cZjka6PMY9fSUezQz2EWCdm+hDNA3mM3CN9VFGLdlu1wKqDglUGetPHcT7MEbiDJgB6
 xjh1f4VrM91eRPqgK7Lar0LKQUXIidcljDxiVA4CtpxX5eC3+VSH6xwQMoawpI8fxlXPAZYwD62
 6Hp0zuuYTxZFkahXulbzDG9JaHdAFoTw49MB/QiRCz5cWdyo9fv3LJbFjzRCd2Kat124CZ4ak0x
 9LGxInJA8kVti4BQzlWUwXpKeofB2XDbaxp+EbpEYmLuaupyOE6OMS1lHIRaJWK5/Fs1vk0jGd8
 N1v9KG0/GXhXHkseWetcpVXSIA7WhKxBbC0o6oy9ebE87w6SBxVs4gwVHb4BoUkdfFnN/4hwq8v
 gEB68R5PZjtzKkjz+oUNJ7HTO2xRpXy5jg2hX+wzxPrePXWbi3xAzRnyWoi/u7b8rl5Vi0Fhy/M
 0LPbt7rVKhh6DrvpnY/zTqvJP3o6uh9ugi0tzoGL4ZAKAUsP7i+pPnefFgElxF16g5jNqdSfdew
 A0JR8vamER7pOjQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Nov 2025 16:33:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7980

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
index f8d09bb53..1d03e8c09 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -205,6 +205,12 @@ This directory contains:
 -  A ``config`` directory, representing the current configuration used for this
    :term:`bitbake:setup`.
 
+.. note::
+
+   It is also possible to setup the :term:`Poky` reference distro manually. For
+   that refer to the :doc:`/dev-manual/poky-manual-setup` section of the Yocto
+   Project Development Tasks Manual.
+
 Building Your Image
 ===================
 
@@ -261,7 +267,9 @@ an entire Linux distribution, including the toolchain, from source.
 
        These set up the environment similar to what was previously in the local
        configuration file :ref:`local.conf <structure-build-conf-local.conf>`,
-       which is now largely empty.
+       which is now largely empty. To setup the build how it was done
+       previously, see the :doc:`/dev-manual/poky-manual-setup` section of the
+       Yocto Project Development Tasks Manual.
 
     The current configuration does not allow the ``root`` user to login. As this
     can be useful for development, you can enable ``root`` login by opening the
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


