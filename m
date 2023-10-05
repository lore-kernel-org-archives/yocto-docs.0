Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68391E93715
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:05:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.25926.1696536305437314719
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 13:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HGSvD7GH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA4101C0005;
	Thu,  5 Oct 2023 20:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696536304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OCJcfS/QQUUN3tBPM13p7JE+bNQuQ70K7+63p1dk6TU=;
	b=HGSvD7GH0HH3G0aLILwtcJYnvrJ/7Kq+cQt76vBBxo2LeI8OAhJczXdJ9RbIIOt9SUEBIw
	evp5cwO3EsDdPPGrmVHM5e8PleNfuSF4+GOTH5WNwQ0WmHSuSKulkFuWou2HFxnts6rzwE
	+WeOUNbLgwQKT1/IFIU2q4fNA9g31TxR5n8cbOSb0dmF3eztetAHvw7eiCEiXTPw9SF7U/
	pIZJtDyFQ9WAJtKLT8Xn1+h5d5gxf0sbBg6WbsZ1YI9mZ6UDlv8AL5J/g+ksGZUt8mdCR0
	S1dFAVRDfOdKTzi6DAZENajMR2/ILbV+xblHf79A8c+dgLQR+ENO+cidT5goPQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Roland Hieber <rhi@pengutronix.de>
Subject: [mickledore][PATCH 6/9] contributor-guide: recipe-style-guide: add section about CVE patches
Date: Thu,  5 Oct 2023 22:04:50 +0200
Message-Id: <20231005200453.2873299-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231005200453.2873299-1-michael.opdenacker@bootlin.com>
References: <20231005200453.2873299-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Oct 2023 20:05:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4324

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Roland Hieber <rhi@pengutronix.de>

This was previously included in the OpenEmbedded wiki page [1], but was
not ported along with the rest in commit 95c9a1e1e78bbfb82ade
(2023-09-12, Michael Opdenacker: "contributor-guide: recipe-style-guide:
add Upstream-Status").

  [1]: https://www.openembedded.org/index.php?title=Commit_Patch_Message_Guidelines&oldid=10935

Group the examples in their own sections (but name it differently from
any other section in this document so that sphinx doesn't generate a
warning about duplicate labels).

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../contributor-guide/recipe-style-guide.rst  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 7906e5e5d9..5cbcb23b3a 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -370,3 +370,28 @@ Here's a patch that has been backported from an upstream commit::
    include missing sys/file.h for LOCK_EX
 
    Upstream-Status: Backport [https://github.com/systemd/systemd/commit/ac8db36cbc26694ee94beecc8dca208ec4b5fd45]
+
+CVE patches
+===========
+
+In order to have a better control of vulnerabilities, patches that fix CVEs must
+contain a ``CVE:`` tag. This tag list all CVEs fixed by the patch. If more than
+one CVE is fixed, separate them using spaces.
+
+CVE Examples
+------------
+
+This should be the header of patch that fixes :cve:`2015-8370` in GRUB2::
+
+   grub2: Fix CVE-2015-8370
+
+   [No upstream tracking] -- https://bugzilla.redhat.com/show_bug.cgi?id=1286966
+
+   Back to 28; Grub2 Authentication
+
+   Two functions suffer from integer underflow fault; the grub_username_get() and grub_password_get()located in
+   grub-core/normal/auth.c and lib/crypto.c respectively. This can be exploited to obtain a Grub rescue shell.
+
+   Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/grub.git/commit/?id=451d80e52d851432e109771bb8febafca7a5f1f2]
+   CVE: CVE-2015-8370
+   Signed-off-by: Joe Developer <joe.developer@example.com>
-- 
2.34.1


