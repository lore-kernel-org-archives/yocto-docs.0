Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D6CCA6CB6
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5817.1769501987792699467
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=e88KM4+S;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 44A264E422CB
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C6996071A
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B99E119A8682;
	Tue, 27 Jan 2026 09:19:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501985; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rvI6BtaTBCZI1m1AOSY0EeYyeY0GdopMJVz8co1Ba7s=;
	b=e88KM4+SDlwio7c3m585noYVd1WGMyIcpb+Di1zsn685MsCz4UT0dxij35HzN5etNLaKbX
	6vQ9EY/2iBzjF2XPvm6Gbov/E4HzCoqxM9Xfwcmfmc395aOUZYgcBRkzI8RTvpQl8cDbdj
	kqiXCCr/5ylujdz1kR+U1E7qHU46Yld+JvEeKZBHoAVZ9ImzVDe3a+Nyd7hlpElZF1YvjH
	eGrNOrHXQ1IM30MwyLxWs+Wi13sqBjnR73quuCQnHvYp4n+kj4rEjv1txznvklOkarC2CP
	tEECn2cp+XPXIfgvHZAReOwh6kNwW8YyB1H2CGlDf7UxGz4C1xcPKXs9mu6EeA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:30 +0100
Subject: [PATCH v2 35/56] dev-manual/build-quality.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-35-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=s7reeGxnHXNlGh8V+W9g0m1125ZGX7k8kjJ0HyWghns=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUD4Caf/7FzfeVRNUdvwb7C9+B3lh8MR0qef
 2vLy2Iz906JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AwAKCRDRgEFAKaOo
 NvQAD/9Jv/yG8WP2pCPjzhEIt2S1nXCvvtnyFF+SeyYrBpVriOhutKpCDZK0WDAduAXqLS4jhbp
 PyNPTB9QKA0AZWQhRYmp0HFdMvzytGtnsbtTU6pToj7G9gxjFAETdSxlYlfHHneVZmf9BgK00/r
 CSusn56T/wAmvAE4tjkLsnBsaQX/y0+AtAhVfwBy1XoZCoWZ/3WkEOIQZtGDiXfxnQ2s0FRiaCv
 1IvDHOPYMp2o4CQy1alb+OvB1OTWd+tKXutqThXJlA4cyWnjje5XM+Nnzc1n5qoqILzCkIWL524
 Ml3yCfpm88KVvIesIraDhWcF5RVgS/nSj9uQxAKdaCIzLChBpnXqWilmKJ/UH0ukzSM3sIs4btB
 xU5yXQ9oWl2UAqsdhLMEr1MC1wFS2ZfBkZ5xP7hn1Bi+vCyKoUQs01CiagRG9WiCFzEnTfqayrG
 YKruQeoIOYiZ0epkiJYGCHqk5/hfhq+hgtbnmHvp+RaCrIV6v+xLAb1YZtfgTi4PFODMcrDNwZj
 x+6Z0ay/bZGgBbovNtgFPQ7JzfvMYzQhDhTL+DpwO/KF8CNTcATty/ZxkJoCyOuMjh74T4XMTDe
 sazCTXCrvUHgxxfJdFFDBW55ZzEG2svWpZpxmBQufK6F4nsoCETJn4PsiE6U0AhL+4q8q4eebZW
 ptK0t0v04TA52uA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8696

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/build-quality.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/build-quality.rst b/documentation/dev-manual/build-quality.rst
index fbe5fb6f0..163d8832e 100644
--- a/documentation/dev-manual/build-quality.rst
+++ b/documentation/dev-manual/build-quality.rst
@@ -372,7 +372,7 @@ There is a command-line tool called ``buildhistory-diff``, though,
 that queries the Git repository and prints just the differences that
 might be significant in human-readable form. Here is an example::
 
-   $ poky/poky/scripts/buildhistory-diff . HEAD^
+   $ bitbake-builds/layers/openembedded-core/scripts/buildhistory-diff . HEAD^
    Changes to images/qemux86_64/glibc/core-image-minimal (files-in-image.txt):
       /etc/anotherpkg.conf was added
       /sbin/anotherpkg was added

-- 
2.52.0


