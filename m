Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5036C5B555
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 15:02:02 +0000 (UTC)
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
 by mx.groups.io with SMTP id smtpd.web11.35684.1749222121933765381
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 08:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.168, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bDPfw3TrKzBbs;
	Fri,  6 Jun 2025 17:02:00 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bDPfv6TLwz5bN;
	Fri,  6 Jun 2025 17:01:59 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 06 Jun 2025 17:01:48 +0200
Subject: [PATCH 2/2] ref-manual: classes: nativesdk: move note to
 appropriate section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-native-options-v1-2-2ad99a184f90@cherry.de>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7024

From: Quentin Schulz <quentin.schulz@cherry.de>

The nativesdk- prefix to the recipe filename should only be used when
using the inherit method as the BBCLASSEXTEND method will do some magic
when generating the "implicit" name of the recipe.

This matches the instructions for the native class.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/ref-manual/classes.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index b5121aec0f28eaaee43db107977f45d43ee45801..da2bd028d8b96f27ca222fd72358ba0b64be5126 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2082,6 +2082,16 @@ couple different ways:
    inherit statement in the recipe after all other inherit statements so
    that the :ref:`ref-classes-nativesdk` class is inherited last.
 
+   .. note::
+
+      When creating a recipe, you must follow this naming convention::
+
+              nativesdk-myrecipe.bb
+
+
+      Not doing so can lead to subtle problems because there is code that
+      depends on the naming convention.
+
 -  Or, create a :ref:`ref-classes-nativesdk` variant of any target recipe (e.g.
    ``myrecipe.bb``) by adding the following to the recipe::
 
@@ -2092,16 +2102,6 @@ couple different ways:
    specify any functionality specific to the respective SDK machine or
    target case.
 
-.. note::
-
-   When creating a recipe, you must follow this naming convention::
-
-           nativesdk-myrecipe.bb
-
-
-   Not doing so can lead to subtle problems because there is code that
-   depends on the naming convention.
-
 Although applied differently, the :ref:`ref-classes-nativesdk` class is used with both
 methods. The advantage of the second method is that you do not need to
 have two separate recipes (assuming you need both) for the SDK machine

-- 
2.49.0


