Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876AFC98317
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 11:49:04 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5958.1790250535030118929
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 04:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=l539qcFf;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 12758C5847F
	for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 11:49:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8650060341
	for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 11:48:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BCE6103284AD;
	Thu, 24 Sep 2026 13:48:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790250531; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=qogjU+G5qC8D612YE/bAEuLaTgppJLABx/eMl4NcKNs=;
	b=l539qcFfPGTmP2YNh9NMP6rOMklFUDFhedaaIs7GkmWqVjRvQlRODqM4CyGKqf04+SV6w7
	iRst9GkgU5COqKQA91AxKjYClVl2V5cSJgwjuOJa6Rtb4raG9SXXBQGzRGQl+jduZIQkkX
	U06QqrE4bFfGQ053IHTN5QJ9Nrpds2gFSi/OhCWutAWoBndwexQf9iOkWhaxnscrMzeL28
	BSAlqwfUSqU+bpxRRGDyuMkwaPvWcElmcVhWeqN4TmjAxhJP2f3YIperv9+63t6GuFPehW
	fuVc5medR5MfraDJiLeyagc2vhr7Qw8DvB8/RFaVHKymmGQMZSVYsVmF5unc4Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Add a recommended minimum number of CPU cores for the
 host
Date: Thu, 24 Sep 2026 13:48:39 +0200
Message-Id: <20260924-min-cpu-requirements-v1-0-003fc136e9c4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTuQpKVYryIuNP7RERrrTCNC6
 d1Ndfkt3lvIoAKjQ7OQ4i0mz1zhdw3F+znfwHKtpuBC74bQ8SiZ41RY8SqiGJFn4zgk1/YJrd9
 7qumkSPL5bY+nv61cHojz9qJ1/QJn2Le+eAAAAA==
X-Change-ID: 20260924-min-cpu-requirements-c9f036fe3181
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=641;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/iGHJuTgd7PA8PKeEZVGwYFizYBvtwo/FB+WNpt82Co=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqtQ4dfiaP87OWUeRhMSNJr7wDzhtBs6Igj0cxH
 /t8RyK5KXCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCarUOHQAKCRDRgEFAKaOo
 NsSfD/sFhLCZVq6QZzEpkTOTMwD+XN4hkg2BvqzJJVxx2vjJnihgyD3W/AKXzg705LxlRGFZgq5
 g297/vMtGQEqUyKWUe1ZUNmRd7jUb3qWE73+LkfvAA8ShQ9DZRgpnO//7dkiL55vZyUuFrxZkOx
 z5dqmE11/kugRJnZ06jEaooolPnxm7/NTXJSX3zb7y3ZZ/QM/7TqaXidFYjeB5b1KjQAOEL4hu4
 ftuiMAD9uuhlRWKQ269Gh+rwpxLwdbcwWrjEX1KWIwAzwrqsLhZWIdXqVNXiiskAeYOxbb2eKzp
 cFesSySE3bFzDZDB3fC6y6WnuecJzmBKfWHbljMMueWZN9NyeEWgb4vt03iYBtGvTrGQSztMiXp
 8d5mLz2S3lGEkDa78eS/Kydr/6ng4lG30J9/xjutiTYHSskKiu7WsYYotfaqNd0x14Ax1AniXhY
 H/WdcrQxheHP4kpiQdyCxj5eg9PLUxU8m19bh3K2ljWfmSRMjjIje2Sxd8zebqahP4mcOQ6j+Lz
 1zJ5AyuipPj/OtzKXWPcZI74so+UFAapNyHgKtUI6YstOWVwxUdJaH8nqNopTSmZ5QJM0iyOcYa
 pk6/VKM+qLx/0df1VJeFN8TluEp3p6XWqUr/nLHFoabfYYIIv0RtF3EPlzqPM+Yzw2ns2IdNQsv
 TSAgf/YceyTp32w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 11:49:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10612

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (1):
      docs-wide: recommend a minimum of 16 CPU cores

Robert P. J. Day (1):
      dev-manual: update recommendations for build system

 documentation/brief-yoctoprojectqs/index.rst     | 6 +++---
 documentation/dev-manual/start.rst               | 7 ++++---
 documentation/poky.yaml.in                       | 2 ++
 documentation/ref-manual/system-requirements.rst | 8 ++++----
 4 files changed, 13 insertions(+), 10 deletions(-)
---
base-commit: e9fd43e2584fa793dbdbe1545c3c67c41f7d3ef7
change-id: 20260924-min-cpu-requirements-c9f036fe3181


