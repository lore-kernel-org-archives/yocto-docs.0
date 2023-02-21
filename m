Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFEFC636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 18:42:18 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.50313.1677004933341808176
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 10:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QWlYNYZc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 35A40C0004;
	Tue, 21 Feb 2023 18:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677004931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2KmuyBRwc+8htq9U/nz8I9lGEhdYwYeFzgJ7X7hsto=;
	b=QWlYNYZcKNL0y2Ifhu6fUT7bdEDJDlP2QE7+NbNj/86Sh1CArubMcdo7u3OjQ11V7CzVbQ
	d0FhCNVy6usOqNLVTbHPK3JhW5fXK0opQwUYMLO0REKSfiZNuBAobwGQUGu87mcLkxMIlr
	MatTO6UHNzgzuaDh4ahZ7iWfUqcTloMy5Z2fXI9VQ04biNZH+Mk1ZcRqnslIRXRZF3xZ06
	71FaZK3EJ2kKvJ4s8aq5+9Q7YT17XrdXyBOOPS7myQ1Uel516rS0hYjGkQbQsHCnqYBMiN
	sMdIwMPHA4cuCyeNX9G0z/YrKnSoldw4P8cItdRa53agwK1a+DhDoLQHfaMx+Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] manuals: document COMMERCIAL_[AUDIO|VIDEO]_PLUGINS variables
Date: Tue, 21 Feb 2023 19:41:56 +0100
Message-Id: <20230221184156.65816-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <3891ece8-e2e3-1e37-a372-dd88a7bbabf7@theobroma-systems.com>
References: <3891ece8-e2e3-1e37-a372-dd88a7bbabf7@theobroma-systems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Feb 2023 18:42:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3708

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Add COMMERCIAL_[AUDIO|VIDEO]_PLUGINS variables to the
  variable index.
- Clarify that these plugins are still open-source
- Improve line width

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---

Changes in V2:
- Style fixes
- Highlight that the "bad" status is according to GStreamer contributors
- Add a new "gstreamer-commercial-licenses" target so that we can refer
  to the modified section without hardcoding the title and the manual
  name in the reference. That's more resistant to changes.
According to the review from Quentin Schulz (thanks!)
---
 documentation/dev-manual/licenses.rst  | 32 +++++++++++++++-----------
 documentation/ref-manual/variables.rst | 18 +++++++++++++++
 2 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 65914e5efe..91a2ebce81 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -232,6 +232,8 @@ Here are some other scenarios:
    in the :term:`LICENSE_FLAGS_ACCEPTED` list (e.g.
    "commercial_foo_1.2") to specifically match a versioned recipe.
 
+.. _gstreamer-commercial-licenses:
+
 Other Variables Related to Commercial Licenses
 ----------------------------------------------
 
@@ -242,10 +244,8 @@ defined in the
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
@@ -253,20 +253,26 @@ file::
        gst-plugins-ugly-mpegstream gst-plugins-bad-mpegvideoparse"
    LICENSE_FLAGS_ACCEPTED = "commercial_gst-plugins-ugly commercial_gst-plugins-bad commercial_qmmp"
 
-
-Of course, you could also create a matching list for those
-components using the more general "commercial" in the
-:term:`LICENSE_FLAGS_ACCEPTED` variable, but that would also enable all
-the other packages with :term:`LICENSE_FLAGS`
+Of course, you could also create a matching list for those components using the
+more general "commercial" string in the :term:`LICENSE_FLAGS_ACCEPTED` variable,
+but that would also enable all the other packages with :term:`LICENSE_FLAGS`
 containing "commercial", which you may or may not want::
 
    LICENSE_FLAGS_ACCEPTED = "commercial"
 
 Specifying audio and video plugins as part of the
-``COMMERCIAL_AUDIO_PLUGINS`` and ``COMMERCIAL_VIDEO_PLUGINS`` statements
-(along with the enabling :term:`LICENSE_FLAGS_ACCEPTED`) includes the
-plugins or components into built images, thus adding support for media
-formats or components.
+:term:`COMMERCIAL_AUDIO_PLUGINS` and :term:`COMMERCIAL_VIDEO_PLUGINS` statements
+(along with :term:`LICENSE_FLAGS_ACCEPTED`) includes the plugins or
+components into built images, thus adding support for media formats or
+components.
+
+.. note::
+
+   GStreamer "ugly" and "bad" plugins are actually available through
+   open source licenses. However, the "ugly" ones can be subject to software
+   patents in some countries, making it necessary to pay licensing fees
+   to distribute them. The "bad" ones are just deemed unreliable by the
+   GStreamer community and should therefore be used with care.
 
 Maintaining Open Source License Compliance During Your Product's Lifecycle
 ==========================================================================
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 760c608bde..1848791938 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1313,6 +1313,24 @@ system and gives an overview of their function and contents.
       optional at the distribution level, in case the hardware supports
       Bluetooth but you do not ever intend to use it.
 
+   :term:`COMMERCIAL_AUDIO_PLUGINS`
+      This variable is specific to the :yocto_git:`GStreamer recipes
+      </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb>`.
+      It allows to build the GStreamer `"ugly"
+      <https://github.com/GStreamer/gst-plugins-ugly>`__  and
+      `"bad" <https://github.com/GStreamer/gst-plugins-bad>`__ audio plugins.
+
+      See the :ref:`gstreamer-commercial-licenses` section for usage details.
+
+   :term:`COMMERCIAL_VIDEO_PLUGINS`
+      This variable is specific to the :yocto_git:`GStreamer recipes
+      </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb>`.
+      It allows to build the GStreamer `"ugly"
+      <https://github.com/GStreamer/gst-plugins-ugly>`__  and
+      `"bad" <https://github.com/GStreamer/gst-plugins-bad>`__ video plugins.
+
+      See the :ref:`gstreamer-commercial-licenses` section for usage details.
+
    :term:`COMMON_LICENSE_DIR`
       Points to ``meta/files/common-licenses`` in the
       :term:`Source Directory`, which is where generic license
-- 
2.37.2


