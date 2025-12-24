Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EDBE776E7
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123195.1766593922828894778
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0u6XDdIr;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5A1D41A23E2
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3027D6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99B4F10AB137A;
	Wed, 24 Dec 2025 17:32:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593920; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=So78ZnHq5jP0f+6ofLHRm5ScVdjjhEuBLSJzeTuV1xw=;
	b=0u6XDdIrYR+seLveWBg3ZtNuDxwxlIbksjL4I7ju5iLWnER8FBGRWz825xMX4Ox/qaRgSG
	XkJzujoTKDB+5iucA1cazJfgRZdWFNh4QRHKpC2WvA+vd91CPGYX6X65gC3pkzvaYANds1
	KLi0SOaFbJEjJtTuhSB+ndBvfqyoYYiFK+5faxugTOMfpZDhTO0YFcLZ7GdEl47w7iLajf
	KcLsmAMTo2+jIzXxkmMJxME1lCJCT2RMVQMmOI+vbSeDMuJChgco54t2WDYO+53Px+XhgN
	6XR26ea2W8HIeT0zd7Oyq9wmRz9a4UZ9MM4shCCKubBdziwUpA+a9fZ9wbhNFQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:46 +0100
Subject: [PATCH 20/53] migration-guides/migration-1.4.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-20-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1077;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=B6B79bLviy3ydUTQ7na/KCgKJmDtg8bi/wTNg+0MrLo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVqRW4qW5d62dcRnu5GSYpTzMV35HC3pR5Mq
 q6Rgh6C3bWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVagAKCRDRgEFAKaOo
 NlHXEADElDaREBbjP5FrhKAvp/UbvKyhz6YEWFk+zDdAMMG4Q/0KbE641W2RsjGjHST7UAnAyfs
 DMcGoj5M8aLpZ7Y/LrFAqFIPYmFAgva+dhvE50JUd5jIlUCHVq1SN5D+6XwBHepqRALjGrBqccx
 l3j6Ik0VXG/R19QV6DFQhHzA5SUFLvd6i0WdDox8AJi4u4Hme0YyicsfQ0yGuIFB3nKLzdE9Vao
 0eXIdNh3u00/aVi4B9B9QmfSxlodiuGftBGcMkEZ3y9AxQ9qg56scWzblxsKPk262rga0JCnVOf
 YNrCSh1p+tafYkhYJzvUL7pEdhAAMGarvFeqCinGv/vtsMXWZG4TbL/U09bswkmSN4HsOALz8DE
 3VQFAjVxW6YFO2IkLewtSZwT6jXDaSZDHjPyasR1zNc1fSDlH9wrGzukuZrjrPOYo3l3V/d4760
 bMkvKlHF8jtI/Rqs1a3Z2NRsoEr6qE1iveHZ4BcqdeZlUBi+Jrx53vUfI+V1BkkS/bVylxsEaIz
 5wZTkYc9Og+Bvh2MvU+lE4qo6LlOYXRGuuCu4nKW86aCKMaAI8s0How4IjEGIUVeZIkyGu7a4II
 eqw/CbGmtuzt/OE6VUPUfQ37QSkWYhVzHRlx5xMOTsaXr9KzTCnatjQcuF73mfur3a49HUi5i3G
 j+GEMBVz8vj3QYQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8349

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-1.4.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-1.4.rst b/documentation/migration-guides/migration-1.4.rst
index 6db2a035b8..5d8d0ffde8 100644
--- a/documentation/migration-guides/migration-1.4.rst
+++ b/documentation/migration-guides/migration-1.4.rst
@@ -82,7 +82,7 @@ Custom Interfaces File (netbase change)
 If you have created your own custom ``etc/network/interfaces`` file by
 creating an append file for the ``netbase`` recipe, you now need to
 create an append file for the ``init-ifupdown`` recipe instead, which
-you can find in the :term:`Source Directory` at
+you can find in :term:`OpenEmbedded-Core (OE-Core)` at
 ``meta/recipes-core/init-ifupdown``. For information on how to use
 append files, see the
 ":ref:`dev-manual/layers:appending other layers metadata with your layer`"

-- 
2.51.0


