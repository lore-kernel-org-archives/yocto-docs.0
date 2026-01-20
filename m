Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F80FD2ED1E
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:17:17 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8795.1768922234236819623
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 07:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=onBYKX2P;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B8CC4C214F3
	for <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:16:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D8D96606AB;
	Tue, 20 Jan 2026 15:17:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C23010B6B52A;
	Tue, 20 Jan 2026 16:17:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768922231; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QQ0O5MK6PQC8G1VDTxDXBKHLjQtbj7y1QA+tmEEeFDQ=;
	b=onBYKX2Pk+OB1FOiA76Lxk6BNWWc966yIm99L80xwGXb0JaSqsTsyopQh+fEs2OavHZOcn
	htYJ1A2hIW/naRwgUokdfM2ScGEkp8TFyVwsujElwBjNmI07R/VvrbT/jYdmjtV71i9U8p
	7qcti9Zt+ir9+YEJG4FIJRuI2J699k6pVocgCqSmxgVY+rh3JYQdDWMBSDbqjO8KxQJmD9
	VATnra/wZvGdv4CY+njE9zPe2EIetKXLp3ACd+qQFh9jPzVlbv0h6N3zo/ucKSZgT2i43R
	a+DEufpOGfSEIU/TWr4CBgELyoUo9Tk2kj+10MVeH8oRw3Y5C1Kdsp/qX3501w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 20 Jan 2026 16:17:01 +0100
Subject: [PATCH v2 2/5] ref-manual/terms.rst: refresh the OpenEmbedded-Core
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-terms-refresh-v2-2-fa49d15b209f@bootlin.com>
References: <20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com>
In-Reply-To: <20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tRMAwWRnSk+0/EyXl48WfrY/RLoL03Sesi2v+U+WCcA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpb5x0vnqSEe0R5akkJUA+ZdSgy9/6oCHpQ7OdI
 JypnRZ9iVqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaW+cdAAKCRDRgEFAKaOo
 NngLD/9PEtQI1yWMelwhKPtA1N0yWPinyb8P1guOVgUJtxDQDqQADcP2qRVfRgXFpuL280pLJPX
 iCe98CRt4F6LAm/sHSM/WYAJ05TpfralyJmhyb8GMwUYVQdEpkjR39kuJ99qS1Ilw3WxKoIsizN
 sPcSll+f6Xg/7gLNyuGSJXIJ2KKSUbeMgmLczfUKT49RsffVIXT7XcKDW6Y8q3cDtlZqXLyBtCp
 ELJtC1YLTgM7FGyJbrmHVNkfvpZMIei+jzin7nT1AruPQxpbwhzhAMGXsLv/nhh5u8LKmNGf849
 Xs7F0pUbg97J8FMMR8J0nYhzb0hYItkGQtTxuk+orh4y5ANFLH5vCliyNjofFaJqyOzsCwuawCM
 GcG7nn3YAy6braqUgDHdoNKRJ3Phm5+q2ouXexE7CHSsGEu4aW+Qf08Z+HSl5a4zWWlk6EDj8Og
 Maigjq5TjohaSpXrXQwgc3snVwF702aEzmWqgOJ6wPWjTGnKPnvTaj3T01ChbgmO1jgb03n7B/y
 2gIP4BajVPXSSqTA2k2n5rmGVM7YgzHXZe6Y5VlmKA31eWu/w38cbcjrFiAaa22B/wBVaJCkG0o
 QNBwBSfT5aM0AdcMQZLsvbKjFu/3ALUID/cR2NSMM3AkBvK1E9O+vUtNXkUjdDEuS7DEK0QHFgh
 JB+Zvo42XKMRe9Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:17:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8595

After the Poky repository obsolescence, refresh the OpenEmbedded-Core
definition.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 93a2febc7..d908af4ae 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -424,8 +424,8 @@ universal, the list includes them just in case:
       recipes. The result is a tightly controlled and an quality-assured
       core set of recipes.
 
-      You can see the Metadata in the ``meta`` directory of the Yocto
-      Project :yocto_git:`Source Repositories </poky>`.
+      You can browse the source of :term:`OpenEmbedded-Core (OE-Core)` at
+      :oe_git:`openembedded-core </openembedded-core>`.
 
    :term:`Package`
       In the context of the Yocto Project, this term refers to a

-- 
2.52.0


