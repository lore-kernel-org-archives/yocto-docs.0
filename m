Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98D1CCD1AB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:20:38 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.4944.1761294034890054547
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ro620fOg;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0140E1A163B;
	Fri, 24 Oct 2025 08:20:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C568C60703;
	Fri, 24 Oct 2025 08:20:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D842A102F2483;
	Fri, 24 Oct 2025 10:20:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761294032; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2sfUfgcLNhOMZr/rCaq88id8Hld3Kcth6ZjWeTSVOi0=;
	b=ro620fOgKH0T1J8knxgrpwm58dUkURg3ePBcJWf5+7ex8ubbKrNr4hT92j1SJgi4wfb/Ho
	8uw/Aj5qpsF0/qODvB64Ap5U30NBiMp8K245nvIcvkG8jv8wPXvW6ZbApbSaWZNbGULFTk
	R4yRNlpHvuYxKOZP3WdtNB6PGsYXEPHmZ6VqmLLjtV4sfrO5uEYUYGnDp8rl9N/V29QPWF
	deW4nTdHw018UN2w/cPICsCwAzolvghjUearqoGHhuIx8sH0k6quIpA+ZHtuWDOl0vAaqG
	vjI67SQSm08cxOEOUAWH3MkpnLIlsEzVfYYM7Ig7Ry+GZgRQyeTYcci9kOewwQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Oct 2025 10:19:54 +0200
Subject: [PATCH v2 05/16] ref-manual/classes,variables: document the
 CCACHE_DISABLE variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-release-note-5-3-second-hunk-v2-5-d15dabc095d0@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1845;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=+sr2rL3YvagLESDy/UDy6zGfcE9JG6HBbJLoDhC8Q20=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+zbI7cpOHSK3oaWfTFbR37xXJoNW6emoVku6R
 V5K3HldSTmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPs2yAAKCRDRgEFAKaOo
 Nq2zD/9hct85ipTcHaviQuIkOgr155d6dSfIjypkw9bF6PQces9xsn2AN0vWI+F0BDkYhosKxzK
 6tToREmAzgCUrpIkKq0hVHXCLqr8N3Lag47tpY13R/Xvm0p3MJKcBCp80GLemySvCE8SyNZAdTz
 /dLlzZA421PZYLUeuwPncRCJ6kGTQXdPGya3YVabSgmAEeHW11Vc+9p6lgQiWKbfM2DlVjyP0hd
 Oy4tzE0BYoUThUo5MJ3JDdeSvxnkA7SsCOi0gTn8Et43vHdb7iI0eYxOQ/TNICWEoWduB3TY0EU
 jZ6lMmKrqQNEIMmX73/UGzKA0huwfN/KY3cJmlGapHJZ5k2Jj9WbzBSEKH00Ae0Lha6K6F63oAe
 gW7UYjG2ynjKWSAWdwvzCZH0L5tEtAAf5OWjlAJdvyDg8jz4AdOXy19RqVuJPjCZghDGOooJ5Y1
 Vg6VGQVxPSiphJEkGAVqepwnaxvRyzx12TOchZFH9t9lw7Wyh2g0FwBPIvfxKctrgL27iRXYmNG
 gJEmnZ3LXvbQcGsYVbUt+hLtXgL+GKGmjxPrqGehPqDX+XSKZb5ccnMBgv5QtTYa4fIZvjpWev4
 mEzYW3Oc71uw2Eob7H7tzZzFbtzFr6hWrQmphlifN3KAdQAtPUGPDTQYO/qhNcZREbH8bjfD8vN
 nH3g2Fov5ugQfDw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7795

Can be used in recipes that want to explicitly skip Ccache support when
the ccache class is enabled.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 4 ++++
 documentation/ref-manual/variables.rst | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 4372bbf06..34bc7fed8 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -401,6 +401,10 @@ recipes if the following configuration statements are provided from a
    ASSUME_PROVIDED += "ccache-native"
    HOSTTOOLS += "ccache"
 
+Recipes can also explicitly disable Ccache support even when the
+:ref:`ref-classes-ccache` class is enabled, by setting the
+:term:`CCACHE_DISABLE` variable to "1".
+
 Using the :ref:`ref-classes-ccache` class can lead to unexpected side-effects.
 Using this class is not recommended.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 3bc666674..63f29575b 100644
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


