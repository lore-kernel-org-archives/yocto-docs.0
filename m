Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF7BD74EE7
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 14:58:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69575.1769180308173255136
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 06:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=i+Mt6vJG;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A84B24E4221C;
	Fri, 23 Jan 2026 14:58:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E1786070A;
	Fri, 23 Jan 2026 14:58:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9EB57119A8547;
	Fri, 23 Jan 2026 15:58:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769180306; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aUntCg+7DYzH5SkGo1H3mT/RtIgVyVxKixQ1aH5dd7Q=;
	b=i+Mt6vJGEL0t6HXxj4uIKOaLBFnHScrC3HgkkEODp6f0ecJgOOTnq0cM+iHdRNspAOw5Ic
	aTMP0jJYLTvyQCsS6eKGj0uRQ4E+W5FhSbKWq9ZrOiYh773HqGkEvTvJZSXgo/KXwcRxZK
	PBwqPINVLZvYSxsCh/YKnOFf3g+4f6KlkucexEfRAMWcnzrlhyPqJIqB1Ka1T5vHnjb7Sa
	ia7yaUnSovigDoRWPmLDoIKiegtD3XpSfaYRaCNW2erMaH7xGPn28Bn4XINe+3qgA3jETh
	1snKEPfXkofEtZ+wDvhp0Rru/GL795NJAFWe+fyIc+Dn4gOyAoMi3TUq/ddQ4g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 23 Jan 2026 15:58:15 +0100
Subject: [PATCH v3 5/5] ref-manual/terms.rst: refresh the OpenEmbedded
 build system definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-terms-refresh-v3-5-41c35f0a6a13@bootlin.com>
References: <20260123-terms-refresh-v3-0-41c35f0a6a13@bootlin.com>
In-Reply-To: <20260123-terms-refresh-v3-0-41c35f0a6a13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1567;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=HjO0dODpHfqUO5O9s4GdjPtuReYBNL2L3gLgkqMdRPM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpc4yMDnO52wayXsMaybfvWrh59tyB062GbGigx
 ZjScU7hxJCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXOMjAAKCRDRgEFAKaOo
 NuFrD/9Yyp75+3d3cYKFeeMFIJZZn880fcFIwggjZ0GGxQP9kXZtmCDNq40Dak2GoO1cpvJoN6w
 YbhIG/uERXThxqrzDjktrYU9FVlm0OhXWEXQVMiQcpRaTEdvoytT9MIr9tEEbhQsIYWXTLORYqd
 5PkKhCPkCKISIIZx/Z3Wko+RXymCmNhQLlQh26FeIZAeujfoOvTa6gLhx/Kgq3lm2lIYOtwrWnQ
 /c2fRyy6lOqUXGUD7b55dZTdFPiBZ7BXoR6lRs2RI28Ce2tYX3BBLdmQadfb7AGR33i2MYBxQOW
 j36BgOka9c0Guf+4dyDXqtkn5uYedJ7h50lAPvlnJeGOsxjEAdpdGAtzLI6d+nIEyEqDLzUJm7w
 HlqMhURZQIlWSWzCn4FiuHsn2EEYW8sYv43L/jQ3fMEHCkAuKU3w2mv75QWkB1z0gn199FQr/ph
 6losmSQb9azmnGx1WHLNJFfJueP1KaaVpXuLBlQtkjcDqQgv/H5Us1k2MIndMiQVY0gfgOsuyw0
 ALDJ8BIyRD467xfISMF95/Er/eVDoV9814h/mQeUmAfTDczMBsNKppiydkKx6e46LvJHtwnGv2m
 ol4EAxtl2uqCauhydKHs6fU5zgMUWzmkSiIMtzQi9xGc9u7TLbwVS3guL0tGptZRbv9ySqBjj0l
 fVlP4PIEGcjcTXA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Jan 2026 14:58:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8645

Remove the mention of Poky containing BitBake, just mention BitBake.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index d384b5bbe..e7b781d35 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -401,14 +401,11 @@ universal, the list includes them just in case:
       section for details.
 
    :term:`OpenEmbedded Build System`
-      The build system specific to the Yocto
-      Project. The OpenEmbedded build system is based on another project
-      known as "Poky", which uses :term:`BitBake` as the task
-      executor. Throughout the Yocto Project documentation set, the
-      OpenEmbedded build system is sometimes referred to simply as "the
-      build system". If other build systems, such as a host or target build
-      system are referenced, the documentation clearly states the
-      difference.
+      The build system used by the Yocto Project, using :term:`Bitbake` as the
+      task executor. Throughout the Yocto Project documentation, the
+      OpenEmbedded build system is sometimes referred to simply as "the build
+      system". If other build systems, such as a host or target build system are
+      referenced, the documentation clearly states the difference.
 
       .. note::
 

-- 
2.52.0


