Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43353C46CCD
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:45:13 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.3214.1702935904559216567
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:45:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f29cQtz8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9183240004;
	Mon, 18 Dec 2023 21:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r2kJvZfNC4ekHelccAa/2EfLxkGfDU8zMW4dwHorr4M=;
	b=f29cQtz8t5gGVvRb20lbgJABoT2kIEnaaQKwn8ROjrcqZ8TqYnVRvOipJXG2ThuOAIHJNk
	AKXDALCZNvhzQpRNnGp/84n7QG9koSBUrMq5BszNUkKvh30XTg57kguCg1dPCp+jG1BEFd
	JtNW2DiCkEmsDTFLr3G+3vtbrKPhnZQNyS9LMNJ9UMb6ZW+x9Xmb/MEcQQRGAaaBhYUsN5
	mmao0oec1ddpo33RtohWHegj+6Iiu4Y0iJfqTzSqMG7EnAZ3Qi1ZYywp4qKUYtLhJttxdv
	PQtgIKmKWsgqp3m0qoePNFz5886OnxgP83wA8gEns4bKWc8jizDv7fsNfEqxbg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>
Subject: [kirkstone][PATCH 01/18] ref-manual: Fix reference to MIRRORS/PREMIRRORS defaults
Date: Mon, 18 Dec 2023 22:44:25 +0100
Message-Id: <20231218214442.147385-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
References: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:45:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4708

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Paul Barker <pbarker.renesas@gmail.com>

After the following meta-yocto commits, MIRRORS & PREMIRRORS are no
longer set in the poky distro config file:

  67b79df4fbff ("poky.conf: remove redundant MIRRORS")
  1b71a3b9418f ("poky: Drop PREMIRRORS entries for scms")

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e8028b328b..0a0b0ad37a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5028,9 +5028,8 @@ system and gives an overview of their function and contents.
       :term:`PREMIRRORS`, the upstream source, and then
       locations specified by :term:`MIRRORS` in that order.
 
-      Assuming your distribution (:term:`DISTRO`) is "poky",
-      the default value for :term:`MIRRORS` is defined in the
-      ``conf/distro/poky.conf`` file in the ``meta-poky`` Git repository.
+      The default value for :term:`MIRRORS` is defined in the
+      ``meta/classes-global/mirrors.bbclass`` file in the core metadata layer.
 
    :term:`MLPREFIX`
       Specifies a prefix has been added to :term:`PN` to create a
@@ -6248,9 +6247,8 @@ system and gives an overview of their function and contents.
       source, and then locations specified by
       :term:`MIRRORS` in that order.
 
-      Assuming your distribution (:term:`DISTRO`) is "poky",
-      the default value for :term:`PREMIRRORS` is defined in the
-      ``conf/distro/poky.conf`` file in the ``meta-poky`` Git repository.
+      The default value for :term:`PREMIRRORS` is defined in the
+      ``meta/classes-global/mirrors.bbclass`` file in the core metadata layer.
 
       Typically, you could add a specific server for the build system to
       attempt before any others by adding something like the following to
-- 
2.34.1


