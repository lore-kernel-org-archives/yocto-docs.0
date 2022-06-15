Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3943DC43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 12:36:15 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.4095.1655296571992999151
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 05:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DJm+xLyd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F1E18240004;
	Wed, 15 Jun 2022 12:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655296570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9yIOSJmWuUlduePiQrinl0s+3zFMFtXXaYxlnSw1zK8=;
	b=DJm+xLydVVdxjzShRXVYfVypnNTeFD4JyhCz/x8ZChTtoQ69lQjNao6oKMarxP0AykVtbq
	0KqlDo7WIPSYoEdk1kkDccxuROeNiVm6CmTheP0q7O+zap6I4oUejhmhOozlSKBqjMes2O
	tQToDARrA7+xp9dbEYu1W1om2+VplOhHI5fgMBjshYgkSe0RWIjzr9Y3N43hm8p78u7oVk
	zXghJcibn/u1m1KpoJDJaPMQZa2yrPaxXHAHO9Iw3nrR5ceDf+l1mSu0RbqzH+7mEkBrBW
	+d0KpwGmIwmIcWvL+N2JS7MHVt98sS44/zQ6HvPoDffRRX+o1h1wZiNI66es5Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH] ref-manual: add allow-root-login to IMAGE_FEATURES
Date: Wed, 15 Jun 2022 14:36:07 +0200
Message-Id: <20220615123607.1134284-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jun 2022 12:36:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3005

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Completing the descriptions of "debug-tweaks".
Correctiong the description of "allow-empty-password"
which doesn't imply accepting root logins.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <foss@0leil.net>
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


