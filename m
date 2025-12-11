Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC98D41C14
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 09:06:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5426.1765443984311004225
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 01:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cTSNJ6uo;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 94FA04E41B77
	for <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66C956068C
	for <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D146E103C8C7B;
	Thu, 11 Dec 2025 10:06:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765443982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=B9jdqOvHS9vx1U1OHDQoMOzsvb2sasVWICwGeBVcipI=;
	b=cTSNJ6uoNxEgtPAw1Py+aBcHFIiUctCAPdlIm6FymHw03g+FYWD91Pn5Ufq1PqBs2EkIkP
	eg9zzJOIlTy5D6Tjc+mtPYo8jdq+ErEldR5er+2Ogras49sYZfHQ7PVqx1vadbUI1XHthm
	/zcoL7S4Iwfll+BVsudwo9JhNY2GQGBODqDDb8pFZ9G6l/Ixu9WEdENjQYn7cZGVKVvICc
	7p88FAO84H2SyKPWtIvJcIQVY8HyzphLfT0+465FfAfv0qGtLyFjjadudMeRnjoA+4On3k
	3ekSRhHIcvoDVuwkRd4UVGiFhadJa1t+BaA2pQRFvVcz6/QrX7I1Fs5bZFBddA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 11 Dec 2025 10:06:14 +0100
Subject: [PATCH v2 1/5] tools/build-docs-container: move container files in
 their own directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-build-docs-container-tlmgr-v2-1-58719c103a50@bootlin.com>
References: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
In-Reply-To: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4042;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ZXaf+4k0heH6JRHG+vAHZKY3GwS1qbzUWnw9hpxr/dU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpOomLH32oDdLHUUbaFRWFCfkiGP19ivY88c8GT
 GiZQnT3aJ+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTqJiwAKCRDRgEFAKaOo
 NoJSD/4k8hJsptUTgNU2HOiVqV5GFwW0Q5sQbX8EetIj2W+cBOJhhhcnrW36svzrMulKW6e2XRm
 3HLc564SDbm4HNii/hBWV3RwFyNq8KwHSa18NqkpJLF/WDB5NwjZcQ2zxR94qqWl9BRKrzSLrpo
 erv4QZb1WQPZ62SH2CDlS21bYn1I1D+D1Ykp1WzppzjHfDEy6C65DnmzQt901s1NPdllTvaowA8
 PSpvwSYyGXhU9uNVKgQu3jUJEzMxKf8bN+y2nPye0Dq2vKtIQta9n5fqkc9q+Xb1dnP3y1Ie2QH
 5WOHHtNn9f3iHYlw7ea21f0Da7N8ORyg+0Hv1yrfRJF3cwES9+RTVjefxAYduFEruZqVg/pbZ/H
 9PeDuq7kxwCHDPgQq1kmNQmjev4NRbstTKUpuEVH85fIxZfCx3/G+LBHk7JySIXtgecI9WvxQLX
 34RfdJE87FcYxzqTZgJvrden77ZvXidGAxfVRJSMfXQoWTsUG3FwkQ4AEYLNFWaudSyNDFz3MFP
 PHOydOq/nN76oGr15TtI01U5hGdwC5ZKLpYzH8Fg1UwwdKHEhBoQ7IeJQi0+qWXkM4Irm23hog9
 dzZMUc43GCioJOgk3XieNzTeM49TdewZrFOhPgII0UUJTRy/WsDIuaInEhuTAIAb5xa0dNdDlNU
 pDf8QMd0Ecwq5Ig==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8244

Create a directory to hold the Containerfiles as they were lying next to
the scripts. Change the build context of the docker build command to
build from SCRIPT_DIR and pass the host packages scripts and container
file relative to it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container                    | 13 ++++++-------
 .../tools/{ => containerfiles}/Containerfile.almalinux      |  0
 documentation/tools/{ => containerfiles}/Containerfile.apt  |  0
 .../tools/{ => containerfiles}/Containerfile.debian         |  0
 documentation/tools/{ => containerfiles}/Containerfile.dnf  |  0
 .../tools/{ => containerfiles}/Containerfile.fedora         |  0
 .../tools/{ => containerfiles}/Containerfile.ubuntu         |  0
 .../tools/{ => containerfiles}/Containerfile.zypper         |  0
 8 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index b91a6daa9..7d25b15b9 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -23,7 +23,6 @@ set -eu -o pipefail
 SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
 CONTAINERCMD=${CONTAINERCMD:-docker}
 DOCS_DIR="$SCRIPT_DIR/../.."
-SH_DIR="$SCRIPT_DIR/host_packages_scripts"
 INCLUDE_ESSENTIAL_PACKAGES=${INCLUDE_ESSENTIAL_PACKAGES:-0}
 
 function usage()
@@ -140,12 +139,12 @@ main ()
     --tag "yocto-docs-$sanitized_dockername:latest" \
     --build-arg ARG_FROM="docker.io/$image" \
     --build-arg INCLUDE_ESSENTIAL_PACKAGES="${INCLUDE_ESSENTIAL_PACKAGES}" \
-    --build-arg ESSENTIAL="$essential" \
-    --build-arg DOCS="$docs" \
-    --build-arg DOCS_PDF="$docs_pdf" \
-    --build-arg PIP3="${pip3:-}" \
-    --file "$SCRIPT_DIR/$containerfile" \
-    "$SH_DIR/"
+    --build-arg ESSENTIAL="host_packages_scripts/$essential" \
+    --build-arg DOCS="host_packages_scripts/$docs" \
+    --build-arg DOCS_PDF="host_packages_scripts/$docs_pdf" \
+    --build-arg PIP3="host_packages_scripts/${pip3:-}" \
+    --file "$SCRIPT_DIR/containerfiles/$containerfile" \
+    "$SCRIPT_DIR"
 
   local -a args_run=(
     --rm
diff --git a/documentation/tools/Containerfile.almalinux b/documentation/tools/containerfiles/Containerfile.almalinux
similarity index 100%
rename from documentation/tools/Containerfile.almalinux
rename to documentation/tools/containerfiles/Containerfile.almalinux
diff --git a/documentation/tools/Containerfile.apt b/documentation/tools/containerfiles/Containerfile.apt
similarity index 100%
rename from documentation/tools/Containerfile.apt
rename to documentation/tools/containerfiles/Containerfile.apt
diff --git a/documentation/tools/Containerfile.debian b/documentation/tools/containerfiles/Containerfile.debian
similarity index 100%
rename from documentation/tools/Containerfile.debian
rename to documentation/tools/containerfiles/Containerfile.debian
diff --git a/documentation/tools/Containerfile.dnf b/documentation/tools/containerfiles/Containerfile.dnf
similarity index 100%
rename from documentation/tools/Containerfile.dnf
rename to documentation/tools/containerfiles/Containerfile.dnf
diff --git a/documentation/tools/Containerfile.fedora b/documentation/tools/containerfiles/Containerfile.fedora
similarity index 100%
rename from documentation/tools/Containerfile.fedora
rename to documentation/tools/containerfiles/Containerfile.fedora
diff --git a/documentation/tools/Containerfile.ubuntu b/documentation/tools/containerfiles/Containerfile.ubuntu
similarity index 100%
rename from documentation/tools/Containerfile.ubuntu
rename to documentation/tools/containerfiles/Containerfile.ubuntu
diff --git a/documentation/tools/Containerfile.zypper b/documentation/tools/containerfiles/Containerfile.zypper
similarity index 100%
rename from documentation/tools/Containerfile.zypper
rename to documentation/tools/containerfiles/Containerfile.zypper

-- 
2.51.0


