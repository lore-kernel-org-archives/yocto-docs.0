Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF1EC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 14:47:23 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.607.1783694834425381815
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 07:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0GMOpVHe;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 867BC1A0F45
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B2E260342
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2CD711BD174E;
	Fri, 10 Jul 2026 16:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783694831; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GGhfWBXpMNr6MoUg3lir29/bQH3dHKNG+iEZVYrW/JA=;
	b=0GMOpVHe0NOjOcdro3rMHMDNnBfojmqFdZ6qzVz1JweoCPuu1teZDAWvxlUDHWMlDD/ooE
	gLLMexHl4i++HzLnJwW5MTEtAH47NS/VjdmbOhcEjDmM4wxS9rdpkM2iW0lVpCisJ/6Ynf
	Z5+Ga5/KfbFxfTNt3VC/DpdHrQp36gLvY9QYDSs3YggYB/AI9MxEDS1dqYzfC4SyplicHR
	ITzAmyFv7ipGfe2qgw0VJjXGbeVmOTJ450uBYBZgi+a7gp26cFMIDNAE4Y000L7uVlc40p
	pKSfhm50Lc4fop//9JbSe+DdcbYuETqkJRCiC9PalWu7Lbio0pSIWB8glKUOdw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Jul 2026 16:46:52 +0200
Subject: [PATCH 5/8] ref-manual/classes.rst: replace obsolete mailing list
 thread
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-linkcheck-v1-5-999168371d5e@bootlin.com>
References: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
In-Reply-To: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=lGmD31tUiyYWixnPE93BTpO6oqYAFHS/uLQkndAB+CM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqUQXrRrWpX9iWIsvbco1pS3HtaIfKAj4qmZPkH
 lpMWDKHy5+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCalEF6wAKCRDRgEFAKaOo
 NtvmD/9mhTi1bxRPKTOtvlQQSgrACoRJLR1AQFnmEEclgsFVEmLwaTdt9JlxBwwYBFi8VeCeYsS
 WrXB6Az+eFFiAAt+VeBbtzcnr05/mY24CQYoDggDnheacWCuWYTVMdsyhf7VlLRRY6vmK7+CaFz
 w6th6J7empDtIQknef/txI1g8Mv/0GjlJkp1FI2FKNpydXFLjZbg3YQKKD0bgi8Y6E5Qq8ii+G2
 Wt7wCOWD0mk9YlsOXKvNv6yyjQgk2fdn3xLH0rcrmQYMx6cSzjO8LwOtk22uw3U2v9cpyzioYU8
 211jI3IOIZvVWx7mKX5VfcmQbtZrgqKR+cW7DGjvC15t0ZY8pbt/zERuED0GuSRk1vKbHHoxbBh
 y2qA/xK4Pg94K4yEWcvDFafyaWB9YJRS1vcaClnfP0qFr4B6aChFdbpUA1CXJPq0+fGtXgM2l6u
 rE0mVh92bv/c2g0cujW+nmoC9ANPIsc3pOsezNC9VvS4XiKKU1q567++Eoy+324YADp6t45FFYz
 sZnVdzSNhDl/u07euFlUBjucfop8R0FiTuUAdN6WMcd+XezuaoxIb9E3N1qxJVuZB0jmyyXptLh
 GUVVVhPlIXbevC5jmTY63i7db/1ALNKG5cmgVlnUUDrYCBNy6+obtQjLq8oMARuBSg4XqYoLMzF
 nvngWeMocWt9rLg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10061

I found this one by looking at the archive of the link on
https://web.archive.org and then locating the thread on
lists.yoctoproject.org by its title.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index f826bbdbc..02ff36178 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2053,11 +2053,8 @@ consider some further things about using RPM:
    perform on-device upgrades.
 
 You can find additional information on the effects of the package class
-at these two Yocto Project mailing list links:
-
--  :yocto_lists:`/pipermail/poky/2011-May/006362.html`
-
--  :yocto_lists:`/pipermail/poky/2011-May/006363.html`
+at this Yocto Project mailing list link:
+:yocto_lists:`/g/poky/topic/61292484#msg6286`
 
 .. _ref-classes-package_deb:
 

-- 
2.54.0


