Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD83E776EA
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123203.1766593929708123597
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iTuuRKwF;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 31E521A23E1
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 09F286073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E42110AB138B;
	Wed, 24 Dec 2025 17:32:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593927; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9faE2Bv7fE1wsgdf1/55d58X6aInYhxzsYndn1rdNMs=;
	b=iTuuRKwFDhi/9SBid9ebSkXWdKE5yjoqSzGFntBwx8nW8RM7qnAAa6uBV+AJ2Cbf8KfBu5
	7n5RNfh/agMzGFJXo6sRlhCrZgd0YLgYaI6VPfMQ9b3w2JsVGxJGpxOdAubs6W5lm3wRPY
	SjO3jxcWZ8hyEF1aNcQc2WP7zBA96MfNYH+TAUzphz9LkvKoTR1em4Rhe4wTxgZmpysSXs
	f7kupvGMH6s+g4V+xh5farH7Ir9O4rviAmcNb/L4vlJDUh1g2PfZvoBjdkp7RBNOPDN/an
	+H6kRWTqCRBJTS6akAVKBPl3rCLY0dYU7P9eivgPSxo1AoBxNK3pzv2MLUOpuA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:56 +0100
Subject: [PATCH 30/53] sdk-manual/intro.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-30-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wCgmFVbTf9KgpJJS5bYRFZEB/lu3IyiMBRtLBlORDJQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVsxvq45v3jwpMVge+Vau0hYYKaRHPpwEuuB
 XlsPlcykdiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbAAKCRDRgEFAKaOo
 Nm1XEAC6gCdxyW/Z89LTHZsvnleddsoJId/yyuZE034s6kgb7auFEd7neLfHkmMb9zzfSs14hk4
 66JXrztYsegnAMHY7ZjjRaS8bGU+0E8pVyFFOafSK1DPNXjgCLwUqfGoU5gMZqnToE9RB79/cyF
 D8bevSZDjRIDI91teAK6yB+k+vy0F/a9mZxLYRxsFosGy+5twUyBRW0LuJR3BzJt63EL7uKDRBd
 Bv99BIOxzkjqCW5ykD3r+5sASstsises0+zk4kAWeDHBL0t4b6g1BWxsCNlEnQLLkF8l1YC5dRY
 P/g+vfKAC9Hsk1EfpS1HFr/p986+TLGNkvhrs5DjkJd4rGYKZEUjd9UiyvLkUCrP5E52TkJM+Xw
 fYNSEH7yR8IIHeZyL9+zUXAJskIEURWjKSLx28ZZ3FVcTTT4vZ6Q35hQmQGiY/OutM6V0LU4RFR
 +pHC01bU0R0klLUtuqON98XtO/rrkZRiBZjnS9Ct7O0w0WB/a7tlPVLLqxoJtQyKjt6hdgXABCn
 NMt4ixE06r0XOwni2cYTPKLgZ0eeYZRcYZ1zZhLptgfFTJ2bmP14Ex8gbDLU9S9r0Oth9HW4Au+
 cI6mFoPW7RMsOD4WSD63kD7A2sx9yfYcFoALfABVWQ35PTouA9mfeiH+ZQBRUshIbqIViXl5tln
 juxav3bsmhx36Tg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8359

Remove the mention of the Poky git repository. Refer to the existing
setup instructions.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sdk-manual/intro.rst | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index fbfc8c2ac..68be2ca5d 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -133,12 +133,8 @@ your application or image. QEMU is not part of the SDK but is
 automatically installed and available if you have done any one of
 the following:
 
--  cloned the ``poky`` Git repository to create a
-   :term:`Source Directory` and sourced the environment setup script.
-
--  downloaded a Yocto Project release and unpacked it to
-   create a Source Directory and sourced the environment setup
-   script.
+-  Setup your :term:`Build Host` as described in the :doc:`/dev-manual/start`
+   section of the Yocto Project Development Tasks Manual.
 
 -  installed the cross-toolchain tarball and
    sourced the toolchain's setup environment script.

-- 
2.51.0


