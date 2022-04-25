Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC49C63715
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:15 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.32925.1650908013542269652
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Apr 2022 10:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HSW71Ruw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B4555240006;
	Mon, 25 Apr 2022 17:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650908011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EkOJMMEyoDs9HlmZuH8M6u8NhVGxpKgjxkxyI7mTxpg=;
	b=HSW71RuwG2kT9jqkXkNDxpc8S72NsElx+cpBZ3ng2Z9eMbijAQZFV1AGbD099FnK+Zt1+V
	33RdyMFdqveoqiioljaeu4pWpe+iL2TYMuqpNSXU4yfY+Y5t5P1hmqzYzsqMfk+a2WNLSF
	crI3VHit4za2P1cLGa9VgxN5zbI2ch2MUAHFkKp584YenEpI5BG9J4DvS13sAw9g/arE1S
	bHb/xlsgieC2+1YdqnHU4XyCfc+YVICkKSdJ7T57rIsK7EPPA6JlzGMLjMnPplGiC8ZRiz
	HvO7XSlwR/6uvIzE6IWKEO33tGqLp+CtyXddwkXMwpCkUul5Sgz9GtfCxnD7xw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: correct and improve descriptions of Autotools
Date: Mon, 25 Apr 2022 19:33:28 +0200
Message-Id: <20220425173328.114423-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Apr 2022 19:26:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2861

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 8 ++++----
 documentation/ref-manual/classes.rst       | 3 ++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 065d9586c6..adb738ccfc 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -109,10 +109,10 @@ Classes
 Class files (``.bbclass``) contain information that is useful to share
 between recipes files. An example is the
 :ref:`autotools <ref-classes-autotools>` class,
-which contains common settings for any application that Autotools uses.
-The ":ref:`ref-manual/classes:Classes`" chapter in the
-Yocto Project Reference Manual provides details about classes and how to
-use them.
+which contains common settings for any application that is built with
+the `GNU Autotools <https://en.wikipedia.org/wiki/GNU_Autotools>`__.
+The ":ref:`ref-manual/classes:Classes`" chapter in the Yocto Project
+Reference Manual provides details about classes and how to use them.
 
 Configurations
 --------------
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index a6dafe8f90..729aa259e0 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -78,7 +78,8 @@ about the variable flags (varflags) that help control archive creation.
 ``autotools*.bbclass``
 ======================
 
-The ``autotools*`` classes support Autotooled packages.
+The ``autotools*`` classes support packages built with the
+`GNU Autotools <https://en.wikipedia.org/wiki/GNU_Autotools>`__.
 
 The ``autoconf``, ``automake``, and ``libtool`` packages bring
 standardization. This class defines a set of tasks (e.g. ``configure``,
-- 
2.25.1


