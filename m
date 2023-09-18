Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85535C46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 14:17:25 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.52270.1695046636921308223
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 07:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Qnk/1d61;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 132511C0009;
	Mon, 18 Sep 2023 14:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695046635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1D2siFCS8v2oIzbaeU+5cDea6/O+lMwNtVHeDT66dM=;
	b=Qnk/1d61ftZfQueNFois68X8O48R4K+gqsTmnvaCX0ltEiWLCahmR2Rt7Ih+twlro1AuXg
	q6fhFowjefZ3/uNgQpy7IbSpLtJBTPhYbG2eXd83b0YIJptfC2DLbmcQSa1Cbue2ZdS8pN
	ARFL1ZK2gJWYszET07Iapzdiw0fX0SX2Prh4+Ow+TKE9OrjV+MB2GUYypFbskQNGi8mDxN
	+5r7pqYIFKgLCiZTthL7HqKsOWPiGKjJfh+2kbEccgX90GI1wXwq30fcKqpNRTf2MSu/td
	qUVCA3BH0tEk+soQbbHI9LDe1lgTZ3gcV8nMlnvlPuIbDy0RWnYJhjjBZ3n9DA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 3/5] ref-manual: add new variables
Date: Mon, 18 Sep 2023 16:17:02 +0200
Message-Id: <20230918141704.79680-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918141704.79680-1-michael.opdenacker@bootlin.com>
References: <20230918141704.79680-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Sep 2023 14:17:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4221

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Backported from "master" and used in dev-manual
documents to be synchronized with master.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 71 ++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1cc489a7ea..78cad25ca3 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1156,6 +1156,26 @@ system and gives an overview of their function and contents.
       optional at the distribution level, in case the hardware supports
       Bluetooth but you do not ever intend to use it.
 
+   :term:`COMMERCIAL_AUDIO_PLUGINS`
+      This variable is specific to the :yocto_git:`GStreamer recipes
+      </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb>`.
+      It allows to build the GStreamer `"ugly"
+      <https://github.com/GStreamer/gst-plugins-ugly>`__ and
+      `"bad" <https://github.com/GStreamer/gst-plugins-bad>`__ audio plugins.
+
+      See the :ref:`dev-manual/licenses:other variables related to commercial licenses`
+      section for usage details.
+
+   :term:`COMMERCIAL_VIDEO_PLUGINS`
+      This variable is specific to the :yocto_git:`GStreamer recipes
+      </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb>`.
+      It allows to build the GStreamer `"ugly"
+      <https://github.com/GStreamer/gst-plugins-ugly>`__ and
+      `"bad" <https://github.com/GStreamer/gst-plugins-bad>`__ video plugins.
+
+      See the :ref:`dev-manual/licenses:other variables related to commercial licenses`
+      section for usage details.
+
    :term:`COMMON_LICENSE_DIR`
       Points to ``meta/files/common-licenses`` in the
       :term:`Source Directory`, which is where generic license
@@ -2223,6 +2243,12 @@ system and gives an overview of their function and contents.
       :ref:`kernel-yocto <ref-classes-kernel-yocto>` class in
       ``meta/classes`` to see how the variable is used.
 
+   :term:`EXTERNAL_TOOLCHAIN`
+      When you intend to use an
+      :ref:`external toolchain <dev-manual/external-toolchain:optionally using an external toolchain>`,
+      this variable allows to specify the directory where this toolchain was
+      installed.
+
    :term:`EXTERNALSRC`
       When inheriting the :ref:`externalsrc <ref-classes-externalsrc>`
       class, this variable points to the source tree, which is outside of
@@ -7251,6 +7277,38 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Board Support Package Developer's Guide
       for additional information.
 
+   :term:`SPLASH_IMAGES`
+      This variable, used by the ``psplash`` recipe, allows to customize
+      the default splashscreen image.
+
+      Specified images in PNG format are converted to ``.h`` files by the recipe,
+      and are included in the ``psplash`` binary, so you won't find them in
+      the root filesystem.
+
+      To make such a change, it is recommended to customize the
+      ``psplash`` recipe in a custom layer. Here is an example structure for
+      an ``ACME`` board::
+
+          meta-acme/recipes-core/psplash
+          ├── files
+          │   └── logo-acme.png
+          └── psplash_%.bbappend
+
+      And here are the contents of the ``psplash_%.bbappend`` file in
+      this example::
+
+          SPLASH_IMAGES = "file://logo-acme.png;outsuffix=default"
+          FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
+
+      You could even add specific configuration options for ``psplash``,
+      for example::
+
+          EXTRA_OECONF += "--disable-startup-msg --enable-img-fullscreen"
+
+      For information on append files, see the
+      ":ref:`dev-manual/layers:appending other layers metadata with your layer`"
+      section.
+
    :term:`SRC_URI`
 
       See the BitBake manual for the initial description for this variable:
@@ -8930,6 +8988,19 @@ system and gives an overview of their function and contents.
       previous example, some-native-tool would be replaced with an actual
       native tool on which the build would depend.
 
+   :term:`WKS_FILES`
+      Specifies a list of candidate Wic kickstart files to be used by the
+      OpenEmbedded build system to create a partitioned image. Only the
+      first one that is found, from left to right, will be used.
+
+      This is only useful when there are multiple ``.wks`` files that can be
+      used to produce an image. A typical case is when multiple layers are
+      used for different hardware platforms, each supplying a different
+      ``.wks`` file. In this case, you specify all possible ones through
+      :term:`WKS_FILES`.
+
+      If only one ``.wks`` file is used, set :term:`WKS_FILE` instead.
+
    :term:`WORKDIR`
       The pathname of the work directory in which the OpenEmbedded build
       system builds a recipe. This directory is located within the
-- 
2.34.1


