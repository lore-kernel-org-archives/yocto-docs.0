Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE672CCD18A
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 10:24:16 +0000 (UTC)
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
 by mx.groups.io with SMTP id smtpd.web10.8913.1760005454249939447
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 03:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.12, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cj5Zh69N4zdXV;
	Thu,  9 Oct 2025 12:24:12 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cj5Zh33S7zrVH;
	Thu,  9 Oct 2025 12:24:12 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 09 Oct 2025 12:24:01 +0200
Subject: [PATCH v2 3/3] tools/build-docs-container: build in separate
 directory for each distro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-iid-file-v2-3-715d527457f0@cherry.de>
References: <20251009-iid-file-v2-0-715d527457f0@cherry.de>
In-Reply-To: <20251009-iid-file-v2-0-715d527457f0@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Oct 2025 10:24:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7678

From: Quentin Schulz <quentin.schulz@cherry.de>

This allows to compare build output from different distros if necessary
and make it easier to make sure we start building from a clean slate.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/tools/build-docs-container | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 831d357fb..47320e182 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -60,6 +60,7 @@ main ()
   fi
 
   local image="$1"
+  local orig_image=$image
   shift
 
   OCI=$(which "$CONTAINERCMD")
@@ -159,6 +160,7 @@ main ()
     --volume="$DOCS_DIR:/docs:rw"
     --workdir=/docs
     --security-opt label=disable
+    --env BUILDDIR="_build-$orig_image-$image_sha"
   )
 
   if [ "$OCI" = "docker" ]; then

-- 
2.51.0


