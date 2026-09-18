Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE263C982E2
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11768.1789739656949182185
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rAJpE1PH;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3D9561A0969
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C0DB60649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5641B10329026;
	Fri, 18 Sep 2026 15:54:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739654; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q6b0atxYQA7UXB6xBFhYyNu+uw2x6QB1u4WG0bZel+c=;
	b=rAJpE1PHxfDmooa6fNgTwax+cO8G7Xks2Jars7eJ7jCc9lvcj98ubYoujWmclMsOJPMyYJ
	1i2W7gcNCCGEg5Yitwuomlt89NJlJB9vynhp+dL/CbyEJcGuZPUzl2erEOI1nfOWJTip4n
	PWmJ0ZWEsYZ3AKOX+P151L2j5b9aHpdq+HPTvxnMa+aGTAUhqqJlL4UtIjP1PNAJNg6t/b
	dtsqLEiq6SnTtaeHQf4o6m1yhyb7hbIXw6mqO0rNsfnTwD+7QkaLbHVM2uddTSe1/vVzLk
	lmgrQdEnnkaIZu1V0TTlWixFEf2YfQlYHZ5YzvuTYOkrNjmFS4CjuiT7dqF9yA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:40 +0200
Subject: [PATCH 10/20] ref-manual/features.rst: add section for SDK
 features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-releases-notes-6-1-v1-10-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2702;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Vjcdm7r5JN9VnNA7B/gQK3Mnbxscy5RiZyUTwQd/dW4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJkBHMqivolBl3de5qjl50sejZ/UL1lDdFwK
 pnYv13dmAyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CZAAKCRDRgEFAKaOo
 NuAyD/9SxS3qcWs/a68M1z095sISDzi133OSZYe9/9fy2ScoamPOsPHmwxOGXK7OHbZ4Gm6sknV
 Oy5Q4Yt0PoVFFt4myHHufdX0MI6vfcybXURUjE5VwOiHa9/1TVIOXgo+DpqiaT0FXCB0tanS8bL
 9SmlPCNBPsrIq7mWb2QX5VYXSEa+Cn8dXKh52NGjaFEYy5lyoRYlCFZbMZ5WDS0BKLnD8J9AKPK
 fLb4Yd6gqZv2T5zidNXihgRSTn5MgHBGKqjM9JuEWjDvL6FVg5FI8d0iBjQJa61K/WDOCKtpXCW
 mXPzxbSMtqt3XvxTCGfqj63UWVAixAgLuvbd9N1FpOoyUt5X4WeJKewU3Hf2Fj8Z+gwmv1z1JDl
 0gtKqhJiN6keFsV5wGr77XkE50NEh/MN0YjMFT2sQ7dzcNwkfqUc7McW6+whka3y+6h/87nU33l
 M6V0l99KpcHBLM7om123DWF7xbUN/ELjaM63f35oRX9U/ePjSz7lGiQT+STCfjfRrOf5Sptl+tb
 z7MRkxfZXEfRB3aKmDQMunpICr4/y2P85EAV7lnSRTb8k/iV8tPzCG8VzRscXAXpLyPYM2uzSUu
 nUbzh6o9qfRegaIKBuysoHEOAIPEGRx1ybA3779NzmeJHLf72ZfjDaHGkJprYdtVKy/379eBopz
 btV9i9J4R710arQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10542

The SDK_FEATURES variable can contain features to enable for the
generated standard/extensible SDK. Document them and document the
SDK_FEATURES variable.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/features.rst  | 21 +++++++++++++++++++++
 documentation/ref-manual/variables.rst | 10 ++++++++++
 2 files changed, 31 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 879d98ca1..89143344a 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -423,6 +423,27 @@ these valid features is as follows:
 
 -  *x11-sato:* Installs the OpenedHand Sato environment.
 
+
+.. _ref-features-sdk:
+
+SDK Features
+============
+
+The contents of a :ref:`standard <sdk-manual/using:Using the Standard SDK>` or
+:ref:`extensible <sdk-manual/extensible:Using the extensible SDK>` SDK generated by
+the :term:`OpenEmbedded Build System` can be controlled by the
+:term:`SDK_FEATURES` variable that you typically configure in the image recipe
+for which the :ref:`ref-tasks-populate_sdk` or :ref:`ref-tasks-populate_sdk_ext`
+task is run.
+
+The SDK features available are:
+
+-  ``go``: add `Go` utilities for building `Go`-based applications.
+
+-  ``kernel-src``: adds the Linux kernel source tree to the SDK.
+
+-  ``rust``: add `Rust` utilities for building `Rust`-based applications.
+
 Default Features
 ================
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 2b2aa4df8..880bf9069 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8992,6 +8992,16 @@ system and gives an overview of their function and contents.
          :term:`SSTATE_MIRRORS` is set in the SDK's configuration to enable the
          artifacts to be fetched as needed.
 
+   :term:`SDK_FEATURES`
+      The :term:`SDK_FEATURES` variable defines the list of features to include
+      in a :ref:`standard SDK <sdk-manual/using:Using the Standard SDK>` or
+      :ref:`extensible SDK <sdk-manual/extensible:Using the extensible SDK>`,
+      resolved when running the :ref:`ref-tasks-populate_sdk` or
+      :ref:`ref-tasks-populate_sdk_ext` task. This variable is analogous to
+      :term:`IMAGE_FEATURES`, but for the SDK instead of the image.
+
+      For a full list of features, see the :ref:`ref-features-sdk` section.
+
    :term:`SDK_HOST_MANIFEST`
       The manifest file for the host part of the SDK. This file lists all
       the installed packages that make up the host part of the SDK. The

-- 
2.55.0


