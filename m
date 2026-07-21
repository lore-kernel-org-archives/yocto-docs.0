Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D97C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 12:18:20 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21233.1784636290772467808
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 05:18:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mtmG3IW0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E38D94E40EA0
	for <docs@lists.yoctoproject.org>; Tue, 21 Jul 2026 12:18:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B923560368;
	Tue, 21 Jul 2026 12:18:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA8B211BD18BC;
	Tue, 21 Jul 2026 14:18:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784636288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KYKqwy8ThkFXHYozB4zwtgVXk+gOJIjDbNln/Jhg4G0=;
	b=mtmG3IW0m/DGo4KetcTep8E3fqIxgWGjx0besLljmf0WP3TguC5nLIs61E3aPSu7FXBFMY
	epytS9Kv6f6UUMN1qB9QPvqoJhdoaJbxCejTVIDAYjMVX4X8fCz95i9A/Xuk9pA1Am1h2P
	XtGZm8i1KC0IfjDI6j3GPXW5XPSSBJEZzRs9+BpBG9yWD972cD6zwMI0x9A6cxNclxbJqY
	Z2ZeIL7nINGSI0aJJucybX2ZuPCyLmnOhH1jJ10y0vCCRTHCiOgYIDfoY5rF0gAES3BI+w
	W6GlhLbE1fC5Epwaw3q3FK/cOWnmtVqJ+90YTV2Ri1yJlCWiCtnOlEmWiT4PXw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 21 Jul 2026 14:17:55 +0200
Subject: [PATCH v2 3/3] migration-guides: replace broken link with archive
 links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-linkcheck-v2-3-32d93e054c50@bootlin.com>
References: <20260721-linkcheck-v2-0-32d93e054c50@bootlin.com>
In-Reply-To: <20260721-linkcheck-v2-0-32d93e054c50@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3636;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=DfssJarWdTY6eTwCJbvmf0P2VR5sJBpC/koGmH80TZA=;
 b=kA0DAAoB0YBBQCmjqDYByyZiAGpfY3ygNzX9qOp0qmcpcv4qjdjWw59WRtyRkJvwrtYWoMEVj
 YkCMwQAAQoAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJqX2N8AAoJENGAQUApo6g2UngP/3j1
 Q4Pl459N/cKvumXdiM0/xcgf+uQ7465FeZSX3Kc5FPQKSwNhJkU1Lvnsmbr20jkhITw4+gu3tz6
 eaqqbv2Ghx2PVAoNXdL5FGdxQvFcsV9Irq7UiE0HESHhYSmWF6o5KqCvHRcGZRbAgBwf2W03VBQ
 MHcXF8fPgwLLQC2xFmYbEaXntUjsFEYsL+b4J9W2mxGmvO27Z/xTYp+k83n9PNba4812PgFict4
 8uWN2fqietY4JlCNlA1yOLk8/uz/E5I4LKYeDtUZVVRWBPQ+6Z6L8ObxiF0uVHfXC3yIk/PNhQV
 q/OY+aTXNy8ddku4nBAF6/lxT3M8pUnpbGVU9c+IQfaxtaWTVEEZL9gLOFX2QxYfw2g6nHQWn+0
 nTmqS+QBXNPWH+ETJMbHCJqEqtrANgWgec8qWPHOmSWothj2reHMwMUZptMqhQEkhBcSV5U7qMd
 R+HcXBRfNKhRpV2sS5yGm0EG0EV5mAZIB/Imy47WdKwMWpJckUupxp722DQRpqz/XeqUgmgaV0h
 FM97rOiXLszwMK6twa22MDYXLiO3/Htljcle6N8ldYOvkyK4JPBNa6IS7CaqwaFOOs1S7+DyQOM
 7vkYzmGrxWzvj71n3ExJO0fKvR8GMLVOnaIkLBAhoT+7R1wQvEUUt6Ri3phr4d6gJWOj8NUzgsk
 B6GUf
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Jul 2026 12:18:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10104

Replace broken link with working archives found on
https://web.archive.org/.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.3.rst     | 2 +-
 documentation/migration-guides/release-notes-4.3.rst | 2 +-
 documentation/migration-guides/release-notes-5.0.rst | 2 +-
 documentation/migration-guides/release-notes-5.3.rst | 3 ++-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index 9e6a5769a..38c7d6771 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -247,7 +247,7 @@ The following variables have been removed:
    built during the build. This was partly broken and hard to maintain.
 
 -  ``GPE_MIRROR``: this variable used to contain the
-   "http://gpe.linuxtogo.org/download/source" URL, but was not used by any
+   "https://web.archive.org/web/20160319203545/http://gpe.linuxtogo.org/download/source/" URL, but was not used by any
    recipe in OE-Core.
 
 Removed recipes
diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index fde9e3d02..76afd16e8 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -73,7 +73,7 @@ New Features / Enhancements in 4.3
      for the latest long-term release (6.1).
 
    - The list of fixed kernel CVEs is updated regularly using data from
-     `linuxkernelcves.com <https://linuxkernelcves.com>`__.
+     `linuxkernelcves.com <https://web.archive.org/web/20240420122324/https://www.linuxkernelcves.com/>`__.
 
    - A ``showconfig`` task was added to the :ref:`ref-classes-cml1` class, to
      easily examine the final generated ``.config`` file.
diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 61ea4aa5a..b802e7c17 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -166,7 +166,7 @@ New Features / Enhancements in 5.0
       ``meta/lib/patchtest/tests``) and make a number of improvements to enable
       it to validate patches submitted on the mailing list again. Additionally,
       make it work with the original upstream version of
-      `Patchwork <http://jk.ozlabs.org/projects/patchwork/>`__.
+      `Patchwork <https://web.archive.org/web/20250823174533/http://jk.ozlabs.org/projects/patchwork/>`__.
 
    -  Add an optional ``unimplemented-ptest`` QA warning to detect upstream
       packages with tests, that do not use ptest.
diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index fdc092e51..ee9df424e 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -253,7 +253,8 @@ New Features / Enhancements in |yocto-ver|
       the :term:`Poky` distro.
 
    -  ``linux/generate-cve-exclusions``: use data from CVEProject instead of
-      the archived https://linuxkernelcves.com.
+      the archived https://linuxkernelcves.com (see
+      https://web.archive.org/web/20240420122324/https://www.linuxkernelcves.com/).
 
    -  ``kernel-yocto``: allow annotated options to be modified. For example if
       the following kernel configuration is set::

-- 
2.55.0


