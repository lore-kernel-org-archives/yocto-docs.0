Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458A7CA6C90
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:20:07 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5826.1769501996896870949
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IftulSMQ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3B553C211CD
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41A84606F5;
	Tue, 27 Jan 2026 08:19:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72A2A119A868E;
	Tue, 27 Jan 2026 09:19:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501994; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vXg/YNLP+LfPpBXis64lD1mq8jE7D6DzEyqc3na0N78=;
	b=IftulSMQzCeYUaGuHzqEJggM1fXKu2YkdN3F5yEU4h3ceXlMeHpmLPbhhJPvEZfSoPsqUm
	UxDYko8FdL/tS5b/Mvad4jKPyN6NLd0d0qfGx7mKlC597PIhWOmuObcmEJaorg6Hla2jpp
	n8fXvSrd+w4Oi//cqNICYHDFQaWKEHpNbuMBElGTHI1fMVtmQAv0BQ7qpBmAqOFAv/AHov
	I4VRFZk5bGceqpgzD5Z7HaQsd1tdNA/GmfCnrXiE7LmaPzK5FLWStmXKBpPOdgUi6S70wW
	KSFx0tL9O217x/CIx+eQgxy1LIuCewCGnUseiF8R9jX8PvYYHdLnAAH1YjlbyA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:43 +0100
Subject: [PATCH v2 48/56] ref-manual/features.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-48-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=822;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=quxuJjtWCjod5/wBUuxChFeGb5cBaQ/2ABBmIzb9dp4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUFsaLZ14d3n3ecNMpnqwPrjD7iAEjLcuUj1
 0ibJ1Y9zL2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BQAKCRDRgEFAKaOo
 NiA/D/9SRDv5kZysDzbIUDKPf5lbLKnLG0krTkjok+Blel0IAo+rHLNx0cGHyzXpC2Sw/b1E/pI
 iPsbzWjw3Mvkg6GzzS4zu+wuejmq66wHQbr2iXaqv098UUy8PRF4GUX8b2iAb0We/PL+Ic43SYj
 irZ/ubWqjGvmQ0DQb4MVKGmt7d+H0I5OnXL8cvD7RNgpGCfRCxnsM107cS1YYkw+aqgoWZzJJQV
 U9H0Of8l9xbACZtjEiawVGd7KcBcWMpdgY+/oB6Cx2ZmYh2sEhX061/wRhHfQKZ3cULPpalbhg2
 pWeqSP02M6TN70Rz6b7DsUis7u/04ZAh5BxXPU2uzETMSfNZpqAv+qfq3Pu1ihXUGx1KL7lXFdh
 Cz5DHlQd2LsU+Mv47lX+Yq1gpe57VroSBKC1bKha0olg1o2pxN4YxQZnxWkTxWE0gxEahV6M+vi
 W2xdbuQwfYN19zP3Vfjb4f+vDewR9sakTBXI5upSSH8S3Lk1aDoaK+d1z8v66cqr+79wJyDUmhU
 0ULtA4p2BbScAQDefcY2gTV5pyNY6DU4jOj4Ft4PD3pd1Upr1bFzRgRUKzr3Ym+5BUQqIEsSlqk
 iKn9sqCNqiYNQkGHN1Ymsi9J+iqxKsjGxORItS682FcyWe0XtdtcJ4DXacOvOpK1qoCIYzOi7Gq
 T97B1Ytnq7xNJ1w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:20:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8709

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/features.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index df3783089..be67bc0ea 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -28,7 +28,7 @@ a particular feature is contained or not is to ``grep`` through the
 discovers the recipes whose build is potentially changed based on a
 given feature::
 
-   $ cd poky
+   $ cd openembedded-core
    $ git grep 'contains.*MACHINE_FEATURES.*feature'
 
 .. _ref-features-machine:

-- 
2.52.0


