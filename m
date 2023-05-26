Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1749C7EE2D
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 11:43:33 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.5928.1685101408994421674
 for <docs@lists.yoctoproject.org>;
 Fri, 26 May 2023 04:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Uz0nTyzu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685101407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zXzBaAnIrasOsmMZTfHld/OcaIy/6bJnYyHeDHCaI0I=;
	b=Uz0nTyzudxubkpvGowrcFeXs1M51zt1oHQiEcWsgFK8pVdVHFSW2idkbXHZQw0S5r7zLH8
	LeQDJbCJpsY5EXCbdWmvJlNbAIBhQqzYyLMl0qwtHlOzf9hj4IfAa+kSvOiLrW+fI4GIPi
	/iEJqMgh0/pf38dYFuu3XzDQicqRa5S6A5JKUHQSGeA6DWKj+ioNdZF6GP2RGuBTdNAu9h
	UrJRrTCsr+ocCFGccb1dU/i65qjxU/xykMRZgd2KHgTYoj8SW32IAQ1O6GXB1WJbe3xpib
	RmBpZJkQDMrfoO/R6z7WBKePw3TJ7Tmh75390s9dE6VuQtrObr1nX6iYSv+dkA==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FCD9E000F;
	Fri, 26 May 2023 11:43:26 +0000 (UTC)
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] manuals: document SPLASH_IMAGES variable
Date: Fri, 26 May 2023 13:43:22 +0200
Message-Id: <20230526114322.1698988-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526114322.1698988-1-michael.opdenacker@bootlin.com>
References: <20230526114322.1698988-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 May 2023 11:43:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3970

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../dev-manual/custom-distribution.rst        |  9 +++---
 documentation/ref-manual/variables.rst        | 32 +++++++++++++++++++
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/custom-distribution.rst b/documentation/dev-manual/custom-distribution.rst
index e5b1ad777a..47faed0d04 100644
--- a/documentation/dev-manual/custom-distribution.rst
+++ b/documentation/dev-manual/custom-distribution.rst
@@ -98,11 +98,12 @@ layer. The following steps provide some more detail:
 
    -  Add any image recipes that are specific to your distribution.
 
-   -  Add a ``psplash`` append file for a branded splash screen. For
-      information on append files, see the
-      ":ref:`dev-manual/layers:appending other layers metadata with your layer`"
-      section.
+   -  Add a ``psplash`` append file for a branded splash screen, using
+      the :term:`SPLASH_IMAGES` variable.
 
    -  Add any other append files to make custom changes that are
       specific to individual recipes.
 
+   For information on append files, see the
+   ":ref:`dev-manual/layers:appending other layers metadata with your layer`"
+   section.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6680322f4c..6a7888ab47 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7826,6 +7826,38 @@ system and gives an overview of their function and contents.
       for such applications to use. This variable is set by default to
       ``psplash``.
 
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
    :term:`SRCREV_FORMAT`
       See :term:`bitbake:SRCREV_FORMAT` in the BitBake manual.
 
-- 
2.34.1


