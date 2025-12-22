Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF04E674AA
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 12:28:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79098.1766406514533342235
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Dec 2025 04:28:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=n9yrIpOK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 07BCF4E41D33
	for <docs@lists.yoctoproject.org>; Mon, 22 Dec 2025 12:28:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D1418606C1;
	Mon, 22 Dec 2025 12:28:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0903B10AB0285;
	Mon, 22 Dec 2025 13:28:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766406512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c2xvQDMZZqbrX3uAzy03/tm5rWUC1nNJGMxf3/RDpRU=;
	b=n9yrIpOKRAbOLrRzLUA8qsL4+bh1IOUglt47sQoXTNXxfdeOHRddUU+Ej5rSnLJ1C7mAFF
	VOEs0ER/GbaqRTs9mIfOeeokSIsWBgjKnTYs+dGRap+aTY41sSLOgBKrQZkyhpgNmjvSQP
	b5xxxSUYKm0/NLoTLRgDHi2ZYUo+wjKZdlmvlNDbl9nie95Pamamzw6oetj5Nr9YFYIMUO
	eieGqGMEs6tDVZ6jtmdSkG4AZhM2fMtkQYMGnvPNiJsn0QbxjmlQAd8vSAhDwyO0784xbr
	0HlIbyr+eyO23tIov2sXLjM2LVF3/XTLfcfYsCEKGxVBi0I+w2bmG6YjD0BPHA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 22 Dec 2025 13:27:53 +0100
Subject: [PATCH 7/8] tools/build-docs-container: allow passing extra args
 to $OCI run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-concurrent-safety-v1-7-e3d86e44cd38@bootlin.com>
References: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
In-Reply-To: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1450;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=gZIGPtvwz+mim1Qp/5DSZ2kUhr8mOC+pJa9AVx3S3HE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpSTlSA8/DazysS0lcLuaHc3uzJU2KSHsS24UcX
 SeyQFOWCYqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUk5UgAKCRDRgEFAKaOo
 NruWEACHHI/CQIHIGumQEM0+VePp0/J6WD7FsXuFDhBrxIm7sViNGd4gb4NOnpOvosGRAUNQY40
 enryxEQIVAiLmJwNXH3SDwKPJmoSLMplS2QBy73UCbNIUxrby6M0KzQ4NaX5P5ytbDkSWBPJrC5
 3ItufQDit7phxXmcFN98mFr/akfo2Ya3Rt1UjbHgMsBolGAR+O+mnFmjVriTDVv0Sz2ZU6/pjVs
 2dPoW3w/sPK2+3ykzuBW5HP/voEIb1O1iZn7mD2W4tn4l9+xSBkeG/vL1gGu+Z0eLbGMCanKvb0
 f6R+0//oIq04RE5JF/fLwWldBf80e5yFmJzTlTzFoKf/PxEHHftbatFxRoFefRSVpShUV2ezP27
 6TZZfRQg2UfTqkcnCmGrMMdOHBZxN3QUsvytBqjnfLedS5jfmpF711xU4DOOqlSefwpVCsp5Cv3
 heKPhcPhckCwG6r++uWaoxpp+gS+7nCKXTs/LihP0FevnIHuU98517TeTfC9v5kJP2jsOnVXX3G
 JoPX+BeSVW35bxWfPrAsZvZH/rdNgADeaB2CKq/UhqhCkAobbMsv+wOmF27Ep2gbWMmL64a+oMB
 dIFpGJg3OTw+xkiatqIbauACVxsi5ha2jxQ6ru+ijlrt3awj4fYFeWN+c4eQEewGPE/q1IYw7xL
 4gDhR6zlfC5Y5wQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Dec 2025 12:28:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8316

Add a OCI_RUN_EXTRA_ARGS env variable to allow customizing the arguments
passed to the podman/docker run command. For example:

  export OCI_RUN_EXTRA_ARGS="--env=SPHINXOPTS=-W --keep-going -j1"

To limit the number of threads used by Sphinx. This is especially useful
for parallel builds.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 7a5191710..c5cdd9c4c 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -25,6 +25,7 @@ CONTAINERCMD=${CONTAINERCMD:-docker}
 DOCS_DIR="$SCRIPT_DIR/../.."
 INCLUDE_ESSENTIAL_PACKAGES=${INCLUDE_ESSENTIAL_PACKAGES:-0}
 RUN_NON_INTERACTIVE="${RUN_NON_INTERACTIVE:-0}"
+OCI_RUN_EXTRA_ARGS="${OCI_RUN_EXTRA_ARGS:-}"
 
 function usage()
 {
@@ -69,6 +70,8 @@ $0 OCI_IMAGE [make arguments...]
 
    - RUN_NON_INTERACTIVE: when set to 1, allow the '\$OCI run' command to be run
      non-interactively, without a tty.
+
+   - OCI_RUN_EXTRA_ARGS: extra arguments to pass to the '\$OCI run' command.
 "
 }
 
@@ -210,6 +213,9 @@ main ()
     )
   fi
 
+  # Extra arguments.
+  [ -n "$OCI_RUN_EXTRA_ARGS" ] && args_run+=( "${OCI_RUN_EXTRA_ARGS}" )
+
   $OCI run \
     "${args_run[@]}" \
     "$image_sha" \

-- 
2.51.0


