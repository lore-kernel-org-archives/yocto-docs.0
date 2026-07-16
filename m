Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9284CC44514
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 12:19:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11535.1784204352395558834
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 05:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=J6nDgkNz;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C8385C2B9EA
	for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 12:19:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78663602B8
	for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 12:19:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA7D011BD3CCD;
	Thu, 16 Jul 2026 14:19:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784204350; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5ACFbcPee9o9C981IDxQehNsbru6vAayk+RtzkVKHt8=;
	b=J6nDgkNz42P6AQ0t+59aMNM/wqDvW5Rzt4OE/nscZD4CYNFiLD3uDSL4tvOw6EEsyHDurp
	2lN9c4ObSEE9V0ojzYofzhIAGUh+iummk2TixZz374n3t+xl70G+UmFFg6iXUbLp6QAmqG
	cXhshNfXOMWqqq+PRdD/W+MM6+pEOJXX55vkHNBglBuseA4t/qwMTd+dZ/5j5J8N5r9lK2
	mdBZIMTgJxLjAfkm+Y/ivRurpjFQ7XJIAODSOQthekMJS+dbPFYh6PJN0jidK95PK4JmPj
	1L+LYHDdOvTp0ChqH4u+llGsr8K/CrAZSZzkglAw+jVyq5JVadQ8DEP1roM7ZQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Jul 2026 14:18:32 +0200
Subject: [PATCH v2 2/4] ref-manual/variables.rst: remove flags from
 variable names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-gen-doc-links-intersphinx-v2-2-83cb3aef6ff6@bootlin.com>
References: <20260716-gen-doc-links-intersphinx-v2-0-83cb3aef6ff6@bootlin.com>
In-Reply-To: <20260716-gen-doc-links-intersphinx-v2-0-83cb3aef6ff6@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=dEY/m9UbHefP/YHQBAUdtvJ26OfBqqCGu7IsxcWRR/M=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqWMw6HXIZjMPE9p07DUQKyjc9Zc2B4iqI4z0VV
 MvAwJDwi8iJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaljMOgAKCRDRgEFAKaOo
 NgYYD/4k5g7Zk5vdRrlOJ5iXhoA6SuDcVPDl3+hf+rJgANGnHd8DqnGrgO1zamYit5g5SJHnxeh
 t+J9KdOBc876okLoqYCYzPNdwIcuUzNW+KI3NC6tarAD6hsK9IgGk/IdBeOeqhqAaZE1HCrS9da
 orldp85TJjiBAKoUfl4YVriLx3+L2n8SL0xaxIT7D1EiHseSXSCSWVywQsYXxKNqezlYaqbGZSc
 76DLLu58M4VB5lMyxbzZbOatTeFVIpR1WKI9NYzemrFVuC3HCcO+2yygZfutCmU6ydUwp/jeRXW
 NpW8/mV00nPdHA6MJBdKUD3MGirD80zbZ6mQb3r37Pu9c4VhIkIgdOIsduzm62bZSRT9nLDFeVQ
 3veeL1PEW17450k8ajOOpPAzsNLAXLQTLVJy7R6dCXMjv6KGaTApZF/o23hEVrpTMMwDuffSdYb
 O3ibgve9UNLnNqOFVd1FusA0OwwpYDMVZ5oT0sLDwWTLYXtsA1kkgvQXm3+ESfDc1y6tOj0SeQ9
 PzRrp6EXoJ4GtwHP9RHILS+yY6x1M6Xsm1gChns93fANig7npNf6DAA4LPQosbaWmLdJNveXkDk
 196xQo7OjOogdrcw80c2cG+uMV622cvNGIwdnfsQ/dx24g52ljDEzylCFYjYgD3m9bd/OJjxnEE
 5mLwZfGNfziDxFg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 12:19:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10086

Remove the flag from the variable name as this is not going to be
supported to generate links for OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d73790337..e5fbf8a69 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -11416,7 +11416,7 @@ system and gives an overview of their function and contents.
 
          TUNE_PKGARCH:tune-core2-32 = "core2-32"
 
-   :term:`TUNECONFLICTS[feature]`
+   :term:`TUNECONFLICTS`
       Specifies CPU or Application Binary Interface (ABI) tuning features
       that conflict with feature.
 
@@ -11428,7 +11428,7 @@ system and gives an overview of their function and contents.
 
          TUNECONFLICTS[n32] = "o32 n64"
 
-   :term:`TUNEVALID[feature]`
+   :term:`TUNEVALID`
       Specifies a valid CPU or Application Binary Interface (ABI) tuning
       feature. The specified feature is stored as a flag. Valid features
       are specified in the machine include files (e.g.

-- 
2.54.0


