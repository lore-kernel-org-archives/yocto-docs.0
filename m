Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EF9C25B79
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 13:56:51 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.16180.1716472603059737675
 for <docs@lists.yoctoproject.org>;
 Thu, 23 May 2024 06:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cE9GzDg6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 282D6C0005;
	Thu, 23 May 2024 13:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716472601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J5Ceqr4QHYZk7VZCHUZQWzmKla3OrhJCCgI9aKJtiWE=;
	b=cE9GzDg6cjp2mxrvadqKxFZRiQgI/fWfw6EdMpmsPKziV+c00v9v450YTc8d7W25uB3Ugi
	5uZP48TPo8Dp4APjvYzLCG/PhaIoq1DPEz86/pM6P51nuzs/PHO/N2kBHBY1vVavhXSlLC
	xP7I5/V5qjfkOYqQDgnusoTYfQp1qEvPi2t32xzBxy5dEFC7lshtyJS7ohhLDahswcDXJv
	LFucf/3MVw9ynKviIUwTPioSjgYhaXI62BP1N1TDSmhTjArz2i7lM3t1JIEn1mhXo8GLo5
	an8W+XhiKKEGDti+yHilNjGuoSG0F1Snk2CNywzKu90Bleaf1q3WtyGEl1X0gQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/3] ref-manual: introduce UNPACKDIR variable
Date: Thu, 23 May 2024 15:56:27 +0200
Message-Id: <20240523135628.3076018-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523135628.3076018-1-michael.opdenacker@bootlin.com>
References: <20240523135628.3076018-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 May 2024 13:56:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5244

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Note that this doesn't touch the "Source Fetching" section
in overview-manual/concepts.rst yet, as the unpack implementation
may not be finalized yet.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/tasks.rst     | 8 ++++----
 documentation/ref-manual/variables.rst | 5 +++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 2e4b23408d..70c0dea3bb 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -412,12 +412,12 @@ them. You can learn more by looking at the
 -------------
 
 Unpacks the source code into a working directory pointed to by
-``${``\ :term:`WORKDIR`\ ``}``. The :term:`S`
-variable also plays a role in where unpacked source files ultimately
-reside. For more information on how source files are unpacked, see the
+``${``\ :term:`UNPACKDIR`\ ``}``. Another, legacy way to specify
+this directory is through the :term:`S` and :term:`WORKDIR` variables.
+For more information on how source files are unpacked, see the
 ":ref:`overview-manual/concepts:source fetching`"
 section in the Yocto Project Overview and Concepts Manual and also see
-the :term:`WORKDIR` and :term:`S` variable descriptions.
+the :term:`UNPACKDIR`, :term:`WORKDIR` and :term:`S` variable descriptions.
 
 Manually Called Tasks
 =====================
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 546c674699..07b5b6f95c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9698,6 +9698,11 @@ system and gives an overview of their function and contents.
       :ref:`ref-classes-insane` class and is only enabled if the
       recipe inherits the :ref:`ref-classes-autotools` class.
 
+   :term:`UNPACKDIR`
+      This variable, used by the :ref:`ref-classes-base` class,
+      specifies where fetches sources should be unpacked by the
+      :ref:`ref-tasks-unpack` task.
+
    :term:`UPDATERCPN`
       For recipes inheriting the
       :ref:`ref-classes-update-rc.d` class, :term:`UPDATERCPN`
-- 
2.34.1


