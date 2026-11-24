Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17751.1795526295506864619
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Nov 2026 05:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iTrVRd9t;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A6C204E4175D
	for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 13:18:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77950601E1
	for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 13:18:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D388311E6868D;
	Tue, 24 Nov 2026 14:18:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795526289; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8U/LctCayHqDaW4cMY4afWkrbueYCGIED2yh6dsnl1I=;
	b=iTrVRd9t7Zc8GO3SxRyhbsHnKlFOZXTNK3AamhmxbnP7h2TRZZVk6zpmeajVtiT52Ci2hd
	cFGEyGTicMnMp7T02EOM7G+K7dpo7jwJy7WJTb10wf2BohLDTyIWjiBRhEeCaVuts3udr2
	UyBmq84tNaQG3q/MkHaBJFZODKBiNB9qIHf3KK/00nqmfeG7wm7/XsWI0L2nkpG0k55Rku
	gcgtYj2sWXe9BSKgLAF67J5/NUp6asiCHOmOt2ntJ2oV3Op9JxsnFShLgVccGSMdBtQpvw
	hQCjyUIRfzrPrWoVdsbfNhaigM31doy+JNkyDai5i6JeGqaXXguT6cRQk2cvnQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 24 Nov 2026 14:17:55 +0100
Subject: [PATCH 2/3] ref-manual/terms.rst: add the Datastore definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-oe-utils-docs-v1-2-5fafbf6cb01c@bootlin.com>
References: <20261124-oe-utils-docs-v1-0-5fafbf6cb01c@bootlin.com>
In-Reply-To: <20261124-oe-utils-docs-v1-0-5fafbf6cb01c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=+LHLUO9s8Jnh1Ow+XRxEL03BeCsEyCtR3ZeMTFkQmfk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBrBY6ESRbf7TENqOVlZ+GmpJUkfpfGcpXuVN68T
 MaYQ+F74wKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCawWOhAAKCRDRgEFAKaOo
 Nn2iD/0UtXkffdpjfkA9dQ7RAHeMcjd9vBav29yknYS69g9NWkfH4YGakBQ4nZhgixB7xMvrNVY
 3FkSfZ7ii6FjUNLlAwQs1DGHEJq9OgI5dAm1bZp6Rt9pCDAlGJ3FqHfMtMlcGcp1L6SxQWdBEtt
 m7yD3M3mqLBFvBIrY4BJNPy/guYrCRkweVtStsnw4bN1HwWyRZp+RkTfGztOx1ylK/FOlQNogRd
 +jO1ZUuAe1Lb6v4hY/FN0db7EeDCVyqyKAYGzp+1D6hevUbuojk8JwnINyfvKp0qKWoPYpelRei
 ZdNfHPHfYQgbNnUPS2C2ZzAGSTSLhx/+7K7w2KTtSnehuHT1Vz2PcbRoMvFA+rygtoqYFsyXN4+
 xU8U7BuuJ3nxsS08CveL7gOIM3cMOXAvP5mTT/I5PXY8sYyphmaMLz040CV3AExiGt4ELG4ykce
 wdpqbikjjzZWII7qQYv+IUOqnoVSonfABC4lDBVOvMiYCkNSY41unWS4suVy20sft3a/7Tihyed
 CSzvDi0URzL/RbDcz2lp55H5K/DbZW+Ji9OGuokTxxz7tSeKAXyuOtFihzenarDOuM7epwYzR/Y
 OPwKbvpUJ9y8+OtCKoEnnQa9DwOVzAoI+MGS1oTRLloRAy8pTFgt63Zgf8yfxQ+exVl/GOebE74
 6At6gVbJVO1gsFw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 13:18:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10833

To be able to use the reference in docstrings as :term:`datastore`, we
need to define it here in yocto-docs. We could have used
:term:`bitbake:datastore` but this felt too wordy - instead just set the
term here a link to the BitBake User Manual.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index ed507033d..7ace5a0f9 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -306,6 +306,9 @@ universal, the list includes them just in case:
       Manual. You can also find more information on using the relocatable
       toolchain in the :doc:`/sdk-manual/index` manual.
 
+   :term:`Datastore`
+      See the definition in the :term:`BitBake User Manual <bitbake:Datastore>`.
+
    :term:`Extensible Software Development Kit (eSDK)`
       A custom SDK for application developers. This eSDK allows developers to
       incorporate their library and programming changes back into the image to

-- 
2.56.0

