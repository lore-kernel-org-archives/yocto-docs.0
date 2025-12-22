Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2421E674A7
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 12:28:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79097.1766406514023540734
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Dec 2025 04:28:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aV4TwlNv;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5C0A31A236D
	for <docs@lists.yoctoproject.org>; Mon, 22 Dec 2025 12:28:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 330A3606C1;
	Mon, 22 Dec 2025 12:28:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5B3510AB0284;
	Mon, 22 Dec 2025 13:28:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766406507; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fD4OxLMScx5I4WEqPfrlM+wsBB8YPlCBezwv8aCj10Y=;
	b=aV4TwlNvWCyu9AQoRjNIzVRjdC5D00JzepKDgHVaWmXz1NBOmR5DSuuytIF8+5naMNi7Is
	ak1PB9KzyI4FFCQ5Jc6tHE9IFw1ErgNWLh4AqdoiIH0bnuOFa9Q3+bwLZPHS1pDRaGbgcT
	wcPXTjT/4jHDiNwT8gFbABNyLr5irB5Skalh0ZVixX8TkEcWDZr/8G6g2WtCPYpQz2LFpX
	/iKwNJqJISbhh3Ju5CpdirIG6pLgG/l3GKLvUYvRyafCLVw2cdAySFhBg77cenw0vMvqhc
	ej3PgAvXDJqtsYzw9Cf6yUMp2CP7/BQUtetUOwbtt/nErrF2BcX1omZs5FdvyA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 22 Dec 2025 13:27:52 +0100
Subject: [PATCH 6/8] tools/build-docs-container: allow running
 non-interactively
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-concurrent-safety-v1-6-e3d86e44cd38@bootlin.com>
References: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
In-Reply-To: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1998;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=LqoZO0DMv0jp3piFq2M/WMwzSH0pJjRywe1OPETfKoE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpSTlSylaIazhDnZgwVvr9niOhI+LRE+rb2qdB4
 3TeuPCt7qKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUk5UgAKCRDRgEFAKaOo
 NmZID/4qm7q+glenxtOThDAR0JWcTx5UodzMDAJThYS0TBt6ctLaQSlQsIvj04xR1mEqefreOlA
 5RwtvrliJXOrG4WjaYLVrmwQIxaxYfAvQWMOQD+F0kFYI+jbe9T5EE23zCD3XdhfjRv2VldAkps
 8obgvy3VhD1CbUMJQvahrPc1aLSV+3Sc5KXCdBLxN2MdqsrP4DSva6EKKsCaUZZYblo+dKI2bjJ
 NCp+fepy3ROWGBRxdvYhbDdjpnnvCF99Ngj5ibSakau5WHzqTX3jhya3MEiDzR86OndpgJ7eXpZ
 RjPHuflkbpF/K7wCXeoKT8RmL4CNCVtJCMar1Wm7QGopJ55UN3ovfyJbweVjxCfquvI8deAVm4g
 ve5kLj0Zvaccn2pNns9NWMCVExqvzdT1rbbehT86/gjRlxAxfS38BLjiDZ0vqu3Y7TU1UmyC+4o
 +23eMaTTiG/4zqmylqSDYd2HLlk0sDHToPrZ+jy9Uc2btKxr0dwe0nOQSNPS/TGblIh39YWBKzH
 O2/hAsql77fkvryLtha6st6tBlVYQrdnYTNhz0ZFGNpzlCbaxyBRs4CmyLpyXY+TjHTj+t8cYLE
 +EH0XlY6PDLUZROGFugOqX0y0RdPWujuzgUDiOHJi9eBjFuDsvAbE07utWtT2ct7L0wyllclRf1
 Wf2rGnxv8aTM9Yg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Dec 2025 12:28:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8315

When running this script from another one, it can be useful to run the
OCI run command non-interactively, especially when running concurrent
builds. Add a RUN_NON_INTERACIVE env variable that can be set to 1 to
remove the --interactive and --tty options from the run command.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 7f3ba3680..7a5191710 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -24,6 +24,7 @@ SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
 CONTAINERCMD=${CONTAINERCMD:-docker}
 DOCS_DIR="$SCRIPT_DIR/../.."
 INCLUDE_ESSENTIAL_PACKAGES=${INCLUDE_ESSENTIAL_PACKAGES:-0}
+RUN_NON_INTERACTIVE="${RUN_NON_INTERACTIVE:-0}"
 
 function usage()
 {
@@ -65,6 +66,9 @@ $0 OCI_IMAGE [make arguments...]
      packages listed in documentation/tools/host_packages_scripts/*_essential.sh.
      This is not required to build the documentation but can be useful to validate
      the installation of packages listed in these files (default: 0).
+
+   - RUN_NON_INTERACTIVE: when set to 1, allow the '\$OCI run' command to be run
+     non-interactively, without a tty.
 "
 }
 
@@ -177,14 +181,19 @@ main ()
 
   local -a args_run=(
     --rm
-    --interactive
-    --tty
     --volume="$DOCS_DIR:/docs:rw"
     --workdir=/docs
     --security-opt label=disable
     --env BUILDDIR="_build/$orig_image-$image_sha"
   )
 
+  if [ "${RUN_NON_INTERACTIVE}" != "1" ]; then
+    args_run+=(
+      --interactive
+      --tty
+    )
+  fi
+
   # Create a symlink pointing to the latest build output
   mkdir -p "$DOCS_DIR"/documentation/_build
   ln -snf "$orig_image-$image_sha" "$DOCS_DIR"/documentation/_build/latest

-- 
2.51.0


