Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423D8C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 15:11:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41825.1789139507227338724
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 08:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0ELCHh4Z;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 97CFC1A01ED
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 65E6C601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8640F11C7AFAC;
	Fri, 11 Sep 2026 17:11:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789139500; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=36+4MqJkRMKtI/ZWuPWddYqovN7KC8A1ibBoXIOs0Yk=;
	b=0ELCHh4ZbZs1XQaOxNq1bx2M7MjtWAz0vBIgA4rMij3jCmeUU0fftI9Vsj3EkBgxxLhcPj
	ODdhG9W7a+YmtABtP17spNXoi0PKoz9lISQcvEF6wcSZuLlkHVWpR0XR6w9RrIJ/qIGShY
	H1pkhYgszPpC9YI3NHaeW2g/2ynodg2FYqvTCMlI1qH4PIdCjbGHviWEFeiro/toru8Oo7
	PCn6IEFFhN6RCLv2+hMMEUpZHAdQne6NHqzCbILIS7Ry3kIsskumK8wvV/fuyaR59gw9GE
	1e5nM/Y5hWH3wsctQdutr9x84ppIw5GU1b1cNSdsM+bRMX2FBRZbxBt/Ht46ww==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 17:11:10 +0200
Subject: [PATCH 4/8] ref-manual/classes.rst: buildstats: remove local.conf
 default value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-remove-local-conf-refs-v1-4-322e1e9a232d@bootlin.com>
References: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
In-Reply-To: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=a2LTkj/VZg2NRrHsIRjCNi57KziRbHlWAxp9s/Mq7Q0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBoW2nhEFEkMRc1RqZUAFn8wJ7PRLdd3s4PdG
 qd9oV4+BE+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQaFgAKCRDRgEFAKaOo
 Nh5HD/9woXiN2t8uOnqHZwpsKA80Y4mgZmGsznrK86RbrLysFHUw+upSwzgoJx3fYznIF0E9HeU
 YrvbqkUnwVVlIAGvFpQ6pnsfx3oTFMGonq/sMHFqRFMKqHtwbDlxKPQt6KLhMxIOg2owU37XWY0
 /dxnZ9KkOr0HC0pfW8sJC+gHS5nUrRulfkM1L5fboaQkNEgyGkVg4Nn7zbkLUi+EyVgIhBZaqJK
 alVZDsUIGiLVhppXAXBvdJCwVwxY3v5JJR0noFmu70Rf5UsE9YT1T5kYiHz3Mo/GA02+JEDHofH
 VsQKfucL8JS/1itzGMKDfgot//7DPBhI1a+vzysCjSpSzUxw7571Uv1+X3bYLIg2d+bfo6T/r2c
 soFoif47EF4nYf8x302wsTWSkXgygXpC6DAAEyGGkniL9U1WYuIMvwh7N1aBiE6GB8d1XHkSYnS
 TK7RXhMnFmgiXa6tgwlxRpCF6ZSZwggTnjR+Ur2os4Ro1ost/xeuowNOeeYJU2hTD9SUfC8zlNZ
 TCrIA3U6o/xocGpq0B576tltwUNJdY1HV4TYJE396m6tMYeJE1CNpPmbAxWp0oV5sAbzaJwzxb+
 UOGsMiQB2TDFGSYTsiMZ2a9RD/eCRjHS8D9BJiBBKoTIy9CX65rycGYbKtlOc/qVzHygCqS/pBI
 BmnZq+CHp/V9lFg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10473

The buildstats class is still part of the default templates of OE-Core
but since the recommended way of setting things up is to now use
bitbake-setup, that no longer the case. Remove the local.conf mention
and keep an instruction on how to enable the class.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 631091f03..6b48cf693 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -288,11 +288,8 @@ to ``${TMPDIR}/buildstats/``. You can analyze the elapsed time using
 chart of the entire build process and can be useful for highlighting
 bottlenecks.
 
-Collecting build statistics is enabled by default through the
-:term:`USER_CLASSES` variable from your
-``local.conf`` file. Consequently, you do not have to do anything to
-enable the class. However, if you want to disable the class, simply
-remove ":ref:`ref-classes-buildstats`" from the :term:`USER_CLASSES` list.
+If you want to enable the class, you can add ":ref:`ref-classes-buildstats`" to
+the :term:`USER_CLASSES` variable.
 
 .. _ref-classes-buildstats-summary:
 

-- 
2.55.0


