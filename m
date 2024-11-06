Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2E6D29FB6
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 07:48:55 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.40795.1730879325706011646
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 23:48:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CFExs51e;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1860EFF80E;
	Wed,  6 Nov 2024 07:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730879324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6GKJJpTJ0DiH71XVYj1QwbiqEA0lC0JN755CVdfTa7Q=;
	b=CFExs51e9cT4y3V+KMXpanr0YSCg8XQwBwDZjSv8UidVbCwYEKSD1CpZ5sAXQGnsBXXtyO
	ztQf37WCRUEoMrhd852NXWn23p0/Wr2v+CKyKXH1cxr3UXcGA+J6w6saJplNt20Rvrvymx
	rRRd3j1BUujSgTVJixPyoaP1otqmRuyu9/9mKP+YdWU9OwPWGmHzS/DYhiE284YvPwBiPv
	+NghxL1mtnlKIufjxCVIcITpWLu/77SLO7BrEY7H6oMc9LNvbVFDxjNjmxhBFsIBUgSiE2
	eogvO8dSgYuTMDUPoBkH2LA13yYsKIIh2jdpX57hEUMwdJRnpZmefnyKTDaMNA==
From: antonin.godard@bootlin.com
Date: Wed, 06 Nov 2024 08:48:25 +0100
Subject: [PATCH 3/5] doc: Makefile: publish pdf and epub versions too
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-pdf-xetex-v1-3-044eab7e77d3@bootlin.com>
References: <20241106-pdf-xetex-v1-0-044eab7e77d3@bootlin.com>
In-Reply-To: <20241106-pdf-xetex-v1-0-044eab7e77d3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Michael Opdenacker <michael.opdenacker@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=IL2nKlHd0vwnIuLZg+S0roYIBzd1gWx17CBUOPThIE0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnKx9aIPsZJdNq9o+GBZBmY+hHpRvBoosEw3hyZ
 bh87Zbmf6WJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZysfWgAKCRDRgEFAKaOo
 NjcyD/9np7XxmcE0jwQKdabdkIuvnz3F9QT567NSQgT4c+eRxYHsZJqg43E9hbE2dlz8jcpBajA
 QTr+Gp2LaPtu/yRHbVDrS7TEU8XgrKX9eshZGjv2DHic/CwmT8Y9hLgEj3NPt2Q7G5SUM1olwtl
 c0C1pnq6JhQ5s7DmB4DZV1ZCOUaZhpKH1nrLH5R7nK5AUg3EDSj2GDMtADSVbKR/tWlOUj9bICP
 dztbu4UvGWciuiLDOPlxZZ8VhgKCA+jDrK9DkNUg99ZeHJSFicLAYRsaniNFe1hk4tqpHY4BcQF
 dcTQmKCK8eAUqE89KjAyfsY+ephfw4RBb06tzkPGRyjdP9UAIE/X6RH0DLgaSRUprirgZwy2Pwu
 Bb44qLGElm08RbJGdG7JSrZzD5xgK2aBJEs5rqr6YdnZYxK4oYLaseV63Axu/2d1UoqIoVV7CQU
 X89mEgh+yPWmSBSnNEur5xuzK1OCZ/MiJDkRSa3WGU/t6IDMhoy6FzDfSk/Pb5QGNuA8mbU8Mcz
 XBDPLnMUaerohXIb52dNL/ZicHGrumrM2AJYHIALYMU88YR60m7gJYG7fuE8PtcSZ6ZUkopuf8c
 TjnhfjMRIIKgH/pqVFltz8A5LGKJhM1FNzwj4H38w9P/UdLpZtbHSaWfE9iVZlOgrKgMDwS4EiE
 qMgP+LvS3/m2a+g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 07:48:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5688

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Copy the generated files in the special _static directory.

Fixes [YOCTO #14357]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index 12ca2f95f6578a31cd309f80b58a2702561a6b9f..ef5a6ce33987e8a79a65ac400212f877b7daf11e 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -25,10 +25,12 @@ help:
 
 .PHONY: all help Makefile clean stylecheck publish epub latexpdf
 
-publish: Makefile html singlehtml
+publish: Makefile epub latexpdf html singlehtml
 	rm -rf $(BUILDDIR)/$(DESTDIR)/
 	mkdir -p $(BUILDDIR)/$(DESTDIR)/
 	cp -r $(BUILDDIR)/html/* $(BUILDDIR)/$(DESTDIR)/
+	mkdir -p $(BUILDDIR)/$(DESTDIR)/_static
+	cp $(BUILDDIR)/epub/TheYoctoProject.epub $(BUILDDIR)/latex/theyoctoproject.pdf $(BUILDDIR)/$(DESTDIR)/_static/
 	cp $(BUILDDIR)/singlehtml/index.html $(BUILDDIR)/$(DESTDIR)/singleindex.html
 	sed -i -e 's@index.html#@singleindex.html#@g' $(BUILDDIR)/$(DESTDIR)/singleindex.html
 

-- 
2.46.1


