Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AF5C4452F
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 12:18:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21212.1784636288407018081
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 05:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PjbKWVTB;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 577441A1135
	for <docs@lists.yoctoproject.org>; Tue, 21 Jul 2026 12:18:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 26B9960368;
	Tue, 21 Jul 2026 12:18:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A334211BD03C7;
	Tue, 21 Jul 2026 14:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784636285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=W3vRT5SouyfBgpg012uSaGfZ88pv5ZJqRV2GVrPB8eA=;
	b=PjbKWVTBQvdTb3zb7lLpz2Cu0BrURTriTHfd4fT1vnjKjzfOhUhXLCdJ15AhOUQlCQiBvT
	qHeW666HtepSdFXnjCY+F8O7bY8PQKDLMbY2K4p9JIF/QnNz7y1OYj0V7FaoP9y9PS4ATD
	W5UUNiDOQX44qUK5Ysr7N3xM8COoM0J9yfL6A7bOy0VbWuNwg9Q6KJB0xp9o+h/yc7zPny
	nUjgbviL5kryhILnVajKcCn41eyXb9DXj3ayPGS7YZ7NK36EoT1JL9Dcscm5b6EhO5q/Eb
	4n/9BeqLzyo5zWpvuygqNvyd5kJlGiTWZYgDVQdovt0l94X7eO7UYjaC/e4RDQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/3] Fix broken links
Date: Tue, 21 Jul 2026 14:17:52 +0200
Message-Id: <20260721-linkcheck-v2-0-32d93e054c50@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0JmbU2nKIgr72FYwDDIiLSmRaIh3
 N2CW5cv/+X9GQJ74QDnZAbPkwRxNoLZJUBdZW+spIkMRptM56jVQ2xPHVOvcjxgZSpKM2oh+k/
 Prby31rX8cXjVd6ZxDaxGJ2F0/rOdTbh6/7oTKq2KosDslObYHPlSOzfGfU9ugHJZli/Ytmvlt
 gAAAA==
X-Change-ID: 20260710-linkcheck-7141a2ac36cf
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=i9gN3x84fNn0COO0CiJd8JU2k9QS57K/RZt8hMWOzcI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqX2N7rScPTLLy1dNFG27VRdcjkfnLIftde2a2Q
 CXXWxKSZauJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCal9jewAKCRDRgEFAKaOo
 NotKD/9G9L4WD1S7NSFgqLa2m6fLM3jHsJmRgQxaePM5jipttDV4nKyxdmbhJ3kK6Dl4zuJ4MwF
 JxoT/ckEEaZ8ZSa9sx1+c+Kbngbo3RISG9Rda9n4rFZ75RK7q7Y1BT5ATbCWJ4JPfTHZ0hIbmvf
 sx+8xw5uFl4NwplPggLthauns5F2ygQqKksM7Mnxf+u3F234GG4gtKf0k3FdwwQcpxPPjb8cDnG
 varAaKBLqcUpqVgBPJ8fJPetR6OZAfnZavqQaBlnDY95RcWN/l/WBUvn3Qjz6BmPduvxC6nnlMq
 jemQf5SjCIwauC6R0Oxa3H5zmpkhMjTuKGREk4YgLNR1llRU4SeLEhf6TrrQvpOCi3cUiNuWjL+
 iUyvQ0fghKftHF40bavcGY4S6AMPi/W7YQx/YaV9HdtFDeuI5hcnfTAJHqyqIMB01OBRQJ1uK5I
 CO9jbPhnAO/FsIV78db5dtHDwwaewi1y8dKOiMRvL17KtEqytx/1A+rNSK0PQrI+x2ydMUHI1NZ
 E5ZFldccD5MZbRjy3Iy1wbuAmialkgvy9mnqlQkeDMuAkMHRcmxTK9FG3jyonC/CkZ4hYvTeh9a
 dpuXRzpVvUqBrdZWERB2EW9ryLol7fdxfX0CiP/xTC70hIwLaQgeLthKKSO2J/tnXt0/Ub/87gu
 fNhq7lxhkkMGtGA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Jul 2026 12:18:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10101

Configure the linkcheck builder and replace broken links by archive links.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Add an environment variable to include frequent links as part of the
  linkcheck build.
- Replace broken links with links from https://web.archive.org/
- Remove patch 3 -> 8 from v2, already applied.
- Link to v1: https://patch.msgid.link/20260710-linkcheck-v1-0-999168371d5e@bootlin.com

---
Antonin Godard (3):
      conf.py: add linkcheck builder exclusions for frequent links
      migration-guides/migration-3.4.rst: replace rlbl broken link
      migration-guides: replace broken link with archive links

 documentation/README                                 | 14 ++++++++++++++
 documentation/conf.py                                | 17 +++++++++++++++++
 documentation/migration-guides/migration-3.4.rst     |  2 +-
 documentation/migration-guides/migration-5.3.rst     |  2 +-
 documentation/migration-guides/release-notes-4.3.rst |  2 +-
 documentation/migration-guides/release-notes-5.0.rst |  2 +-
 documentation/migration-guides/release-notes-5.3.rst |  3 ++-
 7 files changed, 37 insertions(+), 5 deletions(-)
---
base-commit: 358519ca6406a89fee42c45dcaf63a37a374f33c
change-id: 20260710-linkcheck-7141a2ac36cf


