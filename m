Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF29D6B06A
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17116.1769700274319632412
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gJMw94ge;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AFD8AC22F48
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B1C18606FD;
	Thu, 29 Jan 2026 15:24:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B54B6119A868D;
	Thu, 29 Jan 2026 16:24:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700272; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5IR39ciDdraoZJYNxXryGzoBV2whcFBcE1cYu4MPdgo=;
	b=gJMw94geJfyrzCpsrDMpvtdL/g3Giw/j0J5k/OF/tQCYyHGDrlWYNCz6YDlN1Khmw7LjwT
	C6J6UGwXHej8UchWwQR/ZH4mYylhcnOJAmO2mY8lHg14ZFGx0jALeJo4QSXIiecWs05Q1H
	J3zlAPAwsMjocu3+zF5I2uB92jSO+F0R9fQRn3KeO/yiyc5QV5n5arHFtS2TRuKDkwYLoZ
	ucIUAOCkPwr8//sXTA7eLKZ6yRs23lmaYkLdvDAjStGH5JQqkW8BMFH3IrP3757GgLc4yP
	/Xf0x7l53iQbtFr0PyRzyUcXGdSSPBNnKjVV/bGJcHowgzhfCVdmQE8U/yz6TA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:33 +0100
Subject: [PATCH v3 42/57] dev-manual/python-development-shell.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-42-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=956;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=O8SpQLw3mlWHN/hVptaP4QFEIzbce0arisg4v88VMiM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uPCXfZUzkjlHEW2A7cYIYNGF1ggs9uC/PO4
 FZO5C9qoK+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jwAKCRDRgEFAKaOo
 Nu8pEACZqehn5LTSa2F0Efz6UEAJk89uzUpRYein0nT8OKkQURCu6dtq4gKmx5NoHvEKew1iIJS
 Zuru9r++VwZUPkNgGAMNf3gTetCVrbL5Ow7g2s/Vc3tVMLKRUZQs1ZNaU4PcEirFqdN2DilbNZX
 RTZw55s27cRxz1RWlbJSk//W6wfXbb3tCMr6LlBlpZNRHAgRq3nIiYuNsVv3ca31gG48KgR85fw
 IRqYBLFyjr/Bxi4y+RMEUzgRhlZ+MCKPSrEOfTcD2yZKTq+XCsJ+8804FeeW5Y9O9NwO4fN1oqQ
 GBcrw5wIy4tiU3AzdRksEWPtr6wPM0ssCaPP+UNueUKk4UvpN2VD02pBZuohwFjdO/CruMv+AEH
 ibcBJeA2ycL7waiX2qjARBmQfJtHzqlmYwrqr5LrxfZ9/JrhV/vI6b2Ia3aoV6aLvv3TT1rU/1B
 M4d4S/iwg9C5LzZmfzrEbIKA0sftbTQe5bzFNYk3onLbXomCpL9Dg0zZIoG/znWbxdPmcl5iFYy
 a9A14jV3YxANVUViOGxubP/DG92Hw6jfX2eYb8ursk5oNcCOkyarO6jRgzqeOuatTJt4bbGW26k
 +pYCujKJPq5oZiggfyLhKeoT9e8X7vU7kGQZ9rDuw3cg+4mQFUQn/KkZUcE4dQJe/MZ+DwP4q4i
 OoQ0YG/ovGUHrrQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8828

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/python-development-shell.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/python-development-shell.rst b/documentation/dev-manual/python-development-shell.rst
index 81a5c43472..0756304323 100644
--- a/documentation/dev-manual/python-development-shell.rst
+++ b/documentation/dev-manual/python-development-shell.rst
@@ -16,7 +16,7 @@ the following are useful when exploring the data store and running
 functions::
 
    pydevshell> d.getVar("STAGING_DIR")
-   '/media/build1/poky/build/tmp/sysroots'
+   '/media/build1/bitbake-builds/build/tmp/sysroots'
    pydevshell> d.getVar("STAGING_DIR", False)
    '${TMPDIR}/sysroots'
    pydevshell> d.setVar("FOO", "bar")

-- 
2.52.0


