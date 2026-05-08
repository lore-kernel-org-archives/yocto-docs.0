Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3658CCD37B2
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 16:59:45 +0000 (UTC)
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1623.1778259581100461771
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 09:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=YTAwLkHY;
 spf=pass (domain: 0leil.net, ip: 185.125.25.9, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gBwMb66JnzDqS;
	Fri,  8 May 2026 18:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1778259579;
	bh=ckbpzxRWpOttaam7nTAGjBWO7bEBlSa3AK42IxkWaD0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YTAwLkHYqpb5dcmuwNoMqEyRpH8i7ZcM6uqmR4/u6GZeMpl2ViiQMvE48N0YoTS42
	 Nh28sgrhY1yVbLeZ18733ilWAh/zfQX8Wp5zH5MN2OwzO0L/Oax+Bt0ga7Ga7Z3Z3/
	 YLLGf1Afv3hiR2eomkHfULgui5Jo74+fVwiecMWO1Pa4vUbNpqhxuRcacrMZmyafk3
	 tXPecAvxJsJLZ5HfP/fXFZzqztYRa5t4XE6QIzezQex/VnPRxrB/G/OAYKamVOcs4x
	 PxtnWJ+70yMgdNun9FQ4GiPLoz9Vky3cogrb5F6orKGHn68vKPyiSM5wQf6fRd0IKg
	 RmFxh2IZ2DYag==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gBwMb3YsszmMV;
	Fri,  8 May 2026 18:59:39 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 08 May 2026 18:59:32 +0200
Subject: [PATCH 08/11] ref-manual: fix "include to" grammar for
 UKI_DEVICETREE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-misc-typo-20260508-v1-8-8fb61b5358cc@cherry.de>
References: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
In-Reply-To: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 May 2026 16:59:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9412

From: Quentin Schulz <quentin.schulz@cherry.de>

Fix grammar, we should say "include in smth" instead of "include to
smth".

Fixes: 542a5f454cee ("ref-manual/variables.rst: document the UKI_DEVICETREE variable")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/ref-manual/classes.rst   | 2 +-
 documentation/ref-manual/variables.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 5c7605b86..95e07f85a 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3542,7 +3542,7 @@ The variables used by this class are:
 -  :term:`UKI_SB_CERT`: optional UEFI secureboot certificate matching the
    private key
 -  :term:`UKI_SB_KEY`: optional UEFI secureboot private key to sign UKI with
--  :term:`UKI_DEVICETREE`: list of device tree blobs to include to the UKI
+-  :term:`UKI_DEVICETREE`: list of device tree blobs to include in the UKI
 
 For examples on how to use this class see oeqa selftest
 :oe_git:`meta/lib/oeqa/selftest/cases/uki.py
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index a8cbb87cf..45123488d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -11865,7 +11865,7 @@ system and gives an overview of their function and contents.
 
    :term:`UKI_DEVICETREE`
       When inheriting the :ref:`ref-classes-uki` class, the :term:`UKI_DEVICETREE`
-      variable holds the list of device tree blobs to include to the `Unified
+      variable holds the list of device tree blobs to include in the `Unified
       Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
 
    :term:`UKI_FILENAME`

-- 
2.54.0


