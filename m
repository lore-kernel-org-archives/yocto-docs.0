Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF4CD61033
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17105.1769700266020855043
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AYYn7P+6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7FE714E4231D;
	Thu, 29 Jan 2026 15:24:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 561FF606FD;
	Thu, 29 Jan 2026 15:24:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B17A3119A8872;
	Thu, 29 Jan 2026 16:24:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n5OaUNAOptAFyjAf6DfEXgFAFCGJ+n3HltCfdmRu0wY=;
	b=AYYn7P+6NMzf0lbcYWbv4lcVI6j8kZBi/WvVb0LFQ7Nv1RrYOdIqDJfoWa1v9rKVBb7+ua
	eneLt227BQyZ1vY/X+jz53yS3CkCn8uA9ZmAPkgsyVw75esLNXizzqBGy4+SJIHa4VQHqc
	v5DonMWM43OjkdkeFdJ6V+qhzpkzuKSlPCDDQpbE41guwTtNBUl46rDkjrSO8/QAj8gv6k
	CbD+hyE1CPKbirXTRostJwIS7sVBlTLnfgvGJ/4+gA1tUhAeTZi6BSRSwrX490OuQKRmXB
	4fG2LALiseeKiyU27h9ljo0CpUFS3nrQftg8XMrd4D//sctDTvNnTGuPGsMdrA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:21 +0100
Subject: [PATCH v3 30/57] sdk-manual/intro.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-30-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=bvQUyqXI+EleB0l1QIp4PFuuQhCJJ9um4ROetcHaQ/Q=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uNB4MNUDt4JyndMK+vJHszbBJlEp4rfm1pE
 Ro0DIeimSOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jQAKCRDRgEFAKaOo
 NtcDD/kBCOtyw2oCSUmq6PQm/f7sz0j8FoaQv6aD8SU+GK5zz4slYIiq9pVFofIHkimR2uM4aC2
 TGv4OMhpopWHGIdcoxJ7fTTpLLfb2YoTWkA3o/tUxhW3MDuHoqxDsXVFy7RY+Hn4Bi+dP43LoFy
 KQcUdE8EZ58032oQXs3bnv2NWNlBqWuf6vllVQrcWMxN514i731fH7w4WDs1RFGFhC4kROENHuR
 gGDK/p9CRNzanc7LpxZySsmc548U2gcNi156dfom/SWJOutROKSHb9jgcIYWUvgtYgszk4/dYvP
 pvNxAxvdpTZje3EKdE4FNnWUlzOby4imBx5s4TGZHJ/a2LBnKgX6xxby1nz594M4hCIJYyEjB4T
 5pc834NM2e9b0EM77fjECcFKV8VD+NMmnYkSfwRYGj6ABkqdZB4XRI99j+4g8PUM5b5g4Ye1JVx
 iEuEQXDhTQr68jLWbrMKjtdINcyRXXfbXm9xWIwug2+gmh7In1wCVampD2kbu+LmhzAQsNFQBVy
 yHJSvPbLttf6zf51MShAC0AaccNKz4n1HORKWNnrv3EIqU3++hmoAxmCrtSvLGm86aGi2syLtSB
 ZO5mBJQBNi3aEHS8cOgsajHZQIJbw49SmBW1EHCVRuUFL2aeaGLP7aZruenR4k1jkAN/6edgQDQ
 7JJ6wl7v8PRt55g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8816

Remove the mention of the Poky git repository. Refer to the existing
setup instructions.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sdk-manual/intro.rst | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index c96e58dd7..dd2902cc4 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -133,12 +133,8 @@ your application or image. QEMU is not part of the SDK but is
 automatically installed and available if you have done any one of
 the following:
 
--  cloned the ``poky`` Git repository to create a
-   :term:`Source Directory` and sourced the environment setup script.
-
--  downloaded a Yocto Project release and unpacked it to
-   create a Source Directory and sourced the environment setup
-   script.
+-  Setup your :term:`Build Host` as described in the :doc:`/dev-manual/start`
+   section of the Yocto Project Development Tasks Manual.
 
 -  installed the cross-toolchain tarball and
    sourced the toolchain's setup environment script.

-- 
2.52.0


