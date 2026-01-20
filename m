Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321F0D2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 14:39:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7848.1768919966485592670
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 06:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GFV3OUaL;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CDC0E1A285C
	for <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 14:39:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3C42606AB;
	Tue, 20 Jan 2026 14:39:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 146DC10B6B310;
	Tue, 20 Jan 2026 15:39:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768919964; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ekDEJl9gazMGktPrcgJqrRkexL4jqW3Y01CvAR27RFU=;
	b=GFV3OUaLIDOV6+poZkff9zMIRfA3MklGYo6nSUlo5fdQ6GxMTi8P1JU4TEHvETeYa0Jwz2
	uotSE5XUOJj/H2bas6CxQ7kcZ/43YmWlBwnsRxBtAVTYwU9eL5TSxevQZddTbCJ52BgJRB
	iqL1T31eyIjHpH1NfYE8LFx/AtIJLeUWfAWMT/xTliehX+9D7FZTxVhEGQMhUStL/hqwN4
	yz2U2uXluInORsP4w4hF/2/tbb5XHvnhbOhMgpcJST5Xdzp+YY/f/HUmTAX8QEfk8yApV4
	RjJfR0Pf+uH0W4PvfVdqPkVIig77lIqUppi0fZsNHDxTebT/h1Y+6klhrP5V4g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 20 Jan 2026 15:39:15 +0100
Subject: [PATCH] dev-manual/packages.rst: pr server: fix and explain why
 r0.X increment on srcrev change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-pr-server-increment-details-v1-1-fa5d288def24@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJKTb2kC/yXMQQrCQAxG4auUrA2kUyniVcTFOP2rER1LMi1C6
 d0ddfkt3lvJYQqnY7OSYVHXV65odw2lW8xXsA7VFCT00gbhybgmC4w1J8MTufCAEvXh3MW4R5K
 xl+5A9TAZRn3/7qfz3z5f7kjlu6Rt+wBL0rPbfwAAAA==
X-Change-ID: 20260120-pr-server-increment-details-3aa4ec0f6038
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Robert Berger <pokylinux@reliableembeddedsystems.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3281;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wP7mcqwJOaosIYtzRF+TdJfSVYg+v6rzrhmI0+FHtlU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpb5OadfP/nLBymQ5YWWDWINUEH8EGTCvDPiHSO
 FNCTzPDqvaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaW+TmgAKCRDRgEFAKaOo
 NiOzD/0fSvrruindF0n229e6PllORs69rLhINXYRkQVjtVcQzo2R6u19XAVLMfBlcl8416q9711
 UnXdUYzKxUISdozsmJWpjn5DXrpv+sdUChOkj/9o4Wt6jsj1ASn8XMNW92VsRxnDJqn+znLL42+
 4IX3Qk6cQkdx6K7HvVUlHTp/E0qxVKb3OiP7XqQU7F0eBicXnRalXmFCjS7yydDSxIL4OeKf2bW
 wFar9SY+LiE4M7p7b9lHE+uoaCExpk9NExhu/yIT/mftCW9Zj7hxXzgAekU/OZRVLilrl3JFc19
 XF3OhGeNBVxV/QBXv2Pur2Zhfk0zd2SSPGKZFlrNvMRNNRCWYrgwSUnIEgA7oHaklSfjZ/BR6Ov
 GflW9kIpwJDO0USaxF2Kf2Ad62t53afmq2e1+y+BnZFwJFvYVlAaDhYh3Yst/oRaOG874uglX/f
 sBn08qir9TnCc3ztEa1eNuO39MzuSHv6gEifESosXKVsxJdsaWbjkqUfpifu1DC8/kQDu6MG2Zu
 cMEaEpdlNEDG+4PWbzXWansR1nND6I8QrLedosj2kEk2JXKD1ccCKdpBOQekaN05VJx/v17M5ke
 YXLYvR6eC6xSWNme67IkbvDKO/RfrBbNPSw164nsp8QyMRtg1U8HEK47dJMPYr+nVJLdpJyeY0r
 793uuBzjR4k4MIg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 14:39:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8592

The current example of the SRCREV change triggering a gitX bump is
wrong, as both gitX and r0.X get incremented.

Why this is happening is explained in bug 15729, which I copy here:

> +gitX+ is indeed related to changes in the source code.
>
> r0.X is bumped each time the checksum of the do_package task of the
> simple-hello-world-git recipe changes. This happens here:
> https://git.openembedded.org/openembedded-core/tree/meta/classes-global/package.bbclass?id=235e6d49e5888ad04416219e10b6df91a738661a#n306
>
> This line sets the value of PRAUTO and represents the number X found in
> r0.X. It will in the end make it into EXTENDPRAUTO, which itself makes
> to PKGR == r0.X.
>
> This line calls getPR(version, pkgarch, checksum). Between test case 5
> and 6, only the checksum changes. This checksum is the checksum of the
> do_package task (gotten from get_do_package_hash() above).
>
> Now, let's dump what changed with regards to this task between two
> consecutive runs, using the sigdata file in build/tmp/stamps/:
>
> ```
> [...]
> Variable fetcher_hashes_dummyfunc value changed from '2650ad6714c3f3248abfe9d3daf1196f307ed494' to '4af682a50174f5deb0397847da97d7cdba4ad067'
> ```
>
> The last line shows that the value of fetcher_hashes_dummyfunc changed
> from '2650ad6714c3f3248abfe9d3daf1196f307ed494' to
> '4af682a50174f5deb0397847da97d7cdba4ad067'. Those are the commit hashes
> in the git history of the simple-hello-world-git repository.
>
> Now you can see why this 0.X gets bumped, is because of the SRCREV change.

Fix the example, and detail what gets changed and why.

[YOCTO #15729]

Cc: Robert Berger <pokylinux@reliableembeddedsystems.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/packages.rst | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 8bd48c8e8..9c38bc39b 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -275,7 +275,20 @@ with a number. The number used depends on the state of the PR Service:
    .. code-block:: none
 
       hello-world-git_0.0+git0+b6558dd387-r0.0_armv7a-neon.ipk
-      hello-world-git_0.0+git1+dd2f5c3565-r0.0_armv7a-neon.ipk
+      hello-world-git_0.0+git1+dd2f5c3565-r0.1_armv7a-neon.ipk
+
+   Two numbers got incremented here:
+
+   -  ``gitX`` changed from ``git0`` to ``git1``. This is because there was a
+      change in the source code (``SRCREV``).
+
+   -  ``r0.X`` changed from ``r0.0`` to ``r0.1``. This is because there was a
+      change in the recipe, which ultimately the hash of the
+      :ref:`ref-tasks-package` task (the variable ``SRCREV`` changed value).
+
+      Anytime a recipe change triggers a change of the :ref:`ref-tasks-package`
+      task hash, this value is incremented. This means this value can be
+      incremented independently of ``gitX``.
 
 -  If PR Service is not enabled, the build system replaces the
    ``AUTOINC`` placeholder with zero (i.e. "0"). This results in

---
base-commit: b8a56b8b2e8c0417b2f7204f80c79b05d95e9ce4
change-id: 20260120-pr-server-increment-details-3aa4ec0f6038


