Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65330CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 10:14:26 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.12844.1758276859635437778
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 03:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dpJI103I;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D23F94E40D5B;
	Fri, 19 Sep 2025 10:14:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A95DF606A8;
	Fri, 19 Sep 2025 10:14:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 210ED102F183B;
	Fri, 19 Sep 2025 12:14:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758276857; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=mqQfu5/qysj/83aCNVV5yO6v/4RMwdvsOBGi/k4Yc+U=;
	b=dpJI103I+bgmccqrd+t8eI2dApXqW8xdsP1kpvupcdqCp4+j2hyr0PhGXhqdnroqOYPsaV
	AvlkLehTsXpjVQT5n5nXwBlhSvfxVlI4azr3JJnRD8vs20LDxGpfQ6JzzutzuStONFsXAG
	WG8SAzl422BMTzkaWmoLhM/BvSJsa90KL8p8vDa4i+vKoMCgwRfnOubKUd14EV7moJAkRL
	G34g7kba+Bn+TCODmvYRklqy4ONw75RLzLf2tjmwCrZuF3XvR4PKm46PpsNvmW6nkbv4Vv
	h6k4iQGh37GrRU/A9KYG/dTaCSW26W9dStuhMsDZKScbvNuRaeSVzvu4DVtOdQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Update yocto-check-layer documentation
Date: Fri, 19 Sep 2025 12:14:02 +0200
Message-Id: <20250919-update-compatible-doc-v1-0-f3a343914503@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoszWgC/yXMQQqDMBBA0avIrDtgBEV7ldLFJDPWEWtCEqUg3
 r2pXb7F/wckiSoJ7tUBUXZN6tcCc6vATbS+BJWLoambth7MgFtgyoLOvwNltYsge4dda1ispZ5
 HgtKGKKN+ru/j+Xfa7Cwu/2Zwnl8bNQ7PeQAAAA==
X-Change-ID: 20250919-update-compatible-doc-651debba8dfa
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Mark Hatle <mark.hatle@kernel.crashing.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=599;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=VPHPLz6f2ZfO9Lm0hFCXOKDOKAhjZi2y8WNgatEN1/c=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBozSzz5arJaoZCiDTdC6poDhv89iTOdl8AkNX9b
 +NWzUhEt4mJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaM0s8wAKCRDRgEFAKaOo
 NmPZD/9m2Ft+Y3lu7W/33DrY80L+htxQZm3EA5mpnm5xlC5uR+CODorcnorIYyGyIF8MeG60mkR
 dFqC6FGDGvN9t5sLLbtoVxWuVDhU6OQfU6ZbAkRRayU5AMr8cCbdrW9hs+i+/ktuZr3MTsfvByD
 VzL7W6kxlm7ryZpd9I6ffh4zhQZQdmlTV2sc4mKsWBDA/5uld96aBvo5jQWZsyGYnhi17S114Dp
 f1Ok5w13br7jMJCioKWvAT/5uAVCtq0mhBHufAbNmc/MztpJkRiH+WUsFPlvx3hw5KBomtTD1ZC
 NPE4O6QH2pgNXwNUYp+2A0XP8GHh8SYM8nsxCBkvcQMbKv6wl6UpwpjGaZZZAX5PlREGO08xLyX
 Hpar07/zcQ8cLVMfG6Icvw0f/jmEBnE0nAgenjqyffPdZTKWv2Zi7b4nWbrRPpEDqqK6raewo8w
 GQhmnXv+E5g75UYYUPi6Kwoo8xSugffbdP6cxJM6MtFHESBGP/z7Y0qI52/UZ21812zkNDzN0Bp
 xzqoVJj0ekr5+PZx1doWkIpVJbopd6hjqgV5F+GDL4a2isORGZh/EqsQZ5uhqd2wefCz6O9Qo4o
 jMcpgE83B7V/BV8ln0PfF+Oi7ySEOxGOv6hh6XX4KCCv3I6lyzhj2gtZG8VFfI2pJOqBnDFmF1n
 FXfv+GB2PI/kx+g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Sep 2025 10:14:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7555

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      dev-manual/layers.rst: yocto-check-layer: mention the --machines argument
      test-manual/yocto-project-compatible.rst: fix a typo

 documentation/dev-manual/layers.rst                    | 9 +++++++++
 documentation/test-manual/yocto-project-compatible.rst | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)
---
base-commit: e77139b5c616e6e5ad436eb91416fd804389425f
change-id: 20250919-update-compatible-doc-651debba8dfa

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


