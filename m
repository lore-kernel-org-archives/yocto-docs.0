Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F09C54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:29:42 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.52099.1711373374821391852
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 06:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IfZr9MEb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55FAF40004;
	Mon, 25 Mar 2024 13:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711373373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nEQh6ZQiSj81aC88Q/pZVh/CUwHNLwS9if6Qjepw4ys=;
	b=IfZr9MEb1Syx7f42c+u8b0+BpMQHRUyg7IQA6Xb5xgtamipjQqWTDn1+WFBxfpdOqiRi/X
	re1EJ21oDwWuxDS7Q+8LrV/3mDA6oO8XjiMZj2/GxGpCf/EDKlUb19bRumdG8r5aPfD6PN
	UCQz2oRH3K19eCVGtEjIoXSf0u1JBTJhYZitm2ylQPnrX+EAsbXUKrNscOw4lUxbIgTSeh
	2osfzVs2fgXMGy/ohJZUWMXaf6dzy/uWbwJoJZ1DqHReqpA/7QfseAbjuUXXXjPD9hYAI4
	XTF2Cov0K6LKSyKdyxfGiCHExABWft1D527B/HmmgHzNVzg247Sr9WWr6cEMFA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [nanbield][PATCH 11/11] dev-manual: improve descriptions of 'bitbake -S printdiff'
Date: Mon, 25 Mar 2024 14:29:26 +0100
Message-Id: <20240325132926.3018186-12-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325132926.3018186-1-michael.opdenacker@bootlin.com>
References: <20240325132926.3018186-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Mar 2024 13:29:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5019

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Try to particularly emphasize that it can be used to find
out why something rebuilds when it shouldn't.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/building.rst  |  7 +++----
 documentation/dev-manual/debugging.rst | 13 ++++++++++---
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 7fcac33b75..fe502690dd 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -775,10 +775,9 @@ your tunings to best consider build times and package feed maintenance.
       in the script for information on how to use the tool.
 
    -  *BitBake's "-S printdiff" Option:* Using this option causes
-      BitBake to try to establish the closest signature match it can
-      (e.g. in the shared state cache) and then run ``bitbake-diffsigs``
-      over the matches to determine the stamps and delta where these two
-      stamp trees diverge.
+      BitBake to try to establish the most recent signature match
+      (e.g. in the shared state cache) and then compare matched signatures
+      to determine the stamps and delta where these two stamp trees diverge.
 
 Building Software from an External Source
 =========================================
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 71b5807f5a..74f5772554 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -339,7 +339,10 @@ BitBake has determined by doing the following:
    :term:`BB_BASEHASH_IGNORE_VARS`
    information.
 
-There is also a ``bitbake-diffsigs`` command for comparing two
+Debugging signature construction and unexpected task executions
+===============================================================
+
+There is a ``bitbake-diffsigs`` command for comparing two
 ``siginfo`` or ``sigdata`` files. This command can be helpful when
 trying to figure out what changed between two versions of a task. If you
 call ``bitbake-diffsigs`` with just one file, the command behaves like
@@ -356,8 +359,12 @@ BitBake command-line options::
 .. note::
 
    Two common values for `SIGNATURE_HANDLER` are "none" and "printdiff", which
-   dump only the signature or compare the dumped signature with the cached one,
-   respectively.
+   dump only the signature or compare the dumped signature with the most recent one,
+   respectively. "printdiff" will try to establish the most recent
+   signature match (e.g. in the sstate cache) and then
+   compare the matched signatures to determine the stamps and delta
+   where these two stamp trees diverge. This can be used to determine why
+   tasks need to be re-run in situations where that is not expected.
 
 Using BitBake with either of these options causes BitBake to dump out
 ``sigdata`` files in the ``stamps`` directory for every task it would
-- 
2.34.1


