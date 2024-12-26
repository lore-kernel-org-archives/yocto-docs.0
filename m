Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDA4E77188
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 15:22:02 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.22808.1735226516940234208
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Dec 2024 07:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AhoyiwZu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9A6AFF803;
	Thu, 26 Dec 2024 15:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735226515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Wqj1fU2X0HJKruxQfMY383lmOn8oYj/6eqzALQxptc8=;
	b=AhoyiwZuOCN+md4IjgxyEOfNJxoJmksXGe7+4se+KSECFUAt46Grwc1Jfw+ge+YkOFH1f9
	RcUU/Dmx4pJep1AIu4rOW9AAZlzwPXLvOApOR2qNyJFJd7HSKov2EQXsM5TsFtSHEp+TK+
	TZfG2HTMnNyDXoQNWl0B9l9vG32KM6vOiDvYQ3HXgjy+0xAXBLK2LylugBuQMiRZjTEoPQ
	bAy6JMuaK6bfVL3NxkuvxL1Hj3ij5ISlWJNmL9RdOcAzwZK97MJYUkDhq37+cVJTjxZVmC
	GMrLaYytDVsZuCCqTRE1IpjI3CrBzbGagHGptkOS5yaTPITXRVe7luaJQJ5K8Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/2] Move test related documentation to the test-manual
Date: Thu, 26 Dec 2024 16:20:15 +0100
Message-Id: <20241226-move-ptest-to-test-manual-v2-0-227db1b045a2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC90bWcC/42NQQ6CMBBFr0K6dgwdFcSV9zAsCkxlEuiQtjYaw
 t2tnMDVz/vJf39VgTxTULdiVZ4SBxaXAQ+F6kfjngQ8ZFZY4lkjVjBLIlgihQhRYM/ZuJeZYDi
 hpc7WtbmgyvvFk+X37n60mUcOUfxnv0r61/5jTRpKIKurrtH9tan1vROJE7tjL7Nqt237AvuXv
 QrEAAAA
X-Change-ID: 20241226-move-ptest-to-test-manual-d32febf77a52
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Yoann Congal <yoann.congal@smile.fr>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1942;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=7feWJn0ELy1t5lR0j5Pg/O5PC8K8hMZlcqV6hiY1tG4=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnbXSSVukL3IUftONlxYc8c5ZhsuwMPXrgY48oO
 J2qKiTa5WOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ210kgAKCRDRgEFAKaOo
 NoqdD/9ORvMZeCYf2EFt0a4PRqTmD2k/NxTOKOq0XKA/2ztqr1EWGGEWPnHT25An3juAMWjky6H
 bYUq0zpXcupWXzCDvONah3GEA/Klj2nkz1aSnOH0AB0BkbOO8zLFDpIOLT8rUGzuV2F6ZX782Xw
 Hq22kWewy2Jfy3lOwoYJ7pxgFjVX/JNWGAAulSuzEbwGIHMHo6ueyRM6L/xQsqMgap383ESlzC9
 Q8eIRybeQgs4In+URaqtZkfXn2lToAHA8m7Igm29HOFtfjBvCYMGxCd6YL/ol78xHqOjEdcxZap
 dANfFCqqN0HGPXmYJq+M4+p1QHoP+viqgOptw8eMblznTPstLGCnljsyh3faFpX3LhnOvRzX/bL
 5AX0/5nKFNeVJN15NJ9/PwcNwGn68xnO4+BzOnbgR/aILScUgaXx1aeCBVXs4bO+kBe/PWFE4IK
 9EWGAcJqHjbQH1W7mB2LPj+a66xTRx5rMEZe8gMWXBi5euX3j8jduckaKZF9N/NaT1WnXBdY/qj
 e5Ox0TSaY+cqjV37op5mRoSC8L2COMisyJoZRfD7r8KugA+dl7VUoCMu7hqhsceIxCK81ZW28w6
 ZoraBX4YNMT9+zDtzRb64eV7oK0rexGBmmGw0RjwoNqr8014Vs6uSMG9gRw0ESwUqmeOcD480re
 HzvIJ8HqZ2c8FZQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Dec 2024 15:22:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6042

This series to fix bug 15106, which suggests to move the ptest part of
the packages.rst document to the test manual. In addition, also
move the runtime testing documentation to the test manual.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- change the references to the ptest section from dev-manual to the
  test-manual, I forgot this in the previous version of the patch
- add missing overline in runtime-testing.rst
- Link to v1: https://lore.kernel.org/r/20241226-move-ptest-to-test-manual-v1-0-ef16b91c8971@bootlin.com

---
Antonin Godard (2):
      ref-manual/packages: move ptest section to the test-manual
      ref-manual: move runtime-testing section to the test-manual

 documentation/dev-manual/index.rst                 |   1 -
 documentation/dev-manual/packages.rst              | 112 +-------------------
 documentation/migration-guides/migration-1.5.rst   |   4 +-
 documentation/migration-guides/migration-1.6.rst   |   2 +-
 documentation/ref-manual/classes.rst               |   8 +-
 documentation/ref-manual/features.rst              |   2 +-
 documentation/ref-manual/images.rst                |   4 +-
 documentation/ref-manual/qa-checks.rst             |   2 +-
 documentation/ref-manual/release-process.rst       |   6 +-
 documentation/ref-manual/tasks.rst                 |   8 +-
 documentation/ref-manual/variables.rst             |  22 ++--
 documentation/test-manual/index.rst                |   2 +
 documentation/test-manual/intro.rst                |   6 +-
 documentation/test-manual/ptest.rst                | 114 +++++++++++++++++++++
 .../runtime-testing.rst                            |   5 +-
 15 files changed, 155 insertions(+), 143 deletions(-)
---
base-commit: 28850c974a3896895bc921c094071523218d6d07
change-id: 20241226-move-ptest-to-test-manual-d32febf77a52

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


