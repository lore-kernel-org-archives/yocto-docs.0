Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209F6D6B072
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17125.1769700282091066339
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BB+7eIVj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8B5A64E42322
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61D1B606FD;
	Thu, 29 Jan 2026 15:24:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80B31119A886F;
	Thu, 29 Jan 2026 16:24:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700279; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bonL4jl3f7N3DqXO9BiL1YZgqtQ/xWWLTg2INZTB5hY=;
	b=BB+7eIVjWAyYV6z+432UynPVR6uqdCNasx/vJDcEGyOyjrhiR1eyF+xxl0AxDZSR9DUzyE
	n2qF3PbZM1hKgJ5WoWgOgmf1G9rWbsb7B7XT/DoZba6AwMgDNXdzgWVjMIOUD5bGuSRZ9+
	euaps4mOE3+c2JU+/p7zz+WCKNjmwEGEOR2JesEhf7iCyVMCQFflsfkdy500r0zXjqhN4e
	T2zTrMgTlLJNM0hjkTSDP1ErFxTwoH4/eSVsut8fNAZgFqbotj2ctVJvopS4wmnCcwyK9K
	zqM5vEbSOkpsjqvrUv48jNhUcyHTJmJv1csDObuS+FjYs07+7zQ1/H8K/9Xl4g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:44 +0100
Subject: [PATCH v3 53/57] ref-manual/system-requirements.rst: fix wrong
 path to install-buildtools
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-53-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fFK9PRZflppMlWH/Z6riNUakWEhd/02LxxmZkyx9Tik=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uRt8YFocAmZ7ynA/KpW0goBjOHU6IO2o8yv
 KPJ0dCyVyuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7kQAKCRDRgEFAKaOo
 Nt1OD/9lJbyr3v2VIf6efy1JILOgSJadtBjAjkk2SsrIhNntfEEAxf5MEz5r4IiJ1nSKiT8bP7u
 uXpcErI9M0UBPIGZ/3GTpQNrMv3YHVk2TlMQZAYSjg2oxmL8erfkkX1cAXHhcwBDGSnZ4sp23Lv
 yoxSXgI+yJt7xTThzm59IIMTqu7LQS17v645FNN5nmARv7t93AvBDgGJ4D9OZpLCK+x0DRGwRHV
 J4FvS6leay4AHfaYfzFs5J3JTkWGMQfJyKAmCyROySZvgW5FfCGcwWYo77fYSYotCkc3ITdCe3U
 MToIWrPeXa+vujfgKaMKjnlF8ow1l0+KFnjuFzbmUwdYRnomh43HxfY0gsfdlEDSt1/yl29weF3
 ajfpKSXSUkM2EOmcYyS9fZeOaEEeZrsSZPWK8d3DiK8O9pw3bCEzaLHhYhrrpngrXEExm4fm68I
 R2sHEecUeC7nC6EAsPRXt2jsJrEFGXOF9RXtITXOvr3xMjtkkK3NaWOrXzB+htU22yjuulObwI0
 l14L+UQGYaIZp1FYGb/MbNGsbg8zaL9bEuszYISXfrH7HkN3DpH6B2C3QzT1QKLTbm02KTgFaN/
 sVDCaX7FW4AY9x7CnbETO2WkTmYSrR7G9hRFJLyN65fNnjxLBmMoV9nUMAOqwKnHcIAs0DiKHaK
 jr+RlO3/c9Z2arw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8839

Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
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


