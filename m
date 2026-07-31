Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AFAC54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:19:48 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2855.1785489585729186223
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dfEZIjWW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 14C274E41046
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:19:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DED5B6039A
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:19:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5031A11C165E5;
	Fri, 31 Jul 2026 11:19:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785489579; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xv39Y3Yaf3lAD11rzo3Y52HmAcIQH7TMg2c2SH1t150=;
	b=dfEZIjWWVJU9/0UUpcecxbOd0qbKfVpntOUF42wzlg1jzyYfuHQ8Wxhc1NxcIw+ZQCOk+Z
	Kn0ScwpLvKDtqeYueHRv1ODNl0zpvYxRpStjGZzCoRpE+ruCKsuHch5q6F1K1t5XC0yvSN
	4utq7PrNF4DoNBugnBo/iXIUJJQJceNjD1sRRe87lC9L/KJhCaAO1vMBnDzSJBTz7sGOeS
	rg5BGDmDzk9OI8qIjMb7Ag3IGiUbjRMQlyx6xhMnyTTixiBfiNCGI9kD4JH11ATnfJnW94
	ZC3QHMa4caszvx2Tn5dPu7QdYyTlHg5HUbck6JC+W2LsSYgUiafhAJrvffU9wg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 31 Jul 2026 11:19:25 +0200
Subject: [PATCH v2 2/5] sdk-manual/intro.rst: remove a confusing sentence
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sdk-clarifications-v2-2-b34f797492b1@bootlin.com>
References: <20260731-sdk-clarifications-v2-0-b34f797492b1@bootlin.com>
In-Reply-To: <20260731-sdk-clarifications-v2-0-b34f797492b1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=14cHM7DcJba46HHHxPCbo+hDr/Z4Iko8pxDMR8sWgb4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqbGigkdgzV/zw4uPNMBhR0npKMv3v4xKBttQkq
 vddsx77Z+eJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamxooAAKCRDRgEFAKaOo
 NgRTD/9oEO6gksftNB+8Sxcwno6dJ2K0zPqP38EBcldqc4uNgyAqx8v2pOqHErZ1zDQAO/sunSD
 Vfx0f91jovG+nqW2LnrPrUanJPuJ8UYCDNcttDe8mXkNUa+0DsCdt6sHE1F3VMzTwb9kUFB/H7e
 j6tCE3jNqsRksMz7vInkiBIO119cWBCh88e2GElwX/hhNdjdzcGWxQquDc7BWupvNL0wQNXs0sE
 lFSv3hpSXEjDlPpwTjdY+E3fBnxRcl9smGVD6/ZMoQCNl8ce4MyDyF4GSRfGw2WusXbETEv1pCh
 5/oYbl3aBib8ZGhfYaoPR8ZdrjRX3CXmv+AXz1xB2ZUSLiFqCOuQzeeBBMfatpXnRnCpb5vwbBs
 v2VhKwWZyqyEUC5dNRCwbvABqGy8Z4hq/IbXl0zj6Aoj4JA+CVeEI1RAWJtr/6kSVvIQO5pufkd
 W01dWCMjlNtORr18yCAVBLwZfTNsPQtJ5VbPhAt+TNnssX2eTkViqOfW8T6VNIjCruRDVuZasGA
 wlp6+svahGx7yjGBS9qkmG5zOpqTBH12sBtXUleVbHrcC6h6Je9NQGgQcfS0JXAyzUUwm7JNT3Y
 08qFtT131XHOlGBHFrieW/IjJ7HMo54hSxc3KmAeYfgPtfAEGlhVrfucnqMpXwvATDuR80LoIQ+
 8aSWTX8ES1ZZ9Sw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:19:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10208

I have a hard time understanding the meaning of this sentence at this
point in the manual. populate_sdk and populate_sdk_ext are best known as
tasks, so the meaning for them as "archives" is unclear.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sdk-manual/intro.rst | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index dd2902cc4..3e78219fc 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -35,9 +35,7 @@ destined to run on some target machine. SDKs are completely
 self-contained. The binaries are linked against their own copy of
 ``libc``, which results in no dependencies on the target system. To
 achieve this, the pointer to the dynamic loader is configured at install
-time since that path cannot be dynamically altered. This is the reason
-for a wrapper around the ``populate_sdk`` and ``populate_sdk_ext``
-archives.
+time since that path cannot be dynamically altered.
 
 Another feature of the SDKs is that only one set of cross-compiler
 toolchain binaries are produced for any given architecture. This feature

-- 
2.55.0


