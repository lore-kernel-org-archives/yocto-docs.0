Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8F5CA6CA9
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:20:07 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6069.1769502000162837943
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:20:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YfJ/nKjX;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ABD261A2A6B;
	Tue, 27 Jan 2026 08:19:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 83B52606F5;
	Tue, 27 Jan 2026 08:19:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 527F8119A868F;
	Tue, 27 Jan 2026 09:19:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501997; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KwQa46a95k2P5xtQgi4afysib5FX1pvviAgQavHYJeA=;
	b=YfJ/nKjXVw2YM92dPZrccEm2KsEhbXQ50zZcWYGnVojskdI76MmslrX8nOPCFqeEcAezMJ
	FTRRk+Qm3ca1HzCe9NhkmnPB+cCYJ5TqEmqNkvrG7Wg+lgLx27mi4ciKOuyKyeMkQLl+Pw
	Dw5k7REY9TAEb2cm4Ie2waR47ehaIvixZK3dh4pzEti+hyZXqx5L5mD5yqOWiDiiLgA4FR
	d8kOn5M43XDNSKUXdsTm3U/3/V1T5e2d9XM4RxIlGi0EXzHkBXteB9ywPBxGMlfE50N3Xu
	ZPCzKgKYcl7hRnH+mVT6HvgEqogQOBEwZu09vrsoWTvaZSynvm3prLjRwCI8BA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:47 +0100
Subject: [PATCH v2 52/56] ref-manual/system-requirements.rst: fix wrong
 path to install-buildtools
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-52-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1247;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=yG4/Qc0oHy2mGSfxF4bE5KAqx+EE9T1iBGknSqxApSw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUGOH9qa4TXBR+JEvbKg0ZhdP5jKEBewpCXX
 hgWS6ghEcuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BgAKCRDRgEFAKaOo
 NgBIEADEUNPwJ8r0A89DztdRMySGl+kP3yu5uMDaL40CN7KQ8gZrNSyBU5/dWUtxujcxo+SCY4e
 jW5wQ6fsLD7T1XImYhu4Jes5fdK0n++NmMc/W3BYVANPZKwZiUZp/1xfFTlKfVOG367eB1lfOHr
 QFm8h/RCenCmdNRNFEUNhzVUr8ZidVM/feBkdg9tX++U+vDu7x/KIub41jDjvAZE6Pv9UCJBUTa
 IL449L6fiXWcOeKz4Iiu94Ee0s2U5/P/tHe6u5RcmDtz47cqLZOgVKbuXXV4xgOaRLaqKsbtLyS
 KaITlmQYJ3XuO2Jzxn9Qv/dm8nJLUoOqVraRc+uakG0DwKSzZmHeupkliXnFWiJRaSiS8r0k5N3
 4KpkOUWhKWRE/YWXLUkwK9GS/ouNJ0IbyWDklgzUlyCkg62YEysddu+5bdcl0qrRN4whtwWvAtQ
 IT58kq6a4wGCBh2yBelX0178+ytbxZQsGsiTFzZqbXsPeobNV00ZWZ8Jm8oWz2hEpXk9Auu/wwa
 wiMrmUFv8xqf6Cp4jaodDAS1UAgdPvk5TADqzKsFW0AEf0nWnmDpCetZFs4Yj22WEvxMrUiLxXs
 3eZXBZ3rYKgnZh6QWMF1F6yFvHQIM5GMNGO8OExUg2KJd/OoAo5jTBrMLq4XZFhgnP5BDPgYmQ9
 Chh4nxugeVU3vCg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:20:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8713

Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 9b681290e..f9f32f2a8 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -427,14 +427,14 @@ installer and automatically installs the tools for you:
    ``install-buildtools`` script with the default parameters::
 
       $ cd /path/to/bitbake-builds
-      $ scripts/install-buildtools
+      $ ./layers/openembedded-core/scripts/install-buildtools
 
    Alternatively if your host development system has a broken ``make``
    version such that you only need a known good version of ``make``,
    you can use the ``--make-only`` option::
 
       $ cd /path/to/bitbake-builds
-      $ scripts/install-buildtools --make-only
+      $ ./layers/openembedded-core/scripts/install-buildtools --make-only
 
 #. Source the tools environment setup script by using a command like the
    following::

-- 
2.52.0


