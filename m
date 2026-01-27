Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC94CA6CB6
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:20:07 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6066.1769501998333793544
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hS3vFCq1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CB66DC211CE
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D43BC606F5;
	Tue, 27 Jan 2026 08:19:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09F31119A8690;
	Tue, 27 Jan 2026 09:19:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501996; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6UsqJayEQ/DFMti+zf19QnfTHQq+Jq6MrrERdL3NCk8=;
	b=hS3vFCq1+jv00TBvbypZ5qnfiEA1WU3PA10oCrbKe7rIETYBCJblPBXXEHULOiy0QfWQGO
	cY3BZxJQVuYS6GGdSKg7syOcI01h0/HaHHxiiXwJ0pnw9MW/27Bntlf6jV7hjO/qbZQ02O
	fI8BMiLtkSu2zM2xEpkdgWQPwLOdUmtv5xl9snZLVOjVicjQmVq5h6wajo7YtCKGJwZWUq
	7kFgFxu6sl/EOXuqMkVnn6FmmDjT+cAhdqg68ZsAh7T9tepunEgHm8tlmLEbHGnoVemVce
	touckqWrcvvt8KdQs35ZwVdKvrTIiTV6XJ6h/ENWnwWnWCqMfLDpyULtFljzRw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:45 +0100
Subject: [PATCH v2 50/56] ref-manual/release-process.rst: remove repeated
 "in the"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-50-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=zcJKqoZQNKQ/t7WC9mjWtxkM+8/LuydoFw1SQ4WNO+I=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUGc/DzrdfDI1g8OCkkeqKujSsRZIE1lKPS+
 A8prALOio6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BgAKCRDRgEFAKaOo
 NtCwEADMSSwPR3BslgRgOX7BcSHqVOZSKG5ectQ4LfRUAj4msjVun9vGIZJ5aEW12I8iai/46yc
 Umlt77uUPcHHy0Uigeqbhx+PJUKHjpA76hAm2jMkqBKPUnpnXUUMHidMKLxpD5pq7yIqSuxVSlX
 k/5PTKpz4FpTdyd0Vq5isPk+T/k3SfhsgZSJn48RhlguLrGW5DI4/PtSNy6VVNrlY7RADKCYS/X
 xfP9l+nrZpVuZxGHEsul5KjroKWKwq7OvmIYIW9xBxfg9otBAOduR5sPG6cZuleeT+HFNEHxi6B
 hRrE7UbOcTAyZML1LQnCJu3zHlnobUvy63t/tDeo4ppnCFB5nmF2HAJfzQpXTW1lSxIO2qt5Svq
 bShdJ2NfUlAVMWA2s01tWm5UdB2YkOT9PGNWX4hSKo4jBGzTTpxZeRJS/S0A1dHLK9LYrPFLJcV
 3LK+bfisaeawDonX3/zy8pHqm9b2INTKv8hQ/WdFw5daZi8DD5gKIyFwRO9yWMEk94Qp+J8DK75
 wSujlwTsxMssTrqKgDQDZhKrDNqRe15OeqRlMKT0yy6a5tVZg1KwgboowBaJXxTufBptUQPxAqd
 7jy4OPOuDH6iPPRjfyYeY+SOlFNENAoddF7pBCFgoX7DDZbhkeRk1GXDve1024ru49yvjUgYCoq
 E66pP7sHmM8u3fg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:20:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8711

Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/release-process.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index a75ca52cc..a55187c14 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -234,7 +234,7 @@ The Yocto Project's main :yocto_ab:`Autobuilder <>` publicly tests each Yocto
 Project release's code in the :oe_git:`openembedded-core </openembedded-core>`,
 :yocto_git:`meta-yocto </meta-yocto>` and :oe_git:`bitbake </bitbake>` repositories. The
 testing occurs for both the current state of the "master" branch and also for
-submitted patches. Testing for submitted patches usually occurs in the
+submitted patches. Testing for submitted patches usually occurs
 in the "master-next" branch in the :oe_git:`openembedded-core
 </openembedded-core>`, :yocto_git:`meta-yocto </meta-yocto>` and
 :oe_git:`bitbake </bitbake>` repository.

-- 
2.52.0


