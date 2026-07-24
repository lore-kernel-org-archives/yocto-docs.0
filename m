Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A56C53200
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 13:25:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19193.1784899513416184824
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jul 2026 06:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SnqVEQas;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BFE6C1A11EA
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DE8060395
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A392C11C124EF;
	Fri, 24 Jul 2026 15:25:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784899510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zEeAgJetQa20GMcmBlXEG1GSLTqWdBD/beLkNpHnipE=;
	b=SnqVEQas0T4fciisMIgqE0o+8vRtGtO7wxPFgYXU+JuAXmB/LwYf4a3WZBOfZ3UZwNiekC
	64Db2hNdwBVWNa9QG7SGg2WcjG0L/Qjd8ZhQAvjuPhxqZ9jMSPvKWMbIHK21x1Ji+fk6PL
	3Z1LB1pwPVghMmB1kQYnJGP+lDrs9uRQs8Izr15Ilu4Azdj3ImlELRr1jIDG+PRXrIR2Jp
	KThpY93mRC23SwbQhPNTySDr9d4HADsmB2sV4u+UdrHd0t/4uM67THRwBuYJxmfvEipJtG
	S95F9aXk1Unn4nVmwWLLYi9VXBFAOvktYUrh11oyKHJ0XCSXKh2LGb3e+3zfwQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Jul 2026 15:25:00 +0200
Subject: [PATCH 3/9] index.rst: move the "Overview and Concepts" manual in
 the "Introduction and Overview" section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rework-welcome-page-v1-3-491772cc4b65@bootlin.com>
References: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
In-Reply-To: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vigS+xfcMdKxdYE27TGio8ou22KqEv+LDMFbQczDax0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqY2exbc1JZRT5ElO5oLir/wFmscileMbEgzoA7
 Slf1ptbKQOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamNnsQAKCRDRgEFAKaOo
 Nk5GD/sHtNeXRpUn9Q9KqNVJtXLRA5HP2X5k3Ea1xCsMbdzlMPdAaKjIdl3M185+QsElNEYzLGV
 QL2kSy/kq3P7vOyee9dRfVlSCMUQ/Qws5Z0bZ14Xqtn8BQo6mIvqDfgJJwVm79jrX65F/rOXyhU
 SSOu+CJZtBafvNmJfwqbt+UtTyGc474WCdgFUrLFMAL0XzrkN45+KTVM9alWaOViHHDZXY2C8GD
 Nf81DlnpDORiIdZB8t49wLRgM2A126FDi5UeAmnjrBkPzKAQ3Zn1EcFw5x47kz4ka6q0DGJBgmP
 sih4P7PhCVRbgVPUMhO0AixiVEhnYu97B99gFxVjq3TdYfjoFNE+H/w7SBFxg77NrakXkGK2NAg
 kWtR3jxqlXFzNxWQDo1pZtyS1gLPVeVLGpJpf/34lNeYgptQtXtVzKJLDtckggigdH1tF4heX3p
 cNDRjyA7WluytDNfp7W7tDG5lDCJzJvr6fNuSgHXO0a0aKGhxkJR8mI4+IJQi7VVe+/PfvAOzRz
 A2JBsnBJzO/0LlaV7KdWAiRcGDQlC0IIYQx/7SqnAPThEGh3rht4RowQyw8H7VseXoItbpB4a5i
 lDvT+Fcjw8zsTE0N9mMebRY9ESydpNVnDaN81+uGBuC0mJpeiuVCZM/GlH4wBU3e25djbfzwUS7
 gG7cA7G3aKXnu8Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10131

The Overview and Concepts manual contains introductory content which
feels like it should rather be in the first section of the welcome page,
rather than the "Manuals" section. Moreover, this section does not feel
like a manual either, so rename the section title to "Overview and
Concepts". Keep the "-manual" suffix to the directory name to avoid
breaking links, though.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/index.rst | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/documentation/index.rst b/documentation/index.rst
index 9a5a83811..b7c04a581 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -29,6 +29,13 @@ Get started using the Yocto Project.
    Yocto Project Technical Overview <https://www.yoctoproject.org/development/technical-overview/>
    Tips and Tricks Wiki <https://wiki.yoctoproject.org/wiki/TipsAndTricks>
 
+Get familiar with the development environment and concepts of the Yocto Project.
+
+.. toctree::
+   :maxdepth: 2
+
+   Overview and Concepts <overview-manual/index>
+
 Contributing to the Yocto Project
 =================================
 
@@ -51,7 +58,6 @@ infrastructure.
    :maxdepth: 1
    :caption: Manuals
 
-   Overview and Concepts Manual <overview-manual/index>
    Reference Manual <ref-manual/index>
    Board Support Package (BSP) Developer's guide <bsp-guide/index>
    Development Tasks Manual <dev-manual/index>

-- 
2.55.0


