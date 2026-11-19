Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10021.1795074976021803253
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2026 23:56:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xwMBEzWq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B6EC84E4165B;
	Thu, 19 Nov 2026 07:56:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B55B60237;
	Thu, 19 Nov 2026 07:56:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4604F11BC2DC3;
	Thu, 19 Nov 2026 08:56:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795074969; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=sFltJeOOzspwiCkYt3d/nFsfPqO1QMQfQ4d10PGFQyI=;
	b=xwMBEzWqh/4+ZIUztcADwTuD8EEFOu/+mHpUHUFRYmOxduV5qqSeDQtSd7nEIKZn9PLr18
	8Y8TuWrhUvZT47ZtI6ClXihnkT5Mef2bNIw7wVESoi1budbghUif7ZCAelMrEdzkYJD0Wp
	Gvs/+rWznqdako2oOZB3BQO3ckztADf2p0cUQsWcSGAnFLdR74v4XIwYaLBake05vWVwaB
	I4PHOzi/6jlkDIItAjszS/izb/AC3ZPRZcFdJ4KGoBP6mAzkX6BMFBXAkwa3iD92xOAM8H
	1mvT2UvEExrm0dXj+Uzbc/kTUGkjJr4I6E0skrPyEEgHnPCmynE6RYTx05snIw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/4] tools/gen-releases-svg: fixes/improvements
Date: Thu, 19 Nov 2026 08:55:52 +0100
Message-Id: <20261119-gen-releases-svg-fixes-v1-0-b6245fbf8294@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCQBAEvxLm7MDOBoLxK+IhbjrriKyyY4IQ8
 veMeuuiqVrJUBVGp2alikVNn8VBDg2l21AyWEdniiF2InLkjMIVDwwGY1syT/rxFWLbtX1IMvV
 CLr8qfoe758ufbb7ekd7fGm3bDmZqefd6AAAA
X-Change-ID: 20261118-gen-releases-svg-fixes-0236390c1f91
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=658;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=dUDttpJFAupLXCTVN9NgBOaW1L8PFj1hcpxgXzKxzcs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq/quLvg0fYlaAbjuV8lZRUX0gBlzqGWd+Pq+kF
 hIt7m7q2lOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCav6riwAKCRDRgEFAKaOo
 NiqqEACdi2jjNT0gCx+2yI3wR1OyNnII32JuxdkaYw4hWhbLqIrkGd71wNTwr33Zyp6w+fjr6DG
 jwNTaJAJFGFbIoeTFeD8OB3h0p9U/Wo2WuELsn/lmlYoWJD2Pyf3Rj/+zQf7aFoQEmrJI1QgvMY
 B1UErFS3Rz93tCpiDWNpzzusbkSwNh9wZnlCaSEyME+cmGo7hVBu7xtCuTnQTWoYsfcsafUyU1J
 CR9h6zTTTw1THxsGOkLwPa0MOMs/tD6q1hm8DHCntZ4i1blQphowmFd6xuQN0NtWh0A0B23t6jR
 qlKu0c6zzBc6zXlzZu10dOhoStiNMWwa+6snq9khacRetbkrNELM72wnM0x6AjAfyba4tmU/1BV
 Z4GNkZ4MkjCs/t6SQkkDJera1V7zhQb0WGaK7Vmt3Ft0mvsz7rvdZhWILgawGPlhpHe4CjrbPs2
 OBkq1aJdADspuK3U48FK6KaukVMQSUG3FOId761IAecfTr3oeIS9IyVt+85T92eSX/JPSfceC6y
 nCxVo6l43coLAPAqxRujHjB360eGK/yP4RNyJ+p55uXeTLbHRytaEyWXGQXlN2hOoWtEgjlTShn
 /8kOzPzfy6HsxAPtxfKGml6bPVPzMce4VZ61xjGJAvpDUxZspegg01vEdO5tSwYMKmsZxWdZn6R
 ajx27Ftzd/bF9PA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2026 07:56:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10794

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (4):
      tools/gen-releases-svg: use subprocess check_call instead of run
      tools/gen-releases-svg: start showing releases from oldest active one
      tools/gen-releases-svg: store docs root dir in variable
      tools/gen-releases-svg: simplify tempfile usage

 documentation/ref-manual/svg/releases.svg |  2 +-
 documentation/tools/gen-releases-svg      | 87 +++++++++++++++++--------------
 2 files changed, 49 insertions(+), 40 deletions(-)
---
base-commit: 2c5846cc2c2649b29de7e7a6ac07fef5c2e7f302
change-id: 20261118-gen-releases-svg-fixes-0236390c1f91

