Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AFACD37B0
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 16:59:44 +0000 (UTC)
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1620.1778259579965083472
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 09:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=m17OpP5+;
 spf=pass (domain: 0leil.net, ip: 185.125.25.9, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gBwMZ1BlrzF2j;
	Fri,  8 May 2026 18:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1778259578;
	bh=IcMexBu059RHNvi7Dbk/PziYKKcaX3bkAM4y16Ambl8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m17OpP5+Cdfs+Ghcid913Pjo654PncDvASduOHnCYqLX1KRSS5Jo0N56wz00+XvfJ
	 Lh+henZqCAhzKKX++jm187sCeMAFcaFO5bC3nO0rSV68YYp5CdCuWs5W96y9vsmIG9
	 P0hJ6cfrb31PZfo/Le2zYKGRxGePjYEMSgeschNoEXlKXYMGx1W4msHQe33qnR+a88
	 /orYoTKTgzOwXX2dlI/hwDNOvatuZTq4Jttf06B7RfdErV3b2KzaopnBLAamnml6A8
	 r3EsCKO9K7+O0Jn5twJZWBWktR4DUpHbnavUt6PJtP4PWsdjPtBZ+BifqDqps/DLX4
	 HSijJTlAZ4Jsw==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gBwMY5q5LzlXq;
	Fri,  8 May 2026 18:59:37 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 08 May 2026 18:59:27 +0200
Subject: [PATCH 03/11] migration-guides: migration-6.0: reword meta-poky
 templates removal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-misc-typo-20260508-v1-3-8fb61b5358cc@cherry.de>
References: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
In-Reply-To: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 May 2026 16:59:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9407

From: Quentin Schulz <quentin.schulz@cherry.de>

"Duplicating themselves but mostly similar" is an oxymoron.

The second part of the diff fixes syntax by removing "there are" after
"between".

Fixes: 8a29e23d144e ("migration-guides: update 6.0 (Wrynose) release notes")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/migration-guides/migration-6.0.rst | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/documentation/migration-guides/migration-6.0.rst b/documentation/migration-guides/migration-6.0.rst
index 905d52fae..1c8e7e540 100644
--- a/documentation/migration-guides/migration-6.0.rst
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -177,11 +177,8 @@ The configuration templates located in ``meta-poky/conf/templates/default`` have
 been removed as they are now provided in a single location:
 :term:`OpenEmbedded-Core (OE-Core)` :oecore_path:`meta/conf/templates/default`.
 
-These files were duplicating themselves but were mostly similar.
-
 See commit :meta_yocto_rev:`ac300baea7314ea3c80f2330b2a993f729f32150` for more
-information on the differences there are between the two sets of default
-templates.
+information on the differences between the two sets of default templates.
 
 :ref:`ref-classes-native` and :ref:`ref-classes-cross` classes :term:`DEBUG_BUILD` change
 -----------------------------------------------------------------------------------------

-- 
2.54.0


