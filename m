Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31567D74970
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 09:37:18 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13543.1766137027255461631
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 01:37:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sKmxMNRt;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 41E924E41CB5
	for <docs@lists.yoctoproject.org>; Fri, 19 Dec 2025 09:37:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1831B6071D
	for <docs@lists.yoctoproject.org>; Fri, 19 Dec 2025 09:37:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB8FF102F0BB4;
	Fri, 19 Dec 2025 10:37:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766137023; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=RbXTdDPlNP9BzPr+Mof0OAF/M6Bu49Yuolkvp+ZNrpE=;
	b=sKmxMNRtSJeBQmIlziA7dbzBu/KWD5M1GHk+KbZimIfOfbdi9EVCof725HNir0oU0FOD3Q
	/Ds8gEULEZNfd5qN7x+bDxQLTyrfjlsD/AInc51bLvwjbVLx7T52kNsOmwK48PC0E+t+Gr
	W8o5u9xtdLsTDhTFZEumkQW0IoqA8xoblKOSxJS1KG1pMBCiCoqcUenPPYzdQqKJ8hvk7p
	a7PNXh5DvvwmnxXQBjF2EfrUOEoQnRR5IWPHHbPvGXKRtr1v77fCJpb7hogyM6pv+mB7kj
	Q2OnM3z/JVn5pNVqeMp1K1lnmDRIdgoxcD4iCa2womnTIbTIV24wHYHpGdRn1Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 19 Dec 2025 10:36:54 +0100
Subject: [PATCH] ref-manual: drop documentation for oelint class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-drop-oelint-v1-1-3b40014fef28@bootlin.com>
X-B4-Tracking: v=1; b=H4sIALUcRWkC/yXMQQqAIBBA0avErBNSMqyrRIvUqSZCQyuC6O5ZL
 d/i/wsiBsIITXZBwIMieZfA8wzM1LsRGdlkEIWQXHDFbPAr87iQ25gcykqgsrqWNaRiDTjQ+d3
 a7nfc9Yxmexdw3w+5hYuxbwAAAA==
X-Change-ID: 20251218-drop-oelint-5f462e8db959
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=lA8alK0yOXeG2sj0WbAq3PE8BYAVaeq44pEEkn1pAfI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpRRy9kH/UnhG2RwwerneaG4oDKRcwRi1ipVgEX
 4t8OWMn3NqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUUcvQAKCRDRgEFAKaOo
 NukGEACff2O2fmMG6UeOS1yqhGLnRg7YQh7LPDMZJRvA2xjGMHo42iQIIvmE4LgEeQ3cCwu4zbT
 /WxHt1N2CeD0KZLmqVFZ0mkaEkb0TI0rQs7t9d6YyO+SSGjnHb8rwbSBl91Nd1GkRWwP18TrTze
 2QBRziX7AR9iGZs+OOYZN9wc9UKJTCtAX1l3zQXGVBsCNPBAWGoQiF/v0eQlQKzGMwpJjt6jlup
 JJZK4adt7o928KwAkiXA2t5WmzqGkrGQSnyWayQhQXRf+vL8kW0oX2Jf/ycSANwyL5SX9wGrcGp
 No8Yc4j9rJICZtgepOm8Wm3QpA7dU8zUYfb7JnHxA7I+x4nf4QtFB7WS125dx2GdWqJ8LvzgDdn
 QdpTDqyiCY+7O+Y3Lto1WWTkzzb0zz3U9tTeKZXWV/G+cyTBtAcXGTeicpEGp4hQEieu0ynJTP0
 I4qHvJ9TdlrAd45oODt85DGJp3GBi+Et/wdPaTMvylLg1Bo3uGZmOGTp6cHof/OzX/nMHwQtmea
 I46J69afytwEdLntQBalMDY6uio0k8TjgLVjiqb0BRCe6iJtRREBAUPKIhqdhyzd5CHRi0TW+vS
 ZYsXBp+aFXMe9ZLrBBcjaESNKLPFGICLtjDjgxu5W4Nbbu31RE60Bn7dlR0yud09fii++l0VAlc
 DbT+liyuDkGJ2JA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Dec 2025 09:37:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8307

Dropped with commit f35f00c5fe8c ("oelint: Remove obsolete class") in
OE-Core. Add a note in the migration guide.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Patch based on master-next in order to edit the migration guide.
---
 documentation/migration-guides/migration-6.0.rst |  3 +++
 documentation/ref-manual/classes.rst             | 14 --------------
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/documentation/migration-guides/migration-6.0.rst b/documentation/migration-guides/migration-6.0.rst
index f5b7da1dc..b18206b21 100644
--- a/documentation/migration-guides/migration-6.0.rst
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -58,6 +58,9 @@ Removed classes
 
 The following classes have been removed in this release:
 
+-  ``oelint``: remove as most of the checks done by this class are done in other
+   areas of code now, making this class obsolete.
+
 Removed features
 ----------------
 
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 7fc2f417d..eae15fd62 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1901,20 +1901,6 @@ For information on how to create NPM packages, see the
 ":ref:`dev-manual/packages:creating node package manager (npm) packages`"
 section in the Yocto Project Development Tasks Manual.
 
-.. _ref-classes-oelint:
-
-``oelint``
-==========
-
-The :ref:`ref-classes-oelint` class is an obsolete lint checking tool available in
-``meta/classes`` in the :term:`Source Directory`.
-
-There are some classes that could be generally useful in OE-Core but
-are never actually used within OE-Core itself. The :ref:`ref-classes-oelint` class is
-one such example. However, being aware of this class can reduce the
-proliferation of different versions of similar classes across multiple
-layers.
-
 .. _ref-classes-overlayfs:
 
 ``overlayfs``

---
base-commit: d5fb3c5e262d2c0cfe98f00734f403c2dd6340bc
change-id: 20251218-drop-oelint-5f462e8db959


