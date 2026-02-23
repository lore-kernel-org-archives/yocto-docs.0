Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1707EA4FA4
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 10:58:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32950.1771844283455092404
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 02:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CsPRjLbA;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 950C04E4102E
	for <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 10:58:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BEF85FD43
	for <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 10:58:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0551410368F66;
	Mon, 23 Feb 2026 11:57:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771844280; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=iHRDJ+lm1NobpxrfauK+URDJJS1CvkSrNaxmw9/ikGA=;
	b=CsPRjLbAHRA0JjC8hezgSNWLOxDiM6Xodo37LUveYRkhmd7Qt67nMOGmCS9dqy2dy6cN8a
	vN7wEZJ4GiDOK8eG/A+n/ack4kRO6OYqAiQG/xQJ/TMwz28yzTIAoVOlCgf7wIYVx+V0A+
	bggTTPf4dCc6Dsq1NMncoTcKHCY6BcIE8CDjiXssLCgKevh+GmohX0psBicabnvQwyNWd/
	VdtT3OwMx8I4vvT2v4t2VHO8cXOQkZo0Bbx9Wmh4LTqILJPSfE3gngIOSJ71wh0LMSKq1e
	EsLtPxpK88T7WvA7sbBPm7XN31rswoqJp2k5JaMdicK+GhjkkBA6C80W3vQyYQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/4] Rework the logic of the switcher menu and improve
 it
Date: Mon, 23 Feb 2026 11:57:50 +0100
Message-Id: <20260223-fix-switchers-js-v2-0-296523996600@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ6CMBBFr0K6dkxbsKAr72FYwFBliLamU1FDu
 LsF3bl8yfvvT4JtIMvikE0i2JGYvEugN5nAvnEXC9QlFlpqI7U0cKYX8JMi9jYwDAyqMtpg2VR
 5gSLN7sEmZ02e6i/zox0sxqWzGD1x9OG9fo5q8X55pf/zowIJynT7HZYF5ro6tt7HK7kt+puo5
 3n+AGx6RXvEAAAA
X-Change-ID: 20260206-fix-switchers-js-18626c7a834c
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=s5M04ol7F32fCOGeuQm7lgtaWk2HVX+9muFQaSzN3j4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpnDK25uADBO2FYQhSgMlehqXKbLXr9yp2yDOXo
 GMnOBO6VLKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaZwytgAKCRDRgEFAKaOo
 NqdOD/9LKe6QZJdeaonWY+4uR53LYABvrXMFCHE19nOruV3PAqrI5bHbvnPWvZfrruhAUfTS4HQ
 v1izATCQ9pVaMdWVqH50Ng+WtVfT0ACGjV/KJx2j6Ix2izv99zZad1JV8UO4CR/OeGrb6Xv+rxm
 YBhDb4yQ/RgNNcoQzH8QDHwVl35+mlYQt2nxZEN+4+aK8Wy+EuVlktUF/tyailS4dG2oKscs4x1
 VT0nzIrGdpQdz1sfA3jbWdg47/Uw3LS25W86MLtETUOWEqWWykggeVDVvUtX2kMLi6NLpkYpDAE
 OyiHB5Jf5oQ3gpiUm+SzHMMdRDRV+z2T4mpf41L1s9SIeOqlJ0ciH7brsNzfsJbYSqJ7AyWIjfB
 28C+zRCbaG2X0lG5Z41eTSTAlwj0wxSB1o/hzqjcTcCl8luh7qc9sdz67jywWbL+FxVK5WbcB1g
 CkEkjmBx5/6boF0/6Sn7cfvvg/6e1KDCXLQOpf1VxplkZMrsYKrDWg0IM/QRGazB35YhmDNLxZ8
 fmV6KATDlwG7HgT/Cvhxk9N/Xlyu23AEh+lY/fEuEpCzgbwkS117XLOBIuXa5VJ5ohb5zIRT3rJ
 5L/p5C7ZD7CysgelBB6wJre4VWnMw5WPoa2g2WkFMVHShOVQUkX7ha6528KCtrPeRp28nO1nHWO
 G7IchWKMzqJsFdw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 10:58:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8952

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Rework the switcher, now only display branch tips in the menu.
- Add the commit id/tag in the footer.
- Link to v1: https://patch.msgid.link/20260212-fix-switchers-js-v1-0-16d95c74c328@bootlin.com

---
Antonin Godard (4):
      set_versions.py: remove duplicate and unneeded logic
      switchers.js: rework the logic and improve it
      set_versions.py: set a more accurate DISTRO value
      _templates/footer.html: show a dynamically created id of the docs

 documentation/_templates/footer.html        |   2 +-
 documentation/set_versions.py               | 186 ++++++++++++++++------------
 documentation/sphinx-static/switchers.js.in | 155 ++++++++++++++++-------
 3 files changed, 220 insertions(+), 123 deletions(-)
---
base-commit: 98840d241c681c5bd4080db57b3bd9d9f0740b94
change-id: 20260206-fix-switchers-js-18626c7a834c


