Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3936E674A1
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 12:28:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79092.1766406493342234625
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Dec 2025 04:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MJSunG5Y;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0DF484E41D30
	for <docs@lists.yoctoproject.org>; Mon, 22 Dec 2025 12:28:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C180C606C1;
	Mon, 22 Dec 2025 12:28:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8F7110AB0279;
	Mon, 22 Dec 2025 13:28:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766406486; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z6rGL2rL6WgOp6KGowh4rDLrynd2qdGlEV/8RXmXUDM=;
	b=MJSunG5YKWtWXVitoZIkbq0VIG45eARz6rw4e/vrDPiXthNqdWx5KIqCLzuGzAtXm2IgVw
	gDygW07HxqDZPdkg4GkpgHaMi0geDvLCDA17jqNWXc0V9WVEL5n7ph1jFhvh3c2kDF7NV3
	JKg6OMX/MA7F+o6TT99PVPqzkyfcUwyITTL6UJow4W7JbpFmqfwhHTHzAiJmFE3BGg022r
	tgPDB+xU3S4asDHIO9yk+kFteMYODdoJFjs4js7w8llJOZK9DXz1rwRvjhTCNTUBfVYlmM
	OVzYZEqnImLu1Sai215HjgmyzpSjAsGUf//JYX+82nARgnWZ4xxd2hY195/G1g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 22 Dec 2025 13:27:47 +0100
Subject: [PATCH 1/8] tools/build-docs-container: guarantee the image to run
 matches the just-built image
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-concurrent-safety-v1-1-e3d86e44cd38@bootlin.com>
References: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
In-Reply-To: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2657;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wxbknoXOLBdBxr7+zGmqY+0ewZJk3/vF4046VoCSQow=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpSTlRFyaZhGtl52iwLZpJuhC5dTBhfrIITv085
 2Rwqk6z6ZSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUk5UQAKCRDRgEFAKaOo
 NobgEACD+u+htexRm8CVVjlRXKjV14cvczQ31+ARpJyxA0A/EfT7FHkCTnqdHjA5HWqo6zWaasf
 k0lkajdj8RTeinpoaHNwSZbHdpNXXKsXXZdNlZto9uRoe4wJuT5fdc6DwS5TLirFH1VNNLhZNnD
 ZeIATzAYUXfwq29Z++pczuuXEVr+G/n91xoGXE0BN9V/p80GApkER6Fge58MyUghfbYdm8xZfEV
 RrA9jOcyzJPy5fAUBAwoQCGMcnoWHJzMyzkYwt2Eh9rilOgnwjP71pl/a2YtZ3d4joPejJb5moZ
 30N08raxcXlOvE6R7c8dMAmf/HuHpkz0SIEIscbi2vttZnXjEX3UYzTcT+hgHkA7M0njF7GqWDu
 uoQ+7ULOT/KbLOLk2xgj5o+wQ+F8jyMb7v4TuxnRuyBTel0F6KmbY+DCfoAJz68+mR14CvCF7oS
 yVd/z+z/QsEVslm/6c9/q5L3iii/Hr3NJTYUiV8dQqFJfNxDzM5qZl0n7ACd/TqFSYCVknxn19T
 3O8WbEqUEJ3oIzEZ8aerlB5kCzDW7U7w9S4ZVKwLEXsm5/XPupxF6k9xbCL4gyb4HT4WtrrhFp9
 1R3DhXYWWCsY4+0lprWjyNt+WCpb4f9N6eEWB+/IoU2DC0+ZuKpM+7mLdWUIeNlkMcT0/c7cUtx
 xpC2lfLRT0tRp5A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Dec 2025 12:28:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8310

From: Quentin Schulz <quentin.schulz@cherry.de>

We aren't that interested in tags actually, the only thing it brings is
a belief that we are going to run exactly what we just built. The issue
is that this is incorrect.

Indeed, one could simply run the script in parallel for the same image.
Script runtime A will build the image A and tag it X, Script runtime B
will build the image B and tag it X, Script runtime B will run the tag X
(image B), Script runtime A will run the tag X (image B). Note that this
problem exists whether we are building from the same tree concurrently
or from different yocto-docs trees concurrently.
One way to fix this could be to introduce random numbers in the tag so
that it's always unique, but we would be flooding the system with
useless tags.

Instead, we can use the sha of the generated image and run that sha
directly. If it's the same across rebuilds, it'll stay the same. If it's
different, the sha will be different and thus we are safe from
concurrent use.

The only downside is that we cannot infer from the image sha the
underlying distro we're testing.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/tools/build-docs-container | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 23c3dfe33..2f31295ed 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -80,10 +80,6 @@ main ()
 
   OCI=$(which "$CONTAINERCMD")
 
-  # docker build doesn't accept 2 colons, so "sanitize" the name
-  local sanitized_dockername
-  sanitized_dockername=$(echo "$image" | tr ':.' '-')
-
   local version
   version=$(echo "$image" | awk -F: '{print $NF}')
 
@@ -159,8 +155,13 @@ main ()
       ;;
   esac
 
+  local image_sha
+  image_id_file=$(mktemp)
+  # Don't clutter tmpfs on fails
+  trap 'rm -f "$image_id_file"' EXIT
+
   $OCI build \
-    --tag "yocto-docs-$sanitized_dockername:latest" \
+    --iidfile "$image_id_file" \
     --build-arg ARG_FROM="$repo/$image" \
     --build-arg INCLUDE_ESSENTIAL_PACKAGES="${INCLUDE_ESSENTIAL_PACKAGES}" \
     --build-arg ESSENTIAL="host_packages_scripts/$essential" \
@@ -170,6 +171,9 @@ main ()
     --file "$SCRIPT_DIR/containerfiles/$containerfile" \
     "$SCRIPT_DIR"
 
+  image_sha="$(< "$image_id_file")"
+  rm "$image_id_file"
+
   local -a args_run=(
     --rm
     --interactive
@@ -193,7 +197,7 @@ main ()
 
   $OCI run \
     "${args_run[@]}" \
-    "yocto-docs-$sanitized_dockername" \
+    "$image_sha" \
     "$@"
 }
 

-- 
2.51.0


