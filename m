Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E542CCD1A5
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:54:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.3666.1760604887417235643
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0QLh362h;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 20F211A1419
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EC8C16062C
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F7F2102F22DB;
	Thu, 16 Oct 2025 10:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604885; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G/T6LXhkZoGxDU+ud3BemX6Fm+VTgx7R8NEFHXeBOVI=;
	b=0QLh362hvuPtE5AAXzuWlmp43ScMgKnK2s0Cb/O1+cBmnrscmQzuyw6Xzco0xjI7hSQHQI
	6iSEp2SsyeWznhMRBY2nYlHkpDHdBNMqQT45ThR6IcVk2G3Y43LBrf0tVsZpyr1r2B+cna
	D2Wen8BRR5tf3dvPoB1m24dBBvvu/0BUktccyPezZTQN7n4NiLxeJu4of35WmFtu4+tajx
	VBvz5IwkkL0Y5s4d6zLj3Xoi0hLI2yT8jQ0yVkSiaVZacRrw3RQk8kXyKOMFStmBaT4P92
	SOpOEHZVXqvaGSdDKUu8IAiBYM5Djd73OIKRrF2R2RBzSE3ufPwJukvoYjR/bg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Oct 2025 10:53:55 +0200
Subject: [PATCH 05/17] ref-manual/classes,variables: document the
 CCACHE_DISABLE variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-release-note-5-3-second-hunk-v1-5-20f21db1f93c@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wjdta+Krui/0vZ/0/f5wZRWwYk76//zoEG5SR/ROTIM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo8LLPmkX0U5RhT60gRWSp4fQvlkopWEQaLx1gB
 NwdApHIQgGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPCyzwAKCRDRgEFAKaOo
 No1CEACxBHnLGpEuPgda4o/aXlkumN0RkVhfu6bN8gNplp6On9jhY3TmATpBNyDDSyzGqiupYhJ
 jBNjEHFVcfbN/md9XY92VhCQPTrKczZjJknzbNINmCHlU59PaHoJqmDdjjkFmrLVD4w4K1NyvK1
 Sx7ucnqDfWf2WkE/zD2IkyPjufpLWGWu5orpOX4aK3qwsgkif1NRPmcd1eJ5knwf7m9DUzou1bR
 gPLw3gVHQv9lxOCNrCWbUClY3/SK4idA8gvAxIxYBSu97cQ4gc/zY8ffuSbcpdEsqul99gv9454
 E16MVZNUNk/n0UplnCGjkPhMtzldaJP7uo31UY0p+lS3TeTJMrXHlGG13U+n9yCp4lmJBZz6F58
 186W160pp9cZ30lnojBGR3dmbQQj3c6/LoJAZjZ5JximBE0+DkxfZmhvOFRTTPxzbRsErzqqR1e
 lCN4Kge8rhYYLkLDq7fWtKZS4r03apI5H5hQ12CYmyz0SMrKdzqiUJ7shJ1xvJrIL07GW/cLU8J
 bgr+1nbXZmQPSNL4ehGWSKJ+e4YDFPfaAvr8ofpZRlqPGMS3i99/6PWlhIWnar1cVx9C/OICrSr
 q0T/SzPt4JpBgbMW5xfklR2PTVhmEF/eEWAiVqf6/9tFkIUwl34dizbg08SqHaQqDsfa72nHaiQ
 V99mewtZXBBdQ+w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7715

Can be used in recipes that want to explicitly skip Ccache support when
the ccache class is enabled.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 4 ++++
 documentation/ref-manual/variables.rst | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index f10903e74..68edbc9dd 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -401,6 +401,10 @@ instead::
    ASSUME_PROVIDED += "ccache-native"
    HOSTTOOLS += "ccache"
 
+Recipes can also explicitly disable Ccache support even when the
+:ref:`ref-classes-ccache` class is enabled, by setting the
+:term:`CCACHE_DISABLE` variable to "1".
+
 Using the :ref:`ref-classes-ccache` class can lead to unexpected side-effects.
 Using this class is not recommended.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 09ea71d2f..e6b3afbfa 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1526,6 +1526,11 @@ system and gives an overview of their function and contents.
    :term:`CC`
       The minimal command and arguments used to run the C compiler.
 
+   :term:`CCACHE_DISABLE`
+      When inheriting the :ref:`ref-classes-ccache` class, the
+      :term:`CCACHE_DISABLE` variable can be set to "1" in a recipe to disable
+      Ccache support. This is useful when the recipe is known to not support it.
+
    :term:`CCLD`
       The minimal command and arguments used to run the linker when the C
       compiler is being used as the linker.

-- 
2.51.0


