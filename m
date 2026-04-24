Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA82FB44CC
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:28:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16691.1777019337747264096
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lSDrWQqG;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 31FB34E42AE6
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0AFCA604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 574FE10720728;
	Fri, 24 Apr 2026 10:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777019335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4Wkz3G2yVLXkPYtVbfiyvbhC7FZ+JUyWVPvu0KxGk/w=;
	b=lSDrWQqGos9Mgv/0aMNG+1ufAhLOGI7xTOCbQx5I2eNalAy+YrRkCHh+INpeMyXXmK5Cg+
	gB4b7upEvil4owvaeizst1vg09gy8wXAZ7bGJsHhr8BRyaKcK7Z9AV5zNPf3zTICQcvLr/
	gqxMMW5S0Z3Ra2/qQfFaXCzvCO4LFyIcnQZjTlmFuGuTmy1SISPW0V33bWaIhkdJSHVW3v
	ro3hiunLURHZWTsFX3Dp6VzabmEKhwZlRR00cvP0OD1CaOpxgfLbFYDiOHDf85UwnHxDz2
	hO3W0Gz1qmmT4RQlm4U9/AFQyicJuoun3fMAkfFZHiYgWhrXifN0pQ4NAMQZ6Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Apr 2026 10:28:37 +0200
Subject: [PATCH v2 09/18] security-manual/vulnerabilities.rst: require
 Upstream-Status, not recommend
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-third-release-notes-6-0-v2-9-4feacf138e13@bootlin.com>
References: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
In-Reply-To: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=964;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=9c0go3WS5jRn/aXjXZGiPpKKCmG7k13AcwGT6AEHWMs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6ym+a+RpSSOysk5e+eZrYqcWomc1N5OI9RA2Q
 75NCRFn8LKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaespvgAKCRDRgEFAKaOo
 NvDfEADAp6wy072q3ky3LrqJT6Nx9YmWtwgnoJnNh7eGa0yxDNt81qgjPkp+2jquNd3HG7j7Jnz
 BJSzyilA+SDLJ3rZVxCKBw1FLM/Zu/wfBeMn2a/+NyxpkKELdWKTapZNa7eJNQfZTAo6vW3kQjp
 iE4QaFlzzM0+L1Lqmi4eAIbwMw9STnJc0pjhwKGQFHyEqxTmWcwQl8BDm2cHNtfkQV9ILqyVTE9
 PFXjeIPG4nqW1H/I8J/S+aKVZYzpr6SQ2m4A/+fPtCtvSlkLp2JZ04+DwwJl6c1+rrTvitGflZW
 ABG3ugPFBsGI9AUe4GO/T49w/zD6Wrzir9QEzkAPnnuYlvJwgLdnRXM6TdnJT3tFFKwn4eB75WM
 B6tAqmRkeRb46u6P01IbM3BPuIOYuclFhfzfOnbNKmM5I6dAeLYw/EuovTUWrxK0t3OmNEjyREl
 A0jzm9ZUrOxx4CnUofBrDRVgwjMyh8YdqKyFu2OvMiBDoDmeJN9GzbbAaz1w05fDSbUcktgIGo+
 ciVzWhjrur+PFeTyTim2SWCNP9mUQE5vv+HAHvz7lt0mkRLcem9Ia92hJ6QzWMOV0qK+38KQpm2
 /RWLw7WGMZ4o5K62gLlsQhECrP1JMamjsqzr5HRg3+8vLNnbn185pOz/7HvAouwlhA8f8sGzGjE
 w3xAFB/xj100kxA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9347

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


