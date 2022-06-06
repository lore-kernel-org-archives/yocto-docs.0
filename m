Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB8BC433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 14:47:35 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.32934.1654526846425097220
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Jun 2022 07:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=miRViv/Z;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5FDD7240009;
	Mon,  6 Jun 2022 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654526844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c18ORea7jCyeqJ6zajhxhDAVJ+eiVHCQuCCxqTti9eM=;
	b=miRViv/Z/amE393GYzgeRvCuM1BholO2/cAOnbOjdJwrJmf8UJwgL4Ld9z00Tvu95nY8yv
	eK4JKbGycw8hKVYBGzvquzFLTYJgJeCAPFJc6fEf+prqaeWSuRA7K1RS8UWNumxVUarD9y
	vXvzyjl6p6bgQdR3NZIGVEl9L1/dMBN53Ji0hk7/XfwqPNDdNa4QGEAgdPnidVLQB21mPO
	vOtAqu0PExKtT2Pq7ypXs/tAkWantCVWglY0EF5Dwf1wt5uCLBJuV0b0IsvShCMhh19tJf
	NWsJcOXF4UUjKh3falCjWmYw9q6rItkXqYyBxfMYyvIxbnQKvapjj30Imp6kjQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] docs: standards.md: add more rules: line wrapping and
 variables
Date: Mon,  6 Jun 2022 16:47:15 +0200
Message-Id: <20220606144715.46514-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16F60F397FB6BAC6.11448@lists.yoctoproject.org>
References: <16F60F397FB6BAC6.11448@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Jun 2022 14:47:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2961

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Fix Markdown syntax too

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/standards.md | 43 ++++++++++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/documentation/standards.md b/documentation/standards.md
index 81aff5f193..abdebc82bf 100644
--- a/documentation/standards.md
+++ b/documentation/standards.md
@@ -7,6 +7,29 @@ It is currently a work in progress.
 
 ## Text standards
 
+### Line wrapping
+
+Source code for the documentation shouldn't have lines
+wider than 80 characters. This makes patch lines more
+readable and code easier to quote in e-mail clients.
+
+If you have to include long commands or lines in configuration
+files, provided the syntax makes this possible, split them
+into multiple lines, using the ``\`` character.
+
+Here is an example:
+
+    $ scripts/install-buildtools \
+      --without-extended-buildtools \
+      --base-url https://downloads.yoctoproject.org/releases/yocto \
+      --release yocto-4.0.1 \
+      --installer-version 4.0.1
+
+Exceptions are granted for file contents whose lines
+cannot be split without infringing syntactic rules
+or reducing readability, as well as for command output
+which should be kept unmodified.
+
 ### Project names
 
 Project names should be capitalized in the same
@@ -23,13 +46,25 @@ in lower case:
 * When used in a cross-reference title. Such
   titles are usually in lower case.
 
-### File names
+### File, tool and command names
+
+File, tool and command names should be double tick-quoted.
+For example, ``` ``conf/local.conf`` ``` is preferred over
+`"conf/local.conf"`.
+
+### Variables
+
+Every variable should be mentioned with:
 
-File names should be quoted as in the below example:
+    :term:`VARIABLE`
 
-     ``conf/local.conf``
+This assumes that `VARIABLE` is described either
+in the Yocto Project documentation variable index (`ref-manual/variables.rst`)
+or in the BitBake User Manual
+(`doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst`)
 
-Using "conf/local/conf" would be wrong.
+If it is not described yet, the variable should be added to the
+glossary before or in the same patch it is used, so that `:term:` can be used.
 
 ## ReStructured Text Syntax standards
 
-- 
2.25.1


