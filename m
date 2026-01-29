Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9BAD358FD
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17206.1769700266449553257
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qtsZhirA;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E6A5AC22F47
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E799D606FD;
	Thu, 29 Jan 2026 15:24:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40F28119A8870;
	Thu, 29 Jan 2026 16:24:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700264; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RHi7A92HtD+x9RptsFdqPqLKhKHW6FqCplAHQVqJ1sQ=;
	b=qtsZhirALb6S2MhTu1aKxvwD0pLfuG0gsgg1DJEMEYBmxNVBuprmAf/RZ0VKxFdRQf0yPo
	i49WIa7dU7C89HSNpJOi1w9/jj6d/LNIp9NaGvEY62pn3l0ELAyjwOyVkoWB2ch9xDp4T3
	On6i9kFZ67XF4aVqcbSYNgPbddLkjjBCdNosRDKmISlTzRbXGZ2J9MLEJS1QJvnKQndJYW
	bgu5bYjQeUL9WOKgrw2nyptX2/mawbYf0CPhL7Jk7EVFa4oNnAWj1EiCNrX5Kvf3P+VRJ8
	Kp6RTUFy4rSjL64tc1NTipKFUjXkj3RhddnLSlK5K5oI15hW9I8cNmZWONWQCg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:22 +0100
Subject: [PATCH v3 31/57] test-manual/runtime-testing.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-31-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6b4ZNdLb6VrawItlmTxlixygM7KZ0Wu6HZlxqPaxgsY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uOJqCoUyhyecVWSwBC43XSnizCsfUmO7rA1
 JXpRN1uNCaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jgAKCRDRgEFAKaOo
 Nhc3D/0VaOPyaxCbxitjomJI9oflgW7yZhVoMyobQGzHs6DLpcpmDcqmKhFO02nt2atnm7wY2wV
 Xsxc00xZaD/j63SNhqmdd4PIWIzwEWwDhH7alk7RKDqiY4242pid2jhusj4dc0sd61R8ju6rYcF
 HdYRgVZVJOP216bZsnJ+AOPE4sY/L/4FY1LQebk+O++WebDkbiqFAfGDERd9vrvHdu6Ndm1kDnL
 FDUnJKzICepuWcdTForP1jUrS7NeY69HZaOQtE5ObJoSGdBbLQyfN+Xa2oQADW0lbDl8k/+1Tqe
 /I3Z436V+m0SV0tfHDNfHs3Ek/iyMWeeO5K7z2qkG+nZvt9316ylVRkT9ygeFdjjv4aRjrxWQVh
 hs/85jpY3v/2IZxE58T0PgsZmLt7iIIin9esuMvGeer+YX0L0IX2EkvMOO8f671wAi5wqQ3LL6H
 shI81O1zAZtqrnu0szcishqy5+afbZGjgyJaFip0VgEgHHNCUd3BD3L3+e/ztA8OoE0fx7Du8qw
 bGhAWORrRDqoqjO2uoRqD4e+hUtP+Hm6FVImXIoIFyWc8e07IpT0/vDvEPaiF9gPGMGwiUh8di6
 Pb0+tsS7KkiYUHSe4zAmB+M03+YXVLBPw+ovBllxEmzzANS3dZxmCKHMTOW10POZGUxDqQSSt6H
 UWARtZH4lapv4ZA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8817

Remove reference to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/test-manual/runtime-testing.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/test-manual/runtime-testing.rst b/documentation/test-manual/runtime-testing.rst
index 909448ab2..a64a97c80 100644
--- a/documentation/test-manual/runtime-testing.rst
+++ b/documentation/test-manual/runtime-testing.rst
@@ -338,8 +338,8 @@ You can start the tests automatically or manually:
 
       bitbake -c testimage image
 
-All test files reside in ``meta/lib/oeqa/runtime/cases`` in the
-:term:`Source Directory`. A test name maps
+All test files reside in ``meta/lib/oeqa/runtime/cases`` in
+:term:`OpenEmbedded-Core (OE-Core)`. A test name maps
 directly to a Python module. Each test module may contain a number of
 individual tests. Tests are usually grouped together by the area tested
 (e.g tests for systemd reside in ``meta/lib/oeqa/runtime/cases/systemd.py``).

-- 
2.52.0


