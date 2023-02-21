Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6049FC61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 10:44:46 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.38974.1676976281979587199
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 02:44:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=G0Fx6WAq;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1101D10000E;
	Tue, 21 Feb 2023 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676976279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iiSuiMrjT4+MoXmsPL7Piv3mCVdSUCMabVzNtnlkpDE=;
	b=G0Fx6WAqE3j0JOQu+DUafpXiCkO3ehVpVBEQIoaUTmOUCq8COJ8HrJAr6WOxttqsHBsorN
	Qtn5keHb3rcJrl22T2CoJ++NM9e3Ks0R5uatJ/R98l06ZvWgWRASjIO4L2M6Qrhkq0uhcN
	aBM2VsO4h19yJL0vNPYy648ZVmD743VfjycZD0qP3i4rTpmvNxaQRCFBMKXnN4YVlEgarF
	C4tLUbo4Yc7t1sTL/nv7kngK7+TpzwaqxhX1TYwUSyPGix2Ti1zPQkQk7f4tG/mnbeo4Xm
	LaLb2Z4aQ+jFfj16bpHgatmsO4YOM4lCXA75m91q4607czVAJE690lEV4s1awQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: document COMMERCIAL_[AUDIO|VIDEO]_PLUGINS variables
Date: Tue, 21 Feb 2023 11:44:36 +0100
Message-Id: <20230221104436.20516-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Feb 2023 10:44:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3704

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Add COMMERCIAL_[AUDIO|VIDEO]_PLUGINS variables to the
  variable index.
- Clarify that these plugins are still open-source
- Improve line width

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/licenses.rst  | 30 +++++++++++++++-----------
 documentation/ref-manual/variables.rst | 20 +++++++++++++++++
 2 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 65914e5efe..54d3a2e5f1 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -242,10 +242,8 @@ defined in the
    COMMERCIAL_AUDIO_PLUGINS ?= ""
    COMMERCIAL_VIDEO_PLUGINS ?= ""
 
-If you
-want to enable these components, you can do so by making sure you have
-statements similar to the following in your ``local.conf`` configuration
-file::
+If you want to enable these components, you can do so by making sure you have
+statements similar to the following in your ``local.conf`` configuration file::
 
    COMMERCIAL_AUDIO_PLUGINS = "gst-plugins-ugly-mad \
        gst-plugins-ugly-mpegaudioparse"
@@ -253,20 +251,26 @@ file::
        gst-plugins-ugly-mpegstream gst-plugins-bad-mpegvideoparse"
    LICENSE_FLAGS_ACCEPTED = "commercial_gst-plugins-ugly commercial_gst-plugins-bad commercial_qmmp"
 
-
-Of course, you could also create a matching list for those
-components using the more general "commercial" in the
-:term:`LICENSE_FLAGS_ACCEPTED` variable, but that would also enable all
-the other packages with :term:`LICENSE_FLAGS`
+Of course, you could also create a matching list for those components using
+the more general "commercial" in the :term:`LICENSE_FLAGS_ACCEPTED` variable,
+but that would also enable all the other packages with :term:`LICENSE_FLAGS`
 containing "commercial", which you may or may not want::
 
    LICENSE_FLAGS_ACCEPTED = "commercial"
 
 Specifying audio and video plugins as part of the
-``COMMERCIAL_AUDIO_PLUGINS`` and ``COMMERCIAL_VIDEO_PLUGINS`` statements
-(along with the enabling :term:`LICENSE_FLAGS_ACCEPTED`) includes the
-plugins or components into built images, thus adding support for media
-formats or components.
+:term:`COMMERCIAL_AUDIO_PLUGINS` and :term:`COMMERCIAL_VIDEO_PLUGINS` statements
+(along with the enabling :term:`LICENSE_FLAGS_ACCEPTED`) includes the plugins or
+components into built images, thus adding support for media formats or
+components.
+
+.. note::
+
+   GStreamer "ugly" and "bad" plugins are actually available through
+   open source licenses. However, the "ugly" ones can be subject to software
+   patents in some countries, making it necessary to pay licensing fees
+   to distribute them. The "bad" ones are just unreliable and therefore
+   should be used with care.
 
 Maintaining Open Source License Compliance During Your Product's Lifecycle
 ==========================================================================
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 760c608bde..26215f679f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1313,6 +1313,26 @@ system and gives an overview of their function and contents.
       optional at the distribution level, in case the hardware supports
       Bluetooth but you do not ever intend to use it.
 
+   :term:`COMMERCIAL_AUDIO_PLUGINS`
+      This variable is specific to the :yocto_git:`GStreamer recipes
+      </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb>`.
+      It allows to build the GStreamer `"ugly"
+      <https://github.com/GStreamer/gst-plugins-ugly>`__  and
+      `"bad" <https://github.com/GStreamer/gst-plugins-bad>`__ audio plugins.
+
+      See the ":ref:`dev-manual/licenses:other variables related to commercial licenses`"
+      section in the Development Tasks Manual for usage details.
+
+   :term:`COMMERCIAL_VIDEO_PLUGINS`
+      This variable is specific to the :yocto_git:`GStreamer recipes
+      </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb>`.
+      It allows to build the GStreamer `"ugly"
+      <https://github.com/GStreamer/gst-plugins-ugly>`__  and
+      `"bad" <https://github.com/GStreamer/gst-plugins-bad>`__ video plugins.
+
+      See the ":ref:`dev-manual/licenses:other variables related to commercial licenses`"
+      section in the Development Tasks Manual for usage details.
+
    :term:`COMMON_LICENSE_DIR`
       Points to ``meta/files/common-licenses`` in the
       :term:`Source Directory`, which is where generic license
-- 
2.37.2


