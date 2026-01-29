Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD1AD6B082
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:50 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17129.1769700286286647108
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jakYGjbJ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9E3AFC22F47;
	Thu, 29 Jan 2026 15:24:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F4A0606FD;
	Thu, 29 Jan 2026 15:24:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1397119A8865;
	Thu, 29 Jan 2026 16:24:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700284; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FT56Ou8bPYYmZWJhKppAP85i6rmOwcdRYuurT3cQJlY=;
	b=jakYGjbJgvDIQuR6ZG9m3vmDyx9u+9KGMpJPs/Ffcg8d4j/83MDtAJr8nGZN3Nn4OOWeyv
	xP4UaRbC+Mk7CCGLWQaoYfsHaiNuj94nrXlVRhKlrsu9aMRVoDJMeTWed//tCAY61YdUk3
	HTPZMMBn93vqstIa5RxjCeN7i1G20576dF72tRegUq9l+Jfy0TeWHvYh7Y28m7xZSu2Ift
	HOvTWf3ypXEaadqEKaQdmOslJq6nBysBI9ubvSgxgHnadY4nEVZzP8F/tHWE6VVZeBq2Gn
	gJI5UeVTfwpoE7A2e2V6XQszA6vsmAHr3p8CMjQEcG8Sp4R3IuUDS+gFxwxVQQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:48 +0100
Subject: [PATCH v3 57/57] what-i-wish-id-known.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-57-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=slsThUKHpnubLsip4+8LaLW34OHKFnuoROqTlMDo1VU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uS6qZreKolMsoG3Gtu9mUiebpmFaytB2jX4
 +J+/+l0X76JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7kgAKCRDRgEFAKaOo
 NlVMD/9lhD2v0i64sY6XLasfkD8/6gvAOEarNOUTY+RhkHhteraWM7NWhYpkHHCtZdbunbYBnDp
 PUfCrWDvQwWEIDtiLOIaYk64jKlj9ygosG2PjtTJfd6xEDjvX61Y/FYCNWZMp5+MAcaUANRoOCA
 ar7ZiAQLS55A3cRqsMEzocMVm2MPm0RfgM7QmfhkSVB+oQs+4Yk+lT0sAymbq2bCORzAeg1JRSP
 l158vzuB7a3WLbSDerL/e3HCA1yZ0u24ID0Mf2tZ/q+pR/+GP/4ze1qUY3CkMpN75cAu6GGyNWR
 6bUbwbanloeVjdyyCRnt7qCMttd9S6G+P2YzXtPTJeE3hof9mhYqHTEKZYvNdyRFbwZd8Vc3kDc
 tYkf4yRAsFp5nueZumZERxro/GulR+eT2iDnxXsf7oeS7hqAQa2AXaM9BgxkwzzWstj1nnTrvi0
 jJIrqmjU2jCjBF8Ojb1BsbYgfppq9j/Th47KUGTdyBM8SbbBap1tpgI1vnE6CJsSdsSUUnI9aVe
 +LuIjkiL42uThhjCBtweUgLL9ddszb/tyBmeNos9T2qTfL0f8b7p6bZdOPW+apgTg1CTZHTDUNE
 TQaXMZer4CyOh3ciT8Re1rH79rERr9zksmt7C+mVWvTlpmf55ZhXJXigYpP/73XbMHDBbZph9Ng
 WY11gPBkH+EPZkQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8843

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/what-i-wish-id-known.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index ddee6ad74..36cf715fa 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -60,8 +60,9 @@ contact us with other suggestions.
    layers, on the other hand, helps keep simplify future customizations and
    reuse.
 
-#. **Never modify the POKY layer. Never. Ever. When you update to the next
-   release, you'll lose all of your work. ALL OF IT.**
+#. **Never modify the core layers** (:term:`BitBake`, :term:`OpenEmbedded-Core
+   (OE-Core)` and possibly :yocto_git:`meta-yocto </meta-yocto>`). Never. Ever.
+   When you update to the next release, you'll lose all of your work. ALL OF IT.**
 
 #. **Don't be fooled by documentation searching results:**
    Yocto Project documentation is always being updated. Unfortunately, when you

-- 
2.52.0


