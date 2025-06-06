Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE41C61CE7
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 15:02:02 +0000 (UTC)
Received: from smtp-42ae.mail.infomaniak.ch (smtp-42ae.mail.infomaniak.ch [84.16.66.174])
 by mx.groups.io with SMTP id smtpd.web11.35683.1749222121284373370
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 08:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.174, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bDPfv6M6FzDqy;
	Fri,  6 Jun 2025 17:01:59 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bDPfv1wVyzgWy;
	Fri,  6 Jun 2025 17:01:59 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 06 Jun 2025 17:01:47 +0200
Subject: [PATCH 1/2] ref-manual: classes: reword to clarify that
 native/nativesdk options are exclusive
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-native-options-v1-1-2ad99a184f90@cherry.de>
References: <20250606-native-options-v1-0-2ad99a184f90@cherry.de>
In-Reply-To: <20250606-native-options-v1-0-2ad99a184f90@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Joseph Maniaci <joseph.maniaci@seagate.com>, 
 Ross Burton <ross.burton@arm.com>, Khem Raj <raj.khem@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 15:02:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7023

From: Quentin Schulz <quentin.schulz@cherry.de>

We explain how to create a native (nativesdk) recipe in two different
ways via a bullet list but reading quickly the instructions may mislead
one into doing both options whereas they are incompatible.

This rewords both the nativesdk and native sections so that the second
bullet point starts with an Or and explicit that this applies to target
recipes.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/ref-manual/classes.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 54a98bf24f3e75a20646a0daa87ce29c6df0e18c..b5121aec0f28eaaee43db107977f45d43ee45801 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2050,7 +2050,8 @@ a couple different ways:
       Not using this naming convention can lead to subtle problems
       caused by existing code that depends on that naming convention.
 
--  Create or modify a target recipe that contains the following::
+-  Or, create a :ref:`ref-classes-native` variant of any target recipe (e.g.
+   ``myrecipe.bb``) by adding the following to the recipe::
 
       BBCLASSEXTEND = "native"
 
@@ -2081,7 +2082,8 @@ couple different ways:
    inherit statement in the recipe after all other inherit statements so
    that the :ref:`ref-classes-nativesdk` class is inherited last.
 
--  Create a :ref:`ref-classes-nativesdk` variant of any recipe by adding the following::
+-  Or, create a :ref:`ref-classes-nativesdk` variant of any target recipe (e.g.
+   ``myrecipe.bb``) by adding the following to the recipe::
 
        BBCLASSEXTEND = "nativesdk"
 

-- 
2.49.0


