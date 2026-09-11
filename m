Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B481AC88E5A
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:56:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41377.1789138588821951144
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 07:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=O4En96aF;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0791FC63A0F
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:57:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38DDA601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7287811C7AFAC;
	Fri, 11 Sep 2026 16:56:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789138586; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LLu6zTfzTRvbsamyKkWAodzb6pLAFA8LKTXDWAay9+s=;
	b=O4En96aF8izUFSO0LFk60Z2SZcnMjNroYPJKXk/4t4ZAopK36Bjfal86uwvZOEtBtx3pZm
	EQ3zT4shDG9oDmhLZItguI8oIu8FZdYMYCDdb/ZklYywD9yMwBK0UHQ8HEWa0ekrxg8CGU
	6A9zfYcjl/JjnJkIATTiamTRqvXwUtBXElEROiE1M+jABud3EWbYKaMa021rpHdsgtzWUr
	cbCGpjm6CXyTB5UsBsNXsldJ4l4mAU1fyR+d/YULO0Tw8xsWH8v4Ph0r76oVSnS7hqQ0LX
	HAiYMBfhgj1tupCg4xG0ZL11s4Emjxv+hxEx7liub7lQ8FZ4gKmQzwSmYQ8zEw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 16:56:04 +0200
Subject: [PATCH 04/10] ref-manual/varlocality.rst: mention built-in
 fragments for distro/machine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-assorted-fixes-v1-4-0d92a8112918@bootlin.com>
References: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
In-Reply-To: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=965;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=hS/M5ho6bKL01avlkk1DMt9h9m46JmVLHC126p1rVII=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBaVk6/3CLCjtNhgHhDBBT1xuB2EVpE39Bm8Z
 dsnpF9FSyGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQWlQAKCRDRgEFAKaOo
 NqSkD/43dPk2h2SjH4DjqJAq1wBklPe8yhOVWOfFBc6D8bB6phHd9xoT0yvMCdw4lVuotdgR9T8
 AGVMWkLbXi9RPabzmCCC4RA7dccmg1kbtENCpKZobYlU1oBgwyTarHeT2FoVGG4emXsLhyEPXRV
 kY8/RVTwcFrksAfJHGR4DLsuEa1H0S2tfF9myq5vvXFvvxi9jHJSK68qadCsLK+sZn/BbJ71X+3
 4FJtXtrPnhZ1TAPShWkjaOTvdwP/yprQP6SK757xMrXZeZUdnz4indydvXUgt4DvamciW+3vlfm
 cXTEZw5HPqOKP7CcgmDg05j4Ikm3KYDT6SLEAxnvnRMawvGOYBl4mcJI8cApFJWFuf97t1uXvSU
 txlXeK6Hv/5z0hXCcj4XADBNurjMvckBQkoWarcGM8BhmzSw0Qzu2CaxDttJGy+4wJYxp8p6Zxl
 sS6xHpQfjqJp6OVrTw46NuQxCkOj5bdW+FRhPaMCCZTDB4EEjUoaXCJWBEHJxA4eqAqEFaNsWqB
 BIPXaSqkrkasCWjW3LA322qk6zbi+dLUF9RRXvRPnayXOZ/g5MI5vwcICe7YTywfj24WlxlKMC7
 8wvuJgJeBNQlJzkoL5Q34j2suIdr/jaZky02lJhC0bSB/bKtWuh8ncWmWxisngK3fQjs44Z8z8n
 4bbBAPQVcJ3R9Cg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10458

Those two variables can clash with the machine and distro built-in
fragments. Mention it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/varlocality.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/varlocality.rst b/documentation/ref-manual/varlocality.rst
index e2c086ffa..706ed40ab 100644
--- a/documentation/ref-manual/varlocality.rst
+++ b/documentation/ref-manual/varlocality.rst
@@ -76,9 +76,11 @@ Local
 This section lists variables whose configuration context is the local
 configuration through the ``local.conf`` file.
 
--  :term:`DISTRO`
+-  :term:`DISTRO` (can also be set by the :ref:`ref-fragments-builtin-core-distro`
+   :term:`built-in fragment`)
 
--  :term:`MACHINE`
+-  :term:`MACHINE` (can also be set by the :ref:`ref-fragments-builtin-core-machine`
+   :term:`built-in fragment`)
 
 -  :term:`DL_DIR`
 

-- 
2.55.0


