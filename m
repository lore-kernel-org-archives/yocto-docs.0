Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3C1CA6C92
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:46 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5814.1769501984721948335
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mgYza32Y;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 30EB24E422CB
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 06FE4606F5;
	Tue, 27 Jan 2026 08:19:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23AB7119A8698;
	Tue, 27 Jan 2026 09:19:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RHi7A92HtD+x9RptsFdqPqLKhKHW6FqCplAHQVqJ1sQ=;
	b=mgYza32Y2aHvPJ1SPKViDvzxGeCCAjPa99RzXIfbyt04xKfYREBBeX7Cu9yh5W3Sxjjz8N
	Eq/O9WcKu9sDSKJ1VK8jBtzIN5C3DXKBl+AI+BP/GAfIYIALQ9k+b8a9gdAieOucsXCHeB
	8DkQuqcxAWiRT8mDMVtmToGO+XrcXL6Qf7VBMUMwo5eF04tE7jNyqHG5b3W03H77KP0rkS
	Q81aEkVK7S0JzEC6FUlne/ux/ywTZ5F2MfvIAtO5g9nDO4Omg4aglb6ra5q01uy1XVzlSc
	dMnOI7eoV1wSN25ApK2tP7Cyjc10miNUuOJFcs3PLTzEbTMiVkSyh66IZty1cQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:26 +0100
Subject: [PATCH v2 31/56] test-manual/runtime-testing.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-31-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6b4ZNdLb6VrawItlmTxlixygM7KZ0Wu6HZlxqPaxgsY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUDVqqBX0K12JKNVl/bVtjcOckNh1trjHD5q
 o2cV8QuwumJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AwAKCRDRgEFAKaOo
 NrpAD/92vlokXsd+3OD2xqGfwbAzyPiZiiZTDqKAxlqqJ3t/w4cYbxn/QpaEQJZDLe4KQNCAtlM
 W2ZyvbXbjehrfjPN974HK6vjvZrPT/RQ8buRvZpG94cyctZ1H2v9OMhddNqDz6QnxgJ5E1tx72h
 66CJqchdYeetCe3CS2G/6LZHSHtCmix2rZ9w9+LrCPmSDyY6fUDtEdykYgCBeTr8YRygfWsrk5R
 wcd6/PqX4RNPg5tw6Y+TAXP00ZiYRp/Mk7jiNOZ4kFiRZABlaR/7IbgxmJf1glSRnuMafVNNk2M
 SuPDXVM++VBGbXk3Y/micR1uLITOigByaZZ3fkILs+PZ+mKlWQx4dGC6Zzj9J9eHXRgxs29uAjM
 0IzBPMLeGO9DJ4O9HgzeMYotHlGiGBlQbS0XaXACzg3//JX+qEnoL1Q98lIcwYbhkBNW50wtr02
 xa631el5fEkYyJRu1veufeM4K992uYQazuoBnz8TmG/G3NLCK/f7g4bWKfOyh/pnaS923dav1tU
 C8E6m2qWmSDwBxiG+nrW0sY65qDLPrEHHNnQwLzFrjHhiZMEKdQuHboaRPnm2yPtx9DGujDXl5q
 faOMMxvuJBDbstReKOkSDxUcdS94j3llmHU5aur6zY3pFUPRK9/KmLRIrqs/oYDNwru2vc7PHCh
 4ANp3gTSEO6SbJA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8692

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


