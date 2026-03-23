Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3290EC01AF
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 08:50:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12769.1774255825851563838
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 01:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aSzimJOP;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 341B91A2F8B
	for <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B44E5FEF6;
	Mon, 23 Mar 2026 08:50:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E50C01037134E;
	Mon, 23 Mar 2026 09:50:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774255823; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jglCvn/ToogYqBP0PUbipgu/rNXsrAu5PyvOdLUEAxE=;
	b=aSzimJOP1+J1+rbIeFrAytzb3uwH38AB2TusTCT+HDh6XMPTTuLIeZ6y8F7uCwjxaNG6WR
	PdHSHt9/in0nT7DE217gm9kUOc+0xXKyLSULxVMPxo8qXa4YCh4fcB9O8W+drAfmRJVV8F
	ZqspIcOU8ienNqmYdCitbQoLWtwpXgv9pZv61NU/v/ADW7n0bhtXgB2jZhDPZSapsiVAKq
	WBfoUuhQin4shnbJNWpEvCF96m1ziZmqZVoRe7SnftcFaeg2i1RY0hHv6TmPbuRmv7YJpn
	mDHJu1QK3XgcrhLdQlfVbUzZfFYwAKY3NcPW4v5T9U1kpcxnaudYvmQyBgeTRw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 23 Mar 2026 09:49:54 +0100
Subject: [PATCH v3 3/8] ref-manual/variables.rst: SPDX_PACKAGE_URL: add
 missing parenthesis
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-release-notes-6-0-v3-3-844ec702f95b@bootlin.com>
References: <20260323-release-notes-6-0-v3-0-844ec702f95b@bootlin.com>
In-Reply-To: <20260323-release-notes-6-0-v3-0-844ec702f95b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=992;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=FsfPs/CgoW2EE62+PXT/5Iv9wImlzuKPk8b8LcevD38=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpwP7LGyHzlCKcntPxPxwRQnMte73gCOMzCep56
 VxESUXCbq2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCacD+ywAKCRDRgEFAKaOo
 NptXD/9D4IEyJ3ExPsTE19xlQegm6WLBqEV7WSbEcPdQDW47lAYhp19DMVKqCENpKv65Q0xprtz
 VW2o+tRiW2mUSJ0i5++xNjhptjZJk5RRGozzIAjRpyqajwsYFHlT4R190teErqqQQWAyeJ7joZX
 CHVm6xUkOx3EF3E0wbRKv6krlcoSEqVTP7gdgabuzaShbDFgI+v+Rmwtc2nm9VzQrdiOQl1AWBR
 mc8FH4SX9yhNhzCUiPWkH/NjBgPlUShge7yNXg5x3YzeNLPZAlejPUgp0wLvpB7a43SDa2d49//
 GMhtlv5wauvYEx9N7raxMyQi4K7ZdkLitOURJFSvFE4fblxuC2qn86NYr9r3/hY4vei3GjP/4CW
 SerdJYjhAOHutdUNmS2srSaB9m1WWuQrH3h1XlhL2pPG+Xkem51d7AkOR3c1AeKmxBrEPV18vaU
 ahJ2y5X7QJ9IABmknr3hOBPyaFI3NHfqsXg7j3G8rh1hVxAeMYbn2NNrFVyopIo65smWJ7uB7d9
 qbR0Y6ktSKRLCHQTvRNoZylTE6ZtMDPQwhQsUdkswfgWmyE8MpqcPAG/r6hnLGzohiEtuI0FjAe
 CvsdqtSumpNOVIz3Vz8E1vyx4gyk12IWlP7kFTxMN1/J6HrVWMvLNobK2i/+lNV2YQqoblClYV5
 I7TEIhwHLsFEISg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9116

Fixes: 108549dae76a ("ref-manual/variables.rst: document SPDX_PACKAGE_URL")
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e24c4bbf8..45542d715 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9338,7 +9338,7 @@ system and gives an overview of their function and contents.
 
    :term:`SPDX_PACKAGE_URL`
       Provides a place for the SPDX data creator to record the package URL
-      string (``software_packageUrl``, in accordance with the Package URL
+      string (``software_packageUrl``), in accordance with the Package URL
       specification) for a software Package. The default value of this variable
       is an empty string.
 

-- 
2.53.0


