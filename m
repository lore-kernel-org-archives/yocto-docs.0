Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C883FD006E
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:38:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.156864.1772444286248627107
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=raekYc+Q;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BB6CA4E424DD
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:38:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92AEE5FE89
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:38:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3A9110369511;
	Mon,  2 Mar 2026 10:38:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772444284; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Uex4qqngFS0syOed38abNL1EGU2XMki0g2T5BWH+llU=;
	b=raekYc+QEYz4LG+cIeB7WeP+QTU+ioH4IiGd0rflg4SYoZYUmSuIW+0QgkFGx8WVARbwbD
	uoEoBh3QRxUJtZBJ6kFMUkdpvpjRO/77YFQWBIhappan3DARfibGuMA4J0m8aVbpz/QcCw
	1MMcsjpe8v8G6r64iJwQv/D0K5VuLcLPehawqbJmDNA+Mwux6V5jzrW3Y4kaYQpmFXBO3R
	RgI8c3CxlOc5EFj59JvI+jZanIOeiOGQqfCD8R9kW4X4iXjtr+8nVlCXv3PdoiLnkxjbP7
	W7OcYoBM4IqhF24LySOH6O84j9z1R11JDWDoutcBHdEbAMXIcAWaxb4D5J9Ezw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 02 Mar 2026 10:37:55 +0100
Subject: [PATCH 8/8] ref-manual/faq.rst: remove the CVS proxy note
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-release-notes-6-0-v1-8-9662dee58591@bootlin.com>
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
In-Reply-To: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=795;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=xc1AiHzjDjoN9WKVCbmYUMZWMLPGR1X14g/nrZLS73o=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBppVp2xEPTmXuTf6t7dOVfW4TaPdpYr+6/trB5Y
 dQ+LiHaKLCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaaVadgAKCRDRgEFAKaOo
 NhAdD/9FRQMJyepZKhPQD4Dtwx0B1RQhX6oNVaO3ky4coBWqCJERag68rU+hIj22UYjzNxoq0+h
 Apqc2SlQ0hrDpWa66sXoGXC3gY35rq82Z72AHaGj+yYkr8BCHN9ciiOgSjkolQVR9uOaJn+bz8V
 w286M4BIJWvpp96sJdnwABFLN0RCQx+nOHSjZDk5EpgGrSRngWiV5GPwvtRS/Kfngk5uP9iRxxA
 FI+YQVT7mPVzpSd/RTbpcMLuS21VqWf8yhWTcnQzw8jZwfHsES1D3sL6aTAGldjq/sH+iKu1V+l
 dEqwQ+ONGIZ6OKNvnJbhZVVz77+IhApubyW1lIoW+m0FK4VuHrSyl/1hb8wJeGFbQln0ilm9qGb
 cPQDdrEMf0Y4Te/CARn4I4pmXG/so+maFuGR+nerALQC4DdLdzGrKruUAaCDj9eKZnibHoN5slj
 UIPJ4bRXEgexeuM5RQV+kniIc4DsX5Zs5NyY1WbozadAsYuctZC/vR+HkmE4jthnxOZLVZo2Ae+
 u+NXCjOBK7NUgiSYN1G7zw3vshrS76M5HeFr4PuEKs0y/u9qlbhBogWWrm5czcGBMZHPbPUVmef
 zvmLDDzk/bicjjUnollruyF/iWtTaN/Iyr2mjD9LfBa6UE7QPfWcOKKsTMJDyrtd/aQ3MTy94bf
 mPYuuj1pEk1Jddg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:38:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9025

Support for the CVS fetcher was removed with 5427500e4f23 ("fetch: Drop
CVS fetcher module") in BitBake. Remove the CVS proxy mention.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/faq.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 152fbf7b2..248cf3d2d 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -197,7 +197,7 @@ requests through proxy servers.
 
 The Yocto Project also includes a
 ``meta-poky/conf/templates/default/site.conf.sample`` file that shows
-how to configure CVS and Git proxy servers if needed.
+how to configure a Git proxy server if needed.
 
 .. note::
 

-- 
2.52.0


