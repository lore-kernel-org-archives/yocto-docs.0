Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3B2F9EDF3
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 14:23:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83818.1776867779790196596
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 07:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oh/LsOOS;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A89A6C5C3CC
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D51625FA8F
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:22:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10C6510460B10;
	Wed, 22 Apr 2026 16:22:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776867777; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4Wkz3G2yVLXkPYtVbfiyvbhC7FZ+JUyWVPvu0KxGk/w=;
	b=oh/LsOOS9t10zqqK7AGDavj9ejtBSZUzPBokKkIKys8/GCnCaO611sMZ++DRB7kseXTMp7
	gg7B0MiGNZ2HLP5x8gFp9u8bXrvBPpKH22/Wre1ke2EUzR6VSbFTxgbKLAb9x2haGU049e
	bZD9f+PkV5qfx94q5K/2SobpbsTkJ6o12JnsQQXRAtAOb2IysQWpF1TbNkGxxb9vqeb2Qo
	Ed8FfGBVCNd/7cFxE5muBnRvYA55JyLIxwkokjPfMHqrlWrVuAcz1Fl88xzcHNQtidaxIm
	JoPQ4Tsu201tRjuRa6nwJfpg3a0+aEmyQW4JaJZQ0/rDnqNgX9qDxCGlVxnOnw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Apr 2026 16:22:41 +0200
Subject: [PATCH 08/16] security-manual/vulnerabilities.rst: require
 Upstream-Status, not recommend
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-third-release-notes-6-0-v1-8-06635e8648d1@bootlin.com>
References: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
In-Reply-To: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=964;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=9c0go3WS5jRn/aXjXZGiPpKKCmG7k13AcwGT6AEHWMs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6Nm51mUccyeESA1xqheY6DhTm/iRhhtRgySvA
 8scyztn4LKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaejZuQAKCRDRgEFAKaOo
 NsBlD/9hvXC0V7LLu7HiOKyDOzsezo6ao4p3EEy35tbrQ+/o/6Yae0TJtSSLVd5a7utl5GqdHAH
 6NtUoYnefyxNjg6tTVZF4PqyyBQllgEGLS9+2ODgsU6rAQHfdr5PkyEMtSesAV/94qEbrDLFmGm
 bWQj4wnJ2kMNVB1ZEACoE+SOdzkpwwYQ/68gZjJ9E2e4rs1GMwBF8hinEwjgEbwobx0kfV7kSG7
 kavJtsQmRUXdxGsR3THVUbUdagJ6ikj4jyCbdVuB//yrGnlden1UYyk1LmaDTxsNjwSmiNdKlOS
 W1Rc97AR2rOtRmdRAEliIrIoa2Uko3ygfxs/TkvmH6S392NGLbCikwfHVx2Tknz0QOpgOZK24Pu
 Zg7vfg6ADzGJzwcr8iXh3IaoRexPxoWyFHiSHCqHTFd+NP5STb3dpZMsqEk07Rb5yG7/QIGt+c1
 A6KAfEHshgOanfQCvhe2hSGMS3cxypoIvZmpr1ySMEsQ79jgSbDifoAZMj8krCcQpXlXFGkfN0x
 pi76OiQLSGL050aQqD57HtkknNghpnE5m1w/qjV6Hy+1kGK9SIQHIR5pERGaMmKctZ/mIoivEyv
 0PBrgXv+FqWTnQ1VIHdGd9I+2rB3Sym0xtHYcFY1bfO3agHznpWXEunfUqb3FGASTKIOnLMyVvx
 4IFDJ6Tx0H9Jmew==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9317

We want the Upstream-Status in any case, even if the status turns to be
something like "oe-specific". So explicitly require it here.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/security-manual/vulnerabilities.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/security-manual/vulnerabilities.rst b/documentation/security-manual/vulnerabilities.rst
index 983e1548c..6121d4d7d 100644
--- a/documentation/security-manual/vulnerabilities.rst
+++ b/documentation/security-manual/vulnerabilities.rst
@@ -234,7 +234,7 @@ the format::
 
    CVE: CVE-2022-3341
 
-It is also recommended to add the ``Upstream-Status:`` tag with a link
+It is also required to add the ``Upstream-Status:`` tag with a link
 to the original patch and sign-off by people working on the backport.
 If there are any modifications to the original patch, note them in
 the ``Comments:`` tag.

-- 
2.53.0


