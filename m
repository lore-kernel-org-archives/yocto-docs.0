Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4095CCD188
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 10:24:16 +0000 (UTC)
Received: from smtp-42ae.mail.infomaniak.ch (smtp-42ae.mail.infomaniak.ch [84.16.66.174])
 by mx.groups.io with SMTP id smtpd.web10.8912.1760005453701236369
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 03:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.174, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cj5Zh0q6RzhPn;
	Thu,  9 Oct 2025 12:24:12 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cj5Zg5LBwzs9l;
	Thu,  9 Oct 2025 12:24:11 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 09 Oct 2025 12:23:59 +0200
Subject: [PATCH v2 1/3] tools/build-docs-container: guarantee the image to
 run matches the just-built image
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-iid-file-v2-1-715d527457f0@cherry.de>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7676

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
index 70e05f295..831d357fb 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -64,10 +64,6 @@ main ()
 
   OCI=$(which "$CONTAINERCMD")
 
-  # docker build doesn't accept 2 colons, so "sanitize" the name
-  local sanitized_dockername
-  sanitized_dockername=$(echo "$image" | tr ':.' '-')
-
   local version
   version=$(echo "$image" | awk -F: '{print $NF}')
 
@@ -139,8 +135,13 @@ main ()
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
     --build-arg ARG_FROM="docker.io/$image" \
     --build-arg DOCS="$docs" \
     --build-arg DOCS_PDF="$docs_pdf" \
@@ -148,6 +149,9 @@ main ()
     --file "$SCRIPT_DIR/$containerfile" \
     "$SH_DIR/"
 
+  image_sha="$(< "$image_id_file")"
+  rm "$image_id_file"
+
   local -a args_run=(
     --rm
     --interactive
@@ -171,7 +175,7 @@ main ()
 
   $OCI run \
     "${args_run[@]}" \
-    "yocto-docs-$sanitized_dockername" \
+    "$image_sha" \
     "$@"
 }
 

-- 
2.51.0


