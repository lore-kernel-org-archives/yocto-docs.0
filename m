Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8E8C88E5C
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:56:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41378.1789138589557039827
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 07:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PRHP176n;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A88CFC63A10
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:57:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D91C8601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13D0A11C7AFB1;
	Fri, 11 Sep 2026 16:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789138587; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yXE6Lzc8OWO0KedeCry+FVNPR6Ym+0a0UNQfViwoTM0=;
	b=PRHP176nXk5mSFhJmvtTEP2+7RhdpD8mZsaCD2ZVcWQzCFq7Sp/ABAKfeTurCh5V2SqSAH
	MPxTZZpmCVcxCUbHt/qkdO6I7zkNSWCdSMTzPoWFNC0dZHG0O19GnxiVL5VEovAKMG/eVZ
	gb+Xa58I6ImconQzrWO5yGfuT7bj5D6KHdbl3A0mPkMxuG1ke3IgdmQzyQWgX8vkMi96cB
	BTNkpFKSdSwOwlJKGQjKK983LNISEtZDUIgde85X8p9HZ1gGMy1W7oKexqJeEPX5hsKXZf
	fklBNstilHPU9b9L6tiFsDJ6nWf+3hpHAI7J2nypXmVJIpJtYY3CoFdnFYf4zw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 16:56:05 +0200
Subject: [PATCH 05/10] ref-manual/varlocality.rst: remove BBFILES from
 local configuration assignments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-assorted-fixes-v1-5-0d92a8112918@bootlin.com>
References: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
In-Reply-To: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=666;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=LyR/7MdBZwwo46aDnnAHVcVykFwiuGCexxIBSc/ygwg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBaVanKMqGvFZLEraQmxJqV0ChbG3+ipt2GwJ
 I5KScqBwV2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQWlQAKCRDRgEFAKaOo
 NhC8D/0QP2GO9Xz2Fy+JM0EweBph2asaB+Flz0A9gE3YKdSpDiA/OId7wTfylsSTlJWuVEEweFT
 EbgEWyUb4sOLTntLB/f9q851/9WXKxU3j8q0MeuUKq1oHB5TN6qqJwpnqmCp6/sBVOvtNAgclEH
 leglCq649EpvHFYz8K+LLYvmpiWgL65A8mlLmtQiq5lTBK0AHv5T/9zJGI9Ymbl2BYCaEa+0ZPw
 4GC3qDX7wgM3xmARJO9QLfLpidQLgKSMRyNXzwOOFa7SbgyN5g8Qq+Gimvu8Mc/+cauWxQ0758O
 jcUtoaB44L1sqXj6S/TWafLnx+OQK7XO7s0eGg1i0Kl480H/h+Y+HeDo5ONJdVR9Mrn2QWIRowe
 zRsYn8oT+tVpxP8qRZcEdQ9ediDSJdinR4Nol7I5P02KNUeXAV5IXxw71lXIBMTuunEy9lPsbYY
 9Bqqnhc4136AWA9nmB2YbSBnEKizbQcj64MkKLkJXPTbIiitDY7YtMXvS63ZGn5sDfljKaoQ8pJ
 ri/0KysuzjAUmUGUWcTMD9w9YX+JhAdoVfS/wJBmcg59sAbwXDkxmIbNYnQQHBmaFcpokBzPzzY
 EVrBCg+wjmR/3izHXKn8HgiDWIL1vZP006G1GVDyTVX1DyylBw3433suaUUxWGG6hicrTCV/pPA
 4uQhPu0drdvkBWQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10459

The BBFILES is most likely never set by the local.conf file, but the
layer.conf file.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/varlocality.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/documentation/ref-manual/varlocality.rst b/documentation/ref-manual/varlocality.rst
index 706ed40ab..29ab6081c 100644
--- a/documentation/ref-manual/varlocality.rst
+++ b/documentation/ref-manual/varlocality.rst
@@ -84,8 +84,6 @@ configuration through the ``local.conf`` file.
 
 -  :term:`DL_DIR`
 
--  :term:`BBFILES`
-
 -  :term:`EXTRA_IMAGE_FEATURES`
 
 -  :term:`PACKAGE_CLASSES`

-- 
2.55.0


