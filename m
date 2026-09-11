Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954EAC88E5E
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:56:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41431.1789138591956113780
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 07:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=b2SXxZP/;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2732AC63A0D
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:57:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5830B601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3231411C7AFB0;
	Fri, 11 Sep 2026 16:56:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789138589; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZQmXY0tiOBTd0O7Ef6f+TeA8ITf/kd4OdfZc9k9vsBI=;
	b=b2SXxZP/JBxlrH9YCCI2UZo6E5aecdtHneiQEwNDdodbwB5ifFVI4WBxeGZebeQb+P92B8
	kE/JY+zHx3sfrZvVEfK+2bg7JcJcFwKTHu9/kgOUNGVZZu2LpIPJeAe3Y7jLxrbDklRlkL
	/Kq0p0nvlef9sI1j+uoLznxNVsQ+QaAqLGDMkD0Da0+ZYV9TLdNDkj/s35fHzK93chQiY6
	eCf7AaAhIhLIyWnge4lCWcQj7AG2sA8KNyVR7a9F2JjazZt6Syp4ZrVB1uQOIm7ZJKLxfs
	uWG8esOK7CGjDeCTfhI1o9HzmXbx4n7X7UZN7D0JX8pndXlYA8nb6AFdupEPQg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 16:56:08 +0200
Subject: [PATCH 08/10] dev-manual/poky-manual-setup.rst: suggest use of
 fragment instead of assignments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-assorted-fixes-v1-8-0d92a8112918@bootlin.com>
References: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
In-Reply-To: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1845;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=cL1fnO4NX8SMKpEHzbKXgIR1d0tmQNmYuoZq3zosnXM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBaWGMvUVKVPkOYZs/3a9jP4oUwRtceHNKHKk
 0zaqZZ8rlmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQWlgAKCRDRgEFAKaOo
 Nu8QD/wP1YnKqshsTX9+TnhSz5UL1L5rXPvBvt8riq3TvhoP2nN0HiF9KiW3OTMwDfO2QliJ4Kx
 MQ1DAQXUSpg42ZppQRvozf5oUSj+WoxgmGupNUIVy9uyrTD/SK8TBz0iOGDHs/ntFPBe3qjNXdI
 LNiFHkiLyhd+KIHrG8RUMEYVgVCGor4mci1UIQ9DtfcjhogSh8IdBo+RlyQr7SOj/yEwNS8EqQi
 BPoVSLa9Gm2M6N3hHu1X+FPeU7M/kNDTSNUvITvO1E7wICtQtE8sM8QYSh9q17GU4eM+z1Z2CK7
 k0HrHPU14aGDzB+zLxWzZSXxb4FZ4mni6/yeUA9vJqMNChVamCJEUqRshGSAiIBFD/xBHwuMDdz
 jCQOunhUEoRLSC3OqmY4Y1lS8q4ZWe/shu1HvN3dixlVYbNyMtt4xWDc5s8HwrGuFTU2Jj8i2um
 1Vt9d69Vkj9tjAO5R4mEOLSeC6DsXW34WR6CPUWOU7u6Mc33xaj9xOhAFRRdUki2J77e7KhvxQc
 1BYKq1b0UboKGtcXevN6+rFPwFD9pVeQ9INK0hHc+kDjQ7mFtQ3LSSU7jLLOi9k7QnIjMoXwQqi
 ld9QhHjE83E2gIlfeeNEhpFXwfkeVLr8R6TattEK7aczjYILsCvN5MslEvpi22Pyiq8QImstrG0
 uOow/E7gUu1uQ2A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10462

The poky-manual-setup document was ported from the previous Quick start
guide we used to maintain. While this document is oriented towards
setting variables from configuration files rather than using fragments
and bitbake-setup, we can still suggest to enable hash equivalence
through our sstate-mirror-cdn fragment. This way, changes to this
fragment don't have to be maintained here explicitly.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/poky-manual-setup.rst | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/documentation/dev-manual/poky-manual-setup.rst b/documentation/dev-manual/poky-manual-setup.rst
index 833e1631e..5e65763d5 100644
--- a/documentation/dev-manual/poky-manual-setup.rst
+++ b/documentation/dev-manual/poky-manual-setup.rst
@@ -118,13 +118,11 @@ an entire Linux distribution, including the toolchain, from source.
        This is relevant only when your network and the server that you use
        can download these artifacts faster than you would be able to build them.
 
-       To use such mirrors, uncomment the below lines in your ``conf/local.conf``
-       file in the :term:`Build Directory`::
+       To use such mirrors, run the following command:
 
-          BB_HASHSERVE_UPSTREAM = "wss://hashserv.yoctoproject.org/ws"
-          SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
-          BB_HASHSERVE = "auto"
-          BB_SIGNATURE_HANDLER = "OEEquivHash"
+       .. code-block:: console
+
+         $ bitbake-config-build enable-fragment core/yocto/sstate-mirror-cdn
 
        The hash equivalence server needs the websockets python module version 9.1
        or later. Debian GNU/Linux 12 (Bookworm) and later, Fedora, CentOS Stream

-- 
2.55.0


