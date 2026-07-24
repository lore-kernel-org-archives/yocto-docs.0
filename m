Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592B3C531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 13:25:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19149.1784899514045686553
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jul 2026 06:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=eRmGsjgv;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6BFA51A11EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41AF160395
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 601EC11C124E7;
	Fri, 24 Jul 2026 15:25:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784899511; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v7/L13ukCX3OP4QsYvVhNvfEPKLFaq9M5e4cfWKpbyQ=;
	b=eRmGsjgvnekoOT4Y1SL1lPQIG+c/HTfwYkSVgGaaId/ylQY4i110V4a1DhDmI8AkzoOd1c
	z6ugeWogbE9uR1XGKDRijoxyvJghwp8+2+EKEzT+2jHhPYAoHo0eA4qYSnjGF6dNeJoL87
	JcroV7lP8As2dYIMS+dLNXUjQ8LzqCorJsBYRUhvgFC+d3GhbC26xCmHa+u3j/iYy4t1+D
	6Co9C/HIcM3CkY8FGtfPkshq7cNF4Z48EgNHErf0L+MomPKEJ5MRkfnB3p4OgVA/Rm/nq4
	optVpLGf/sObhUyaFnwgtg0MsAItC9T2ImEmB7JxGeQvSf6g4KhTwGoc8duMxg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Jul 2026 15:25:01 +0200
Subject: [PATCH 4/9] index.rst: move external links to the bottom of the
 intro section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rework-welcome-page-v1-4-491772cc4b65@bootlin.com>
References: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
In-Reply-To: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1844;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=J7wsc7/YhnemzQzD1+MwnV/gxHK7FC/858oGJph6EWI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqY2ey9mo3BroaJd8+o/F4Mns/fMJ14EATT5qTd
 ubKwoQrBPyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamNnsgAKCRDRgEFAKaOo
 NtcyEAC7zBtQx4cg2tM0x3IKifKEHmqCqzmM8JjYqEcg0gFGzzqtPhi9c/mqQsqjXZuuPRXO/gg
 DEUrfPzT1nEhJgOol9mCbr8ld7pKUNRTDzllsOHIYmwi2KGmzrgDiSz2jR9NLSvg7kOqppCVUu5
 sFrwPGxJhv/gIQ+FW4H0b1EKeixTjdg2ne/aueIpoeyKcon7E8yzUPKSn6Yb5wts9UEjjzF2tnS
 FAO9X1LueZKGyzg7uNudbfokBnb9XnHcVsCeEa2cWqI38VbksKzGKj5HuV/cA4RtrnmMhOnyIhE
 Mg74RGbx1tLy2XvcGo3W5jHIu/+eI302DlQuOxv8xmNkSChOHm4RRgFtwwDz6bJZGh/SMGDx8N+
 WljTYxd0qBefb+pCYLeqSnpSOyn33jK6fCihbShVBImSNaPwtaq6ukxglO3MFp2k9YPL5fCUfVH
 1LRcn4BcreTnMZ8Bgzog9sAxhtY9MRM4t20Wy4X5GnB1xhk9JkW/TnbBw+2Cd6ZZjKpQ3lIvn8b
 YFg34qV+o2uhfC53M04Q01kl4k7MJWuezdAtPOFhHcedxmGr0BHSlln1/EUMW9EijMH5ycoftaL
 0tBqMd4CGBOdcxG4QRo5lRJnM5I72jD8Obsg0aLgyJz9YfFLMc6WynMUmYfI6gwhjB9gXlhLlBJ
 9C7gvKfjHG0FKfQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10132

These two links contain more introductory resources to the project and
are external to yocto-docs, but currently break the flow of the
introduction:

- The "Yocto Project Technical Overview" from https://www.yoctoproject.org
  is essentially the same as our "Introducing the Yocto Project" section
  of the Overview and Concepts manual but with less details.

- The Tips and Tricks wiki page contains a lot of old and obsolete
  information, and the wiki is bound to be deprecated at some point.

Additionally, hide them from the sidebar by not including them in a
toctree.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/index.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/documentation/index.rst b/documentation/index.rst
index b7c04a581..4cc9d4582 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -26,8 +26,6 @@ Get started using the Yocto Project.
    Quick Build <brief-yoctoprojectqs/index>
    what-i-wish-id-known
    transitioning-to-a-custom-environment
-   Yocto Project Technical Overview <https://www.yoctoproject.org/development/technical-overview/>
-   Tips and Tricks Wiki <https://wiki.yoctoproject.org/wiki/TipsAndTricks>
 
 Get familiar with the development environment and concepts of the Yocto Project.
 
@@ -36,6 +34,11 @@ Get familiar with the development environment and concepts of the Yocto Project.
 
    Overview and Concepts <overview-manual/index>
 
+Additional introductory resources.
+
+-  `Technical Overview (external website) <https://www.yoctoproject.org/development/technical-overview/>`__
+-  `Tips and Tricks Wiki (external website) <https://wiki.yoctoproject.org/wiki/TipsAndTricks>`__
+
 Contributing to the Yocto Project
 =================================
 

-- 
2.55.0


