Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3E2C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 11:35:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.90482.1783078512264082295
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 04:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0kz0r6Hg;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2DB44C79ABE
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:35:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66CC060300
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:35:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AE1EB104C948C;
	Fri,  3 Jul 2026 13:35:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783078510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=VwpepUWpDnsmWcqNA8jiAQPb+8rQhU4PXuVzrMRAL0k=;
	b=0kz0r6Hg7Tld5NqvgKscMvXuPb5lftMKsKQetAtrbBY+vN8kpTqB18D5tNGObt1Ec8SkiL
	cU3jlcwM8gTw1rPSxIKJjd9c+kgvrqDcxIQ1Tftyb82RiUXspYeo7HNcVOhm0wwypLQfDt
	r5fLcgyGBQDSHev8R99ADSTCz0lrN7uDCIr5jYem3/7ppyXtwQhpcP0pZOdaLylU3Bfke+
	Xv4KuCh3OZwwoDS/UjaG3TdypE21IPhyXaE+eiCWl7jJ8xCmVVwYHGSzckTMUr0QyKa4+U
	59T/2xJk6RMcFiwo6F0gqyjAABRJIEPjMrNq8OJ7hZWhDp4yFbr8Xgh9B86BwQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/3] Add pre-commit support
Date: Fri, 03 Jul 2026 13:31:23 +0200
Message-Id: <20260703-pre-commit-v2-0-a9a391299c28@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ7CIBBFr9LMWgyQ1iauvIfpogNTO8YWA0g0D
 XcX6tbly7z/ZoNAninAudnAU+LAbi2gDw2YeVxvJNgWBi31SfZSi6cnYdyycBQTtVaZsUc0LZR
 BOU383mPX4cfhhXcysRaqMXOIzn/2b0lV7284KSGFJLRaKexsRxd0Lj54PRYBhpzzFzkNtqa4A
 AAA
X-Change-ID: 20260702-pre-commit-fe4d1ca7bbc4
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=752;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=kgCZEsmFYPTPoRFR9hLKz7aa6Iq6RU2yiz2O7OwoXRk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqR55sFQWnZBwBDrwgl9TiA7h9b+xgolUlwwUvN
 v5n4TK5+xOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakeebAAKCRDRgEFAKaOo
 NmSrEACef3GAnvA8P6aRUsqCU5cfPVCzQxd8MGaWd6HYfDt/tjVL2+U7+z8TFvtd8rE7kduJBep
 Ecvfj81dtGJMAS+b2SgQWjwiipOfXyJ/iDFMthtW/OkKkCZmQrVtjgHD7fBekUnQbOss1hhk/l7
 yQWzTcc1FnHNJ2/e29CHbqgR70TBwhYgC6q0olidfW9Mo3P3EAfcmt8e6dQvxhk+pP70QqgB8mK
 q0hd1lM0VmE6A4rZ3QS/sRszfSxEf33DLE47VjS7CJCfRHJqhIweYEsNRIAsxMuGi6QMACr2OBZ
 csSgTJm9OkuMPvZor85sq4Z3MEb43YmZvUy+XSZdr2FkgLzFiU2xBBf32COyGET+aNNB1KTO927
 8/wC5qTh3zFO8SW6DivNE9FApR6jH52ml5w/f+1/DzjYIMfg6ut9y0jPFUvxE8Wf1E8kXraibk+
 2yckiTiWxwW9HJ9UF8cWOIJeOA/17D9JE+pKJ1scSOUus8BWv9Ne7kcppWSjnEPc3H3tD/9u4Dt
 Qyyfj2MlDlb2mkGzawFjYIKZ1KY4LWa0blzah6mPuBE0s4BmG8f/xQvujw/j/0nR8RiBH9bgTyS
 eAYcx1zLFzG7BndVtyKGUyJrunR2mcSI85o2N2lB7V0ITBBsymHCJUIZ4V5HSbdfk0djC+2yk8R
 btFA74RycYAHBRg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 11:35:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10014

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Patch 2/3: apply default path suggestion from Quentin (thanks!)
- Link to v1: https://patch.msgid.link/20260702-pre-commit-v1-0-0ebd211b5d5e@bootlin.com

---
Antonin Godard (3):
      tools/check-glossaries: return 1 in case of failure
      tools/check-glossaries: fix default doc path
      Add a pre-commit hook to check the glossaries

 .pre-commit-config.yaml              |  8 ++++++++
 documentation/README                 | 10 ++++++++++
 documentation/tools/check-glossaries | 10 ++++++++--
 3 files changed, 26 insertions(+), 2 deletions(-)
---
base-commit: def10b40398732ff73f23bf9cb8c0288a8ad7640
change-id: 20260702-pre-commit-fe4d1ca7bbc4


