Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA7BD6B061
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17107.1769700267922890150
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZExQp8Ip;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4BA88C22F48
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 49669606FD;
	Thu, 29 Jan 2026 15:24:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80B74119A8876;
	Thu, 29 Jan 2026 16:24:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700265; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NCqCo/b1MZa4OC5vrY9VUA8rSKR0GZNy/OoKZ7ZGSD4=;
	b=ZExQp8IpvExeMxgRzwqauLC0CYdMPdq/zCqUpD1HCrv/645HpDKqEGMUhnWQO+dlwjXcuH
	ID/oEhup92fVD2K3KZU6ogyVAKGRd7Tm3jN2SiCvZBP0UZWeYiq68DmirWH8TInROWubl3
	hZloZDtE7iePA96E9rPobwTSX5lUdwkKBk5ul2kibxARZu3gPJtyDgGzMxD9/bwFA+4Vhd
	v7dJocKKbnajE9cUNIStPVLu9bH5fmJf3JAA3Vjwmoo2H7jwm9Lo77iNMS1Di72/LGto2m
	HS7l6pY15mkga4ROMdDY5HzvSrMKmEbE8JxyoQMfLZCHx/Ss3mnwDdf2LNdSrA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:24 +0100
Subject: [PATCH v3 33/57] README: replace obsolete substitution variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-33-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=SSk4gs0Wl+3OcvDgNod04W5CxW+0WvJBuqTPOPWE7TM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uO7rbrrNmG16+howyFjakn6hPryBVSLfOao
 ldN0ga7EjOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jgAKCRDRgEFAKaOo
 NlPpEACCl7eA+cwnX2Sjh+jTW5KvkgYBGHkWiTuPKXzD89oL/IUDEOuBTQWeH6CML47CCMDfOl0
 JqgvDvrFoDAdNP2adlz5vPLPxCAhfBdZhdzQ1ct+R7eCF4zK5I/0vI0kqcXcvsYd8dNAm8oCVG5
 YmyHmgsKZhrIXQqw502QUoChvzLeaFqAb6BS6neZ3p1ZEFtPY9KfuGmJ1kmKucH7FUQJ4I1Fy80
 +Q4qkBaOXX6ctXx62sxDBhwiL1a4CkGfp0UYrpSLMcLNgD14fXcmWa2I5pSqLQGr3GFGwfQEae5
 q4iZ9lSHYNxbmM2eJBt0igNIUNfhpd8QVl7OQTVn470i5IoQoi2Xbs67bOTVIbtBCv8XInIQ2Gq
 u7ZUIi+bZ9XHXvQBVjD/qTErY1XOG8KsvPWspATCMlfBw/EVaKMy4m1lO6pDtJcrrZDZH+QeHtb
 tG00n6IkwovGJNauU4Bui8eCGJPfyQSVt1/o2cFTTKs67CuMfi/oTLfczBzkP9vUH4bLS/etAQ2
 /BNmE4cM7R8/KKe+D6PoQhGaptpe4/mvxUsxuozc7B3u5DZkWILFotVhzTwNo0Qni/GaUmFNNdZ
 ik3+RhCP2hnzH7Wyev4BdV3MMKdJ5BNBzxryR5N9GtiiemzCYj2Uz+mOyIG57LOpyuCUKneUXdT
 DQkUOzu3UB5CqSA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8819

Replace obsolete substitution variables by current ones from
poky.yaml.in.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/README | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/README b/documentation/README
index 5516d71a6..7c4472c73 100644
--- a/documentation/README
+++ b/documentation/README
@@ -244,12 +244,12 @@ content:
   .. code-block::
       $ mkdir bitbake-builds-&DISTRO;
       or
-      $ git clone &YOCTO_GIT_URL;/git/yocto-docs -b &DISTRO_NAME_NO_CAP;
+      $ git clone https://git.yoctoproject.org/yocto-docs -b &DISTRO_NAME_NO_CAP;
 
 Variables can be nested, like it was the case for DocBook:
 
-  YOCTO_HOME_URL : "https://www.yoctoproject.org"
-  YOCTO_DOCS_URL : "&YOCTO_HOME_URL;/docs"
+  DISTRO : "5.2"
+  DISTRO_REL_TAG : "yocto-$DISTRO;"
 
 Note directive
 ==============

-- 
2.52.0


