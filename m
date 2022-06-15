Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2F9C43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 12:39:55 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.4199.1655296790489190196
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 05:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EBnTIjNc;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 28088200004;
	Wed, 15 Jun 2022 12:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655296788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jvb2E57Nk2Ie78JWhzQsaRuU1wTA/JZ5co8zyuTsiXE=;
	b=EBnTIjNcwFydN/g96fhSrnjQ6dbrrTIksu0nSCwP1dQE9F7rSLFrnGJhgHED/v3xPe8JEh
	8GLR3Yml5ByTNVRoN2pg92Z3Q+hkvbsK3Fn6+G+AyDnGQk5NsiMxSzx6c+XBhjEIxkWXb4
	aiskcmRJmf3vmis+AfI32gXWMqwnk9FZoC1dulyGcCVufIYNRAe0mvivch4pFvIA1F4HHV
	XTVjOxqk7exnkJZQkByVbkD9QuqMjUHbl7FiMF0KwtE7xqEbocCuXCkO/fbNIgtYBN7n9i
	ls6IRXPA0Ic8rv2EZu2psFHPKbqcRD92/mHWCUAFJm/ML49MeBqM2WvdtuYIJQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH v2] ref-manual: IMAGE_FEATURES: add allow-root-login and
 correct allow-empty-password
Date: Wed, 15 Jun 2022 14:39:45 +0200
Message-Id: <20220615123945.1134737-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <16F8CB76878BC08C.22184@lists.yoctoproject.org>
References: <16F8CB76878BC08C.22184@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jun 2022 12:39:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3006

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Completing the descriptions of "debug-tweaks".
Correcting the description of "allow-empty-password"
which doesn't imply accepting root logins.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <foss@0leil.net>

---

Changes in V2:
* Correct a typo in the commit message and improve title
---
 documentation/ref-manual/features.rst | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index f7abb417ba..f566b00c58 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -198,17 +198,19 @@ application problems or profile applications.
 
 Here are the image features available for all images:
 
--  *allow-empty-password:* Allows Dropbear and OpenSSH to accept root
-   logins and logins from accounts having an empty password string.
+-  *allow-empty-password:* Allows Dropbear and OpenSSH to accept
+   logins from accounts having an empty password string.
+
+-  *allow-root-login:* Allows Dropbear and OpenSSH to accept root logins.
 
 -  *dbg-pkgs:* Installs debug symbol packages for all packages installed
    in a given image.
 
 -  *debug-tweaks:* Makes an image suitable for development (e.g. allows
-   root logins without passwords and enables post-installation logging).
-   See the 'allow-empty-password', 'empty-root-password', and
-   'post-install-logging' features in this list for additional
-   information.
+   root logins, logins without passwords ---including root ones, and enables
+   post-installation logging). See the ``allow-empty-password``,
+   ``allow-root-login``, ``empty-root-password``, and ``post-install-logging``
+   features in this list for additional information.
 
 -  *dev-pkgs:* Installs development packages (headers and extra library
    links) for all packages installed in a given image.
-- 
2.34.1


