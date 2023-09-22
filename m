Return-Path: <rhi@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDB4CD4F49
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 10:00:29 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.18256.1695376824332773609
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Sep 2023 03:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rhi@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1qjcxS-0001rL-7i; Fri, 22 Sep 2023 12:00:22 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1qjcxR-0088Jl-At; Fri, 22 Sep 2023 12:00:21 +0200
Received: from rhi by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <rhi@pengutronix.de>)
	id 1qjcxM-003Axf-0v;
	Fri, 22 Sep 2023 12:00:16 +0200
From: Roland Hieber <rhi@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: yocto@pengutronix.de,
	Roland Hieber <rhi@pengutronix.de>
Subject: [PATCH v2 2/5] contributor-guide: recipe-style-guide: add section about CVE patches
Date: Fri, 22 Sep 2023 12:00:03 +0200
Message-Id: <20230922100006.756477-2-rhi@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922100006.756477-1-rhi@pengutronix.de>
References: <20230922100006.756477-1-rhi@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rhi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Sep 2023 10:00:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4290

This was previously included in the OpenEmbedded wiki page [1], but was
not ported along with the rest in commit 95c9a1e1e78bbfb82ade
(2023-09-12, Michael Opdenacker: "contributor-guide: recipe-style-guide:
add Upstream-Status").

  [1]: https://www.openembedded.org/index.php?title=Commit_Patch_Message_Guidelines&oldid=10935

Group the examples in their own sections (but name it differently from
any other section in this document so that sphinx doesn't generate a
warning about duplicate labels).

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
PATCH v2:
 * reorder after the patch adding the general patch examples
 * put CVE examples into their own subsection
 * propagate CVE section one section level higher
 * use ``literal`` instead of *emphasized* formatting for CVE tag

PATCH v1: https://lore.kernel.org/yocto-docs/20230920100647.1038583-1-rhi@pengutronix.de/
---
 .../contributor-guide/recipe-style-guide.rst  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 0a2a3581a77e..b574e6cb53a1 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -355,3 +355,28 @@ Here's a patch that has been backported from an upstream commit::
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


