Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF08CCF9EF
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:44:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.31562.1761569069438751042
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 05:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cGbpIQG8;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 48517C0C43D
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7677F6062C;
	Mon, 27 Oct 2025 12:44:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6CBCB102F2500;
	Mon, 27 Oct 2025 13:44:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761569066; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VT7xiw+gE8JqF315d6QSfLse5UX1WoIOXif/66E9lqI=;
	b=cGbpIQG8QyJbFy2T8GdM+OaxWJfcql8q86owb+8524qrINQHcZ9939YHqCn4Ffwg/5zSAa
	0BvnjYq5PJJ7YKJ12HpglV/N8l6Uzka/b5qMylMkZvV0is7p/xlVLkwWZ2RwmcjHdmRWIG
	+V9daXQR/ITYKQXOHi0ND6EVqDBPx/XMlk9A7GjQHZLqKCqsUKj3lBfPFFLuMfEihHip4O
	nFip19x/+gMuD3jSfX7bBXAYsuKTOMdF56QkT4itevfthkPzJh3ib4d/St4iyS5yHLS3xH
	qo4qGVHjXBnAIrHuoZT+cxtbsR85oNJJpw1+xmADZU0tXewfjoxjoIQW+FHFFw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Oct 2025 13:43:37 +0100
Subject: [PATCH v3 05/16] ref-manual/classes,variables: document the
 CCACHE_DISABLE variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-release-note-5-3-second-hunk-v3-5-07d36e2380b8@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1837;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ePbeZs5i6m7RB5hg5zHVY0qcHS8CpkVSIdUER7YjGFU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo/2kFbvObZevdgeDYt5ljZecUl2BsfVGZmNMAb
 hj7Bk9zTPmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaP9pBQAKCRDRgEFAKaOo
 Nif3EACManfjRQS/0CqZAVw7iDc8QkKCYFCJEyTz0xNj81U39BWtJmEOwleDx7OiBsDJq40Jvao
 ocRFrlCQkpB7yyigM4q3cNk71jTbuGej81OHpzpYafktAukE7+uMPO4ei22NA9JLSBeR11lycDh
 y9P0Uss1PRig6U0424CoiwPPbZsSGdipkcGOjvYsraSD5Fd9mi9xFAhrj+Pbgc3ncD3dicw96aw
 IelZYs7l7mvFmxNCzfIZX14Q1Aax/qzpaOIxMtDxd2xA32OBgzpOfJY8/Au2XsUAB/w4JxB1pBT
 EBoF8qEvMC2oittN8cMvkYPNEyZxgFuPQjRSeVGdzYl8doYkLHeIx7ax+rTd/6KEzP/tjmxSgel
 bk6+1RrP3+82ZYPKjIvBBJRIVIgfRNlzJkSRdjxf16cCJqoG+FRBA+qfZRd/TMkhKf4+CgubB7U
 6EGjAGcJVYTqr+bWxsisBSY4rQ4bfPDaZv5oOzZPXp1/o30mXFgBlTRnlnAuGFbISAk6MZOss6m
 zhM7Afa19LypZvpP845fpcCaHLoSTK/Wk7dNoXhbNASz+PTyJN9PJ+jvpg9kHQxgkAbx1cZcHVM
 tk72j5PlRXxXnI6s9SradLs6JzM2aITKGQ8xR1qwVnyFa2QSj7GFnF5TtEubNg6Q3n6QEkhFPYb
 5HQjLD+0EqTf+sQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7854

Can be used in recipes that want to explicitly skip Ccache support when
the ccache class is enabled.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 4 ++++
 documentation/ref-manual/variables.rst | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 4d0882401..4e5083a79 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -399,6 +399,10 @@ statements are provided in a :term:`configuration file`::
    ASSUME_PROVIDED += "ccache-native"
    HOSTTOOLS += "ccache"
 
+Recipes can also explicitly disable `Ccache` support even when the
+:ref:`ref-classes-ccache` class is enabled, by setting the
+:term:`CCACHE_DISABLE` variable to "1".
+
 Using the :ref:`ref-classes-ccache` class can lead to unexpected side-effects.
 Using this class is not recommended.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1c4689343..a79d60edc 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1526,6 +1526,11 @@ system and gives an overview of their function and contents.
    :term:`CC`
       The minimal command and arguments used to run the C compiler.
 
+   :term:`CCACHE_DISABLE`
+      When inheriting the :ref:`ref-classes-ccache` class, the
+      :term:`CCACHE_DISABLE` variable can be set to "1" in a recipe to disable
+      `Ccache` support. This is useful when the recipe is known to not support it.
+
    :term:`CCLD`
       The minimal command and arguments used to run the linker when the C
       compiler is being used as the linker.

-- 
2.51.0


