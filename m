Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F908FB44D6
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:28:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16688.1777019335624753231
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=u09XjIAp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 22FF64E42AF0
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E898D604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DCDB10720728;
	Fri, 24 Apr 2026 10:28:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777019332; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MWTq4hvcJGtMWj3y91cLsWXwvqTRJg/B9aP6KKKw9/s=;
	b=u09XjIAposyarbDIOPodt0jOalmoae6GEnUglbQTMaay24Q91WCR5hC90iDG74wKk8OYyv
	g7WX5qq2YMtNFcZdRIH1IPPrvzvLAh3SJfEwfOuTp/eLzCemJgQXFkPOlGIE+Y+n7kDbEm
	sLyrdE0YIuwz9e8P2RSbcpzoJNTT5LrsqWgE/vbIJ3++pmMsKE1W4XpZBh+YQHTqCczCvO
	IHqqdWUJw95aQoGpP9aescz7X2BN5LLHgbPWnXMed01l1HG88449GcVEMeF2ELISTv3C2r
	gJ9XWCefzJdUe29yGIFGYRG1VAbzmGMPjUm3hTDHOdxjaaaGhLQa1g8TszIxbg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Apr 2026 10:28:33 +0200
Subject: [PATCH v2 05/18] tools/build-docs-container: add CentOS 10 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-third-release-notes-6-0-v2-5-4feacf138e13@bootlin.com>
References: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
In-Reply-To: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/8EvO30rwwguCJ0XPHXvdnKjSGV1Ho7Um0yxc/+0iOc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6ym9V4pV75OiJ/QPmlCgG68B9jlyrD8DYo+IM
 ByIJGTeUa+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaespvQAKCRDRgEFAKaOo
 NsUZEACUmkmgNxMUjWQtSjN5d6YDIYpqcn6ZJ5+4DUg6svl/J9Ffis1DhegxwiItnYyGbg3G9jv
 Z3F/hjysmspQxxd1hCRNJy3fhzGltjx/qD0aAppqDV2GmDfajBkFtwU3AOLjqOTT5Hpm/lvj1H6
 1SCb223BFnDnMdWLb/UTtP3pA19hhZMnc/I5Rq9laZWFBVMBHjKjZTOZF/+w8yehvA0yaibEVYW
 5pRdi8aH6aCGD/kEXa+hWW89kbQ5aTkmcJyOQiJwTXk1EgY0nzBQ1AZ3UKX8jO+T6ucfpnB5Xjr
 vA8AKvJJOad2J1jEZAJAryaBVHpvMkIo4BYx2XQeGV/07+xkkqSOMej6lHkTDOewwMljjpjMejD
 jY2ozGni8P9+BtgGm7mTUPBv6ks7RyCY/1NYzz20SngP7+LdDsZMeJWxgX3UwAgd98rnX+BFkP5
 mTWJwe+bpR3VvMSzGZjyydyEJXUJieXXbOiaszfzcys/oPNOnSWC9OMAhZicHtLLT/NcGc6Avbc
 jsuc7sv2s3OHz77VnBTUUeLjSwJW2XwOqt7C5exLgPFNgQarLassd7aSVXyrPafme9K4OIRMInN
 JnjOX3ZGxncO4wtWKOeVUAvA2DvypKGocVNFEcnn9fJfiFUqthtCvldNNmanZrfvUh1JIHoJlO3
 eMrqfhkyESgcoow==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9343

No issue building the documentation, and including the packages from the
essential list (INCLUDE_ESSENTIAL_PACKAGES=1).

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index ab8314901..37d3d2bb6 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -36,6 +36,7 @@ $0 OCI_IMAGE [make arguments...]
      - almalinux:8
      - almalinux:9
      - centos:stream9
+     - centos:stream10
      - debian:12
      - debian:13
      - fedora:42
@@ -98,7 +99,8 @@ main ()
       docs_pdf=tlmgr_docs_pdf.sh
       pip3=pip3_docs.sh
       ;;
-    "centos:stream9"*)
+    "centos:stream9"*|\
+    "centos:stream10"*)
       containerfile=Containerfile.stream
       essential=centosstream_essential.sh
       docs=centosstream_docs.sh

-- 
2.53.0


