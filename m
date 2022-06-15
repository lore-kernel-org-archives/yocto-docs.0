Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268C8C43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 18:22:48 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.8363.1655317360702883701
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 11:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Hm9lF029;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 73ED4240004;
	Wed, 15 Jun 2022 18:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655317359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YsCCxbL7C+DlseaGpZ0gRbQGRr7iDadF3z2H7iVEWKA=;
	b=Hm9lF0298azLVlT4XwLL+m0231M8jONoEpPGBuv9kJGNrGWBxpmQlNTSsNpBtz+J7WpPFC
	IabV8ANCo1LcMi5GxeTSFk5vcTCUFo14o7j0xZiWGDXHGW7QNgCcPpcBoEPkG71OY9VXqV
	GEZFS3mih8ZUYxr62IWeKyx2PSGGexlmIALTkGbrDBrSAL3o3LDFm+wxVEm1dtoNLwBdId
	kjfGcAFOYJhwDjpZNEJJoVrJDdZyw2FiYWZGSCXqw19ya/OwC+V+CJ/kocT4/B1rhOPqto
	weE1tbrK89LFm3OZNo/QVNzSY/g/pPQc7Y645jJRnYAuQQeKboda9d+xhE9Ldw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: [PATCH] ref-manual: document SYSTEMD_DEFAULT_TARGET
Date: Wed, 15 Jun 2022 20:22:35 +0200
Message-Id: <20220615182235.1164087-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jun 2022 18:22:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3009

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14660]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
---
 documentation/ref-manual/variables.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 375333e7f0..606fb3317d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7640,6 +7640,24 @@ system and gives an overview of their function and contents.
       For information on Systemd-boot, see the `Systemd-boot
       documentation <https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/>`__.
 
+   :term:`SYSTEMD_DEFAULT_TARGET`
+
+      This variable allows to set the default unit that systemd starts at bootup.
+      Usually, this is either ``multi-user.target`` or ``graphical.target``.
+      This works by creating a ``default.target`` symbolic link to the chosen systemd
+      target file.
+
+      See `systemd's documentation
+      <https://www.freedesktop.org/software/systemd/man/systemd.special.html>`__
+      for details.
+
+      For example, this variable is used in the
+      `core-image-minimal-xfce.bb
+      <https://git.openembedded.org/meta-openembedded/tree/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb>`__
+      recipe::
+
+          SYSTEMD_DEFAULT_TARGET = "graphical.target"
+
    :term:`SYSTEMD_PACKAGES`
       When inheriting the :ref:`systemd <ref-classes-systemd>` class,
       this variable locates the systemd unit files when they are not found
-- 
2.34.1


