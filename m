Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA548C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 13:07:13 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.72863.1674738425222144889
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 05:07:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lU461CPm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C3926E000F;
	Thu, 26 Jan 2023 13:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674738422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3wpa6V9CkNKUqeAMVpXNzIekV1vKK3pmqI8m3K2w+us=;
	b=lU461CPmv/aJbb+qI6OqIBx1/oyHDoO1KIX/gZo6TvdGS5Z+h14P2P5s8T+y+zqRdM2EBs
	kHQC/U0yuCtG/1JjUkK9oqA/l5V+CUqTja08zjQpBw5jc4Xz6I+wKii2e21G65wc3br0b3
	muXTeZU+WtTdRg89Ez8CX2VjADebh7gRdUU6Wy7l4iSspJm+GxBjQJRVKKfxqo3yFS338/
	/Wyzkpg5EQ6OyM1hovUoi8PjuLtqTzg25l6SJ82u46bvzNv75ZikMl10CnCe2E+glmZ013
	OEOmxmYLbucOkRyXZB22DAIs10UlWYO0O12kJO5Fd9PdTQ9L3HOyv0NayccIGw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-guides/migration-4.2.rst: fix minor issues
Date: Thu, 26 Jan 2023 14:06:59 +0100
Message-Id: <20230126130659.16709-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Jan 2023 13:07:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3623

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Underline fix
- Spacing fixes in bullet lists. Our standard
  is to use two spaces after "-", and a bullet
  list is supposed to be preceded by an empty line
  to be recognized.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/migration-4.2.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/documentation/migration-guides/migration-4.2.rst b/documentation/migration-guides/migration-4.2.rst
index 944ad31a4c..1339411b3e 100644
--- a/documentation/migration-guides/migration-4.2.rst
+++ b/documentation/migration-guides/migration-4.2.rst
@@ -12,7 +12,7 @@ Project 4.2 Release (codename "mickledore") from the prior release.
 .. _migration-4.2-python-3.8:
 
 Python 3.8 is now the minimum required Python version version
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 BitBake and OpenEmbedded-Core are now relying on Python 3.8,
 making it a requirement to use a distribution providing at least this
@@ -28,8 +28,8 @@ QA check changes
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
 
-- The ``OEBasic`` signature handler (see :term:`BB_SIGNATURE_HANDLER`) has been
-  removed.
+-  The ``OEBasic`` signature handler (see :term:`BB_SIGNATURE_HANDLER`) has been
+   removed.
 
 .. _migration-4.2-removed-variables:
 
@@ -37,7 +37,8 @@ Removed variables
 ~~~~~~~~~~~~~~~~~
 
 The following variables have been removed:
-- ``SERIAL_CONSOLE``, deprecated since version 2.6, replaced by :term:``SERIAL_CONSOLES``.
+
+-  ``SERIAL_CONSOLE``, deprecated since version 2.6, replaced by :term:``SERIAL_CONSOLES``.
 
 .. _migration-4.2-removed-recipes:
 
-- 
2.37.2


