Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DC8D32D8A
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 14:51:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7370.1764946298118056032
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Dec 2025 06:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1E7aR5ug;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 332DBC19649
	for <docs@lists.yoctoproject.org>; Fri,  5 Dec 2025 14:51:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A6285606AC
	for <docs@lists.yoctoproject.org>; Fri,  5 Dec 2025 14:51:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A641102F0A9B;
	Fri,  5 Dec 2025 15:51:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764946295; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=B9jdqOvHS9vx1U1OHDQoMOzsvb2sasVWICwGeBVcipI=;
	b=1E7aR5ugHC5hIWixkEBOvC9miOsluTGU9A/07ISavjmQiMGGR7AJvKDpEetz0HX8qAfagz
	YW2RBkBIdMpxMpBmuX7rT/IWJ7L5CiU7o6lNDgl0rhvPNdNjOzEpu8BX29SXbu4yN3cOLe
	RkzRPzQJl1gKKdp5JemsikRg/68NRg9+HpL2q/XURhakLHqx9MPMd0ij0vGIYISa+WdeKF
	o0KwRexcD+mw2AYsXg3kPDXpOCP0NxdQCdJDhY9QVqes4AOMn4tk25OekOpp2d23JkyiI8
	fkuZjFXe0Zt0xsQ2DhjI0DRJ0eHZLtTVVvBTB/IBkoFcn4xSS2Y0ll5+MU9vGw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 05 Dec 2025 15:51:24 +0100
Subject: [PATCH 1/5] tools/build-docs-container: move container files in
 their own directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-build-docs-container-tlmgr-v1-1-de30623e664d@bootlin.com>
References: <20251205-build-docs-container-tlmgr-v1-0-de30623e664d@bootlin.com>
In-Reply-To: <20251205-build-docs-container-tlmgr-v1-0-de30623e664d@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4042;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ZXaf+4k0heH6JRHG+vAHZKY3GwS1qbzUWnw9hpxr/dU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpMvF0SEYIWuFv3WCEGgNlP5ZSfpZttn+YvVMEJ
 NBqMMfrrYuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTLxdAAKCRDRgEFAKaOo
 Nu/YD/9gIhxvqa8dIfoL7Zi0BMnYXRe4A/ODohJuuEfTLD8YIxXzWnwOp3/uWkjR2j9pVAk1RsW
 mvQyd0dpLuU0ihddJcK1B+a+klvdG30nOh18fRkbPsqvG/PLYhC5O2F3bRiiqRVfcA6CNGcbLlI
 aZHlQqPNsHAE6Ce7LLogHOaivYhJT/FQ6mLdHpsosK7nXA7qlNhdQtVwBGVinKLC0BMj1JT1zJz
 yDWMD+V+eYlDkMijc2CVwJr98O+tgx8kDS5yFnrwajbJLW5t0oOhrj69Cbn0qnvTfn2A1hrE+Rg
 WQ2rlc5myxTKW7w4zMYbTtnpqwT6EzDfAYSewbb7D3/18qO/zh7/oLVNS9OI8dNZY32lWhSyBsw
 5sBct85X1SxPpIHsm8SiCHTHIr1sivPJ2lGsjT9otYwOGvxdUhSvsRwXwXMSJhDuYEocFZuSFin
 W6rROLC0cfUaOBvh7TDysOyxCCXopA6uzcKCx6kJN/x8zoOB1EFugUxL76TenyLJzHj8GtdIu9w
 FpvZbjV5i/kZhGGXB+DOYIsF0RfpcbwbryjYTouHIaNKiectiF2V+1LXxzYSgLNYYAzZ9Mkl8od
 8wr51NuxDzjNoxoooLI9cFA7r9pIlQoCYIM1/hfkAU2IHpN9z9iIpuvQBSNPdztcPcZCYEGr/Ya
 KTIKTK+YJVE2SLw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Dec 2025 14:51:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8227

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


