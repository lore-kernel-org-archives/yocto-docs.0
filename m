Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CAED2F027
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:07:00 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10607.1769519218284143447
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 05:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pBg+oH0E;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9D4C84E422D2
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:06:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71D58606F5;
	Tue, 27 Jan 2026 13:06:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A32F2119A864C;
	Tue, 27 Jan 2026 14:06:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769519216; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yQ+MHCDe4B67jlm3lZWHsLYwajhh51AE2/9yjx3rELo=;
	b=pBg+oH0EOj1yi/tpNmYeiPTgyRTvvPTc7PY5773qRTIiccTmyZf393KY7qm+A/qbAoCzUY
	T2LVbxU+uht//qf8zxGaXIp8wWPz49SGMYErBU8/294chPCZQ0fQtl5Ik1x5at2bUyWkP7
	LRhXI2Yz2j/kf1aTxmTgHAKP+WhpxFxxoHWQkiGbTkXP8jNt5LMhRhLaU3wi84HtIzM5i0
	a/lmp7BBzM1z3wpf0BxeFToiQ6dGFsUWh0AAmchptMedp16i92YWYnfthjwW7+/wDiQ0q9
	w4oMv4H0dbH69V5X5qYA+T/qpCyUMpcxcnrnbmMt/8yWEYH7Ux0R59L2wSPeNw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 14:06:44 +0100
Subject: [PATCH v2 1/3] dev-manual/packages.rst: pr server: fix and explain
 why r0.X increments on SRCREV change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-pr-server-increment-details-v2-1-b46f91df002b@bootlin.com>
References: <20260127-pr-server-increment-details-v2-0-b46f91df002b@bootlin.com>
In-Reply-To: <20260127-pr-server-increment-details-v2-0-b46f91df002b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Robert Berger <pokylinux@reliableembeddedsystems.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3134;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=LmhdAlpuvNDvx9jXu9Zze6m9RccC+Sk13hol+pCEtzA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeLhtWuBkJ751U7AbojuFgFzhCwVKq4FO6sAFG
 7cpSZPBfIyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXi4bQAKCRDRgEFAKaOo
 Nj9KD/90dHVrzipsZXnhFWOF+GYf/AFgLE09p1er18+vw+NBIuKYbH3Zybkkd29RqFxUiKzrks8
 PBdBMSAo1eWemlkrp/LlI/LqvQBWT7zuc5XA91JbUr1nMw1SOqW9jqHWxTSXxWa15n9hZcxCQp0
 S90Ez4s9PTvkq53Is8ECO2lQ+nNGG/fTsBf868vAEQfD1kN5+2ccoMjjsdNprjb8ls5wl+ZH8Jc
 45gmusEie6QAB+Tup4gStQqopUshvok12p9FXQm+3Hj1sV86IG4JqY4QdSAlqe5/DRHGQp/AAyH
 kOtWML5UGqn+4T4bNOaEmcZRPEEyvJDAef0cJiMMKBcQOUB/IgkKXM7Y+FBikkDjxN8uZ/tNciv
 Qt2AIgCq2ZhIpSlS9ncC2mgRg8oIEspPst3G+SvOlEFDqDSkuDlSuz9tvgD+FjGaqJnXCuYzPqN
 ZYgVPrVJKMma8tl/nfLnM6QnyYZJQywXLGKbgUC3/U1ipNvJjIx/7sOk/5OswURqYPTLEMHa7zl
 JSLBBjQmclLrE2Bu2tMvWKvzY1Svtk5n1OoTPMq3ccLk4byho97gbvaqbh7THeDnHwBS7c84/n4
 NZur4vvnFV77WJHFElhSRbSyvO5ThrrYseNtksrF9oh8emTrMesCLCRW2J52FgLglP2Xk5B2LBQ
 ks1zAIQ5AjBTFnQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:07:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8733

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
 documentation/dev-manual/packages.rst | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 8bd48c8e8..86a569b67 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -275,7 +275,22 @@ with a number. The number used depends on the state of the PR Service:
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
+   -  ``r0.X`` changed from ``r0.0`` to ``r0.1``. This is because the hash of
+      the :ref:`ref-tasks-package` task changed.
+
+      The reason for this change can be many. To understand why the hash of the
+      :ref:`ref-tasks-package` task changed, you can run the following command:
+
+      .. code-block:: console
+
+         $ bitbake-diffsigs -t hello-world package
 
 -  If PR Service is not enabled, the build system replaces the
    ``AUTOINC`` placeholder with zero (i.e. "0"). This results in

-- 
2.52.0


