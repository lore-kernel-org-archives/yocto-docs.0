Return-Path: <rhi@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFABCE79BB
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:07:06 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.34233.1695204416312614466
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 03:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rhi@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiu6f-0007b5-Pm; Wed, 20 Sep 2023 12:06:53 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiu6f-007erA-5S; Wed, 20 Sep 2023 12:06:53 +0200
Received: from rhi by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <rhi@pengutronix.de>)
	id 1qiu6f-004MIi-0J;
	Wed, 20 Sep 2023 12:06:53 +0200
From: Roland Hieber <rhi@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: yocto@pengutronix.de,
	Roland Hieber <rhi@pengutronix.de>
Subject: [PATCH 1/4] contributor-guide: recipe-style-guide: add section about CVE patches
Date: Wed, 20 Sep 2023 12:06:44 +0200
Message-Id: <20230920100647.1038583-1-rhi@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rhi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 10:07:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4265

This was previously included in the OpenEmbedded wiki page [1], but was
not ported along with the rest in commit 95c9a1e1e78bbfb82ade
(2023-09-12, Michael Opdenacker: "contributor-guide: recipe-style-guide:
add Upstream-Status").

  [1]: https://www.openembedded.org/index.php?title=Commit_Patch_Message_Guidelines&oldid=10935

Group the examples in their own sections.

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
This is basically v2 of "[PATCH] contributor-guide: add docs for
Upstream-Status patch headers", Message-Id:
<20230919111549.997443-2-rhi@pengutronix.de>
<https://lists.yoctoproject.org/g/docs/topic/resend_patch/101455254>
rebased onto master-next, but since it looks so different now I made a
new v1 patch out of it.

 .../contributor-guide/recipe-style-guide.rst  | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 99105179a6b9..52ab4523c49f 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -321,7 +321,17 @@ the status should be changed to ``Submitted [where]``, and an additional
 ``Signed-off-by:`` line should be added to the patch by the person claiming
 responsibility for upstreaming.
 
-For example, if the patch has been submitted upstream::
+CVE patches
+-----------
+
+In order to have a better control of vulnerabilities, patches that fix CVEs must
+contain a *"CVE:"* tag. This tag list all CVEs fixed by the patch. If more than
+one CVE is fixed, separate them using spaces.
+
+Examples
+--------
+
+Here's an example of a patch that has been submitted upstream::
 
    rpm: Adjusted the foo setting in bar
 
@@ -336,3 +346,18 @@ For example, if the patch has been submitted upstream::
 
 A future update can change the value to ``Accepted`` or ``Denied`` as
 appropriate.
+
+This should be the header of patch that fixes CVE-2015-8370 in GRUB2::
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
2.39.2


