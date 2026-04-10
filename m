Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70955E9906D
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 09:48:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152537.1775814493966588789
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 02:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=t6Yg9CuR;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 85870C5C1A2
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EB22603F0
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2FEC10450637;
	Fri, 10 Apr 2026 11:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775814492; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NtIJt+T7suYAmOgwd5Y0U+Us7kooxoG/Gu+DWItXreM=;
	b=t6Yg9CuRsmz4vV35b4S+2dlQNg042eTT0dyG4eGTmXpVSxLLWANYFcnLTiIif9cuECbid3
	I/bqiDEUj1Ruw5Zl40tL3PkhYVFzr6NrawOOnkGF5QDYLVSmcfIAtEzIg7H8LJ/ijW9XJr
	GAhadCwAAe3NELYLS/c8X3RjgMvLimJUt0EJMi0/43Ok3u+88jMA03HPYYs/8gmuMZKeSt
	2F4e8lLEe1ZTwRbVT1tiqhG/GhCB3sQ5bCdLhr4B/U3lkgvSQgvElpMMa6GidDeQdL/LPA
	f8kLolNiTJ5Is6pfAdlxoODEet5h+u6qq9OFBt9RhfEhehnV8JTnZVmGpfs9XQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 11:48:02 +0200
Subject: [PATCH 3/5] tools/build-docs-container: update fedora distros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-update-new-supported-releases-v1-3-fc53a1fbbdac@bootlin.com>
References: <20260410-update-new-supported-releases-v1-0-fc53a1fbbdac@bootlin.com>
In-Reply-To: <20260410-update-new-supported-releases-v1-0-fc53a1fbbdac@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=QYeUyA4ZR5JaX513vqcpXwP6dew0wc7mBpJACLv6Dgo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2MdYthig2Iii3tGXo1JgvstLufSs4NePFmyKq
 3CGYOo8/Y6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadjHWAAKCRDRgEFAKaOo
 NgopEACILeClLlaBFjNeuWY+/iMbGD/gk0hk3a+JdX2KWHNDieKRNXDQpKTZkejRdTL0VZAx1U+
 AVPdzbNXvHEjd/TlFCtTPM/ZpjCZQyfZn+TBGnUKxF8vA5uGbgbR8Io0ndm0sev1QqkNNGuXC3Y
 6PD/avyszKLSIwXCelYL2J2QFzDZzwT0kqWNSpnLHf4Jl87zcJhNio1eGweTiQZvB47N7iZIj+F
 YF/xNgepakzFufeIaZ6+Vp5e+gFNOk7h+ftlDaEeGwIM6I0mDCoDvF+79ze5rEVKvrUX6sn5F1Y
 DfWkL1EV1NqZsqAlSkSEaGMrmElFTQySse+VfM9WGirb2QZCBK2htCvJNRjF5Qurk8A5vwQ/diJ
 D8meqWyjIJbWYbO4bKEhLlOX1mI+2ZnK4tZnRe99xmfFmeV6fKWHfZHu2G/sx758iVxOWE2mabs
 bdWVS1dXsfN8HQrNjyaxMNdm20dj5w698wnZhBUkn8Lfr+5eqkDaUo9gdN4v1eu+PfmvAuMa5KU
 uGNbGbWNaeAZq+JRVrl8ziqGJW0QJNee0RT2T9rmnPJKLfA6Jhm7JFc8MXSQ8tg/DTaO3HD4UeA
 V6zJZTXOXslNwIyti0dObMAWC12TRg4wtL7Dqrpf2Gq4qmkDsBNb5dHkbOnDw6jBma3IB7Nzqr5
 2JiseRwUgZKxIJg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9216

After bff5329a82ba ("poky: Update SANITY_TESTED_DISTROS") on meta-yocto,
remove fedora 39, 40, 41 and add 43. The current script work fine with
F43.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 3909839d7..9cad3de49 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -38,10 +38,8 @@ $0 OCI_IMAGE [make arguments...]
      - centos:stream9
      - debian:12
      - debian:13
-     - fedora:39
-     - fedora:40
-     - fedora:41
      - fedora:42
+     - fedora:43
      - leap:15.5
      - leap:15.6
      - rockylinux:8
@@ -118,10 +116,8 @@ main ()
       docs_pdf=ubuntu_docs_pdf.sh
       pip3=pip3_docs.sh
       ;;
-    "fedora:39"*|\
-    "fedora:40"*|\
-    "fedora:41"*|\
-    "fedora:42"*)
+    "fedora:42"*|\
+    "fedora:43"*)
       containerfile=Containerfile.fedora
       essential=fedora_essential.sh
       docs=fedora_docs.sh

-- 
2.53.0


