Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEF1E674A4
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 12:28:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79094.1766406499351903144
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Dec 2025 04:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=I0QdngrP;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B947D4E41D30;
	Mon, 22 Dec 2025 12:28:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8ED40606C1;
	Mon, 22 Dec 2025 12:28:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27D7910AB0281;
	Mon, 22 Dec 2025 13:28:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766406492; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dopXXvzV0TT/ICgwgqbz8LxQlW5lb1BICl72f6uAmWg=;
	b=I0QdngrP253R7DInr6g+pTvCotNjLE6shYI5kdYL7q5HtIyeFVhET0bydk+yf4lxcDjYVz
	7q1kCF7W9xXnmdX9bd7cTcGytlYgYawZcCtJxy6k5UfRItZgcAglYXrfAdYnl+RtRN/vMU
	ffnScDkJ50ENfiiFC/TO1y9GgCImPlyrGYYS7WgviwJO3O/sIMbQ5nHPI3P4YOdsekVI+g
	z+P0CtX4Ils8oUwZgmBqPeIF1bpTgjv7/XTJJS4tTR08qo31BtIk/WzPnTfu/F1h1YMl+Y
	BWzgiDUhjvS9cPrxdLmLch5IUkTDR5eQxGVb4xlgJRigpvJ5QjVYp9naABLedw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 22 Dec 2025 13:27:49 +0100
Subject: [PATCH 3/8] tools/build-docs-container: build in separate
 directory for each distro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-concurrent-safety-v1-3-e3d86e44cd38@bootlin.com>
References: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
In-Reply-To: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Tbhu1/jXuil5FVVpzcwftyMKRCyuTNVNXdRLLJzzJmY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpSTlRUcsUr0Q7+VhJE3EyN1AbJFoo/cjRLOoMd
 qbyOKqPbtGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUk5UQAKCRDRgEFAKaOo
 NlCFEADD13Gl37bV5otOFQ9A1OqgplhPs/SqJaAPRbbMMT0v8/6IfZ6isClbggVYXQRrAXjylLQ
 Yt2fnBqQrPXeU3dCPxBwFI15gDd1bDYM0o8Y5MFRoIfs5R1gJCom3PTO3GCZLFJK61D48qTW7zj
 jRE7IQGtv+hETpk3MtyCiW7U7cl0Suf1P1oJAPWX5tyl0rdwKKrZvBk7ZEqmmLjH8HkiIjouSCF
 Xrh5nR2kuJZopB5m9iBIoSKbM/PJYvtOJgg/SnPYLtXVp1FOV6XAekVFB8IcQvgDkoM+45+tIDU
 O5gkPl3ymEAyTt+vrN3tZMcdRTTDS43Bbi5Z7JmulYWrF3WsP2fPNB0j5a936H5X0pajK75xIAE
 mVLAcCjmQ9LxJzkVD2rlqGsJD/lUSosRnVCa+NPDO3IBmf6FJlwxb91XaXqf1L0QXo8NpSBUGjH
 FghxEfFjehtlc9jePQeMxEb67GiGfEwpGn08EwbMGv1ejs6nN2VUJamk3rmpVpkL/H2gTdII7sV
 5DBnhfNyx3Sou7OuvKccFmgZON3ijc7oxO8h0g528mOXSyI3/4nM0e/i+pAmnviZeCKu9eyRB81
 VAdVB5QHQ+Yi+7qV7Cu0uwSHx96MRWSENmqXHHHWZTuxfq8WgSCUzqfoP54Mx6NKsvW6CnReLW8
 wgNjYs63phRPEbA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Dec 2025 12:28:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8312

This allows to compare build output from different distros if necessary
and make it easier to make sure we start building from a clean slate.

Co-developed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 2f31295ed..b377777ed 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -76,6 +76,7 @@ main ()
   fi
 
   local image="$1"
+  local orig_image=$image
   shift
 
   OCI=$(which "$CONTAINERCMD")
@@ -181,6 +182,7 @@ main ()
     --volume="$DOCS_DIR:/docs:rw"
     --workdir=/docs
     --security-opt label=disable
+    --env BUILDDIR="_build/$orig_image-$image_sha"
   )
 
   if [ "$(basename "$OCI")" = "docker" ]; then

-- 
2.51.0


