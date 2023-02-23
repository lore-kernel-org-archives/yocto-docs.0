Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD73C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 09:58:08 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.7194.1677146282507572598
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 01:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AsrERjSg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 517BFC000A;
	Thu, 23 Feb 2023 09:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677146280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lsSDe0P2pIoSefTnXSrOZ2wIJ6sb9U4l8rZ3EcGlGB8=;
	b=AsrERjSgbama+kF0/wDBRUdHNQbdGPovi+eE2cgSZEKTA0q2bUUtrz3DIHRQ6ZUeLEDxxO
	fLnorftMc6rTGZaJwgqwHVQggiLQMRTpMt9s79RY2XXsYwH2VXIm2vZwaJ0yBLX4jU9Ynn
	Jy9XAnVOPBnxwRYceHaAAjndNv1vARMVHTj6lJfZLCnb+7NmHTMNWaXOLKdg9rJfT2yia0
	3DYZR7dyjyuSbo+v/t1/lCm4JMLSf9ggqqsAoZk1GQi/9nbuNlEkXf7cWh6jxy2M81Wv9e
	3O/KCHPzpajrrHrmpM6vmMJmrs2VkndX/IZ6sR7D7h7N8KHLvDxb32gMLm9Dig==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v3] manuals: document COMMERCIAL_[AUDIO|VIDEO]_PLUGINS variables
Date: Thu, 23 Feb 2023 10:57:52 +0100
Message-Id: <20230223095752.203488-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <17466B9DEF05DAD6.11621@lists.yoctoproject.org>
References: <17466B9DEF05DAD6.11621@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Feb 2023 09:58:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3722

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Add COMMERCIAL_[AUDIO|VIDEO]_PLUGINS variables to the
  variable index.
- Clarify that these plugins are still open-source
- Improve line width

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---

Changes in V3:
- Revert the creation of the "gstreamer-commercial-licenses" target,
  as the section is just about the "ugly" and "bad" plugins.

Changes in V2:
- Style fixes
- Highlight that the "bad" status is according to GStreamer contributors
- Add a new "gstreamer-commercial-licenses" target so that we can refer
  to the modified section without hardcoding the title and the manual
  name in the reference. That's more resistant to changes.
According to the review from Quentin Schulz (thanks!)
---
 documentation/dev-manual/licenses.rst  | 30 +++++++++++++++-----------
 documentation/ref-manual/variables.rst | 20 +++++++++++++++++
 2 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 65914e5efe..9629dc5329 100644
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
index 760c608bde..e5bc8e296b 100644
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
+      See the :ref:`dev-manual/licenses:other variables related to commercial licenses`
+      section for usage details.
+
+   :term:`COMMERCIAL_VIDEO_PLUGINS`
+      This variable is specific to the :yocto_git:`GStreamer recipes
+      </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb>`.
+      It allows to build the GStreamer `"ugly"
+      <https://github.com/GStreamer/gst-plugins-ugly>`__  and
+      `"bad" <https://github.com/GStreamer/gst-plugins-bad>`__ video plugins.
+
+      See the :ref:`dev-manual/licenses:other variables related to commercial licenses`
+      section for usage details.
+
    :term:`COMMON_LICENSE_DIR`
       Points to ``meta/files/common-licenses`` in the
       :term:`Source Directory`, which is where generic license
-- 
2.37.2


