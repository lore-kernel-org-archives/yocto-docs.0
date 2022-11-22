Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6981C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 14:48:50 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.21128.1669128528911452437
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Nov 2022 06:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fW9TL652;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 954D7240007;
	Tue, 22 Nov 2022 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669128527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VLHYws0MzTAZzSAkMjTBNZkfzQsxbTzbTSrKcyTt2EI=;
	b=fW9TL652zeSm2puEvl4DsykujpKKhz6gLbxsrBLzAnFdz4PC3t7SEM5EzGK/4drc0RhNRG
	towGqS250APhFSuyGZHWx0J/+e6GBC9ukpSDjLbnsIJnNr0efIOFId88H/xs6D3tBh9ld1
	B6Hw158M2uQ5d0kTao4ZVPZtel0ZbQ1HV6XW2dnOogfCqX0VJwuW9er1dhvQmJIh6WcM4M
	VpFxSmU4cBzHTG/oaVbVMpWeT3OBQPJmLI/lLzkfwnZC2gVE9iMptgkRs4D3Kn1UfUa5QU
	puKM/Yg0kPktPKnvatvM6NJkoe8IC+d6Dyjq8vnXFWMvD7isRCrutzWnH1jrOg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: simplify .gitignore files
Date: Tue, 22 Nov 2022 15:48:43 +0100
Message-Id: <20221122144843.101203-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Nov 2022 14:48:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3499

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Remove obsolete and unnecessary ignores.
Just found one .pyc file in documentation/sphinx/__pycache__,
so ignored that directory.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .gitignore               | 41 ----------------------------------------
 documentation/.gitignore |  1 +
 2 files changed, 1 insertion(+), 41 deletions(-)
 delete mode 100644 .gitignore

diff --git a/.gitignore b/.gitignore
deleted file mode 100644
index 3f5dfa32e2..0000000000
--- a/.gitignore
+++ /dev/null
@@ -1,41 +0,0 @@
-*.pyc
-*.pyo
-*.orig
-*.rej
-*~
-documentation/toaster-manual/toaster-manual.html
-documentation/toaster-manual/toaster-manual.pdf
-documentation/toaster-manual/toaster-manual.tgz
-documentation/kernel-dev/kernel-dev.html
-documentation/kernel-dev/kernel-dev.pdf
-documentation/kernel-dev/kernel-dev.tgz
-documentation/profile-manual/profile-manual.html
-documentation/profile-manual/profile-manual.pdf
-documentation/profile-manual/profile-manual.tgz
-documentation/adt-manual/adt-manual.html
-documentation/adt-manual/adt-manual.pdf
-documentation/adt-manual/adt-manual.tgz
-documentation/dev-manual/dev-manual.html
-documentation/dev-manual/dev-manual.pdf
-documentation/dev-manual/dev-manual.tgz
-documentation/ref-manual/ref-manual.html
-documentation/ref-manual/ref-manual.pdf
-documentation/ref-manual/ref-manual.tgz
-documentation/bsp-guide/bsp-guide.html
-documentation/bsp-guide/bsp-guide.pdf
-documentation/bsp-guide/bsp-guide.tgz
-documentation/mega-manual/mega-manual.html
-documentation/mega-manual/mega-manual.tgz
-documentation/sdk-manual/sdk-manual.tgz
-documentation/sdk-manual/sdk-manual.html
-documentation/sdk-manual/sdk-manual.pdf
-documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.tgz
-documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.html
-documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.pdf
-documentation/overview-manual/overview-manual.tgz
-documentation/overview-manual/overview-manual.html
-documentation/overview-manual/overview-manual.pdf
-documentation/test-manual/test-manual.tgz
-documentation/test-manual/test-manual.html
-documentation/test-manual/test-manual.pdf
-
diff --git a/documentation/.gitignore b/documentation/.gitignore
index 4e077d03fb..494b4f4de5 100644
--- a/documentation/.gitignore
+++ b/documentation/.gitignore
@@ -1,3 +1,4 @@
+sphinx/__pycache__
 _build/
 Pipfile.lock
 poky.yaml
-- 
2.34.1


