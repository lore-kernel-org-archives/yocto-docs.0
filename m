Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2D2D44164
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 10:22:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9803.1765534959063851628
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Dec 2025 02:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uf25K7ji;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7C5F21A212A
	for <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C78F606DF
	for <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3F08103C8E11;
	Fri, 12 Dec 2025 11:22:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765534956; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z5ZdGD2tB0T0L+GLHwdhAtHWx1+XeF1DL6LHkvzWrks=;
	b=uf25K7jiwoag5JisHIi33XllBc84FQzXDgceEdQcxO9WZtMZgVNDPJCRpKbIQb32jmQTNP
	l0WgXhG0hIHnhTC5kMTybtKxcyK2nMpcDyx2QocLY9LDLpy2B9LHf7GDtWUvca+HjdCcmV
	trZE0Wz7bX/MTAOxVyDxKk/16Br83nK72q9gZqSzmKpmf5obO4GRABhzueHynQzOILfZsi
	M47RxnA3fvQqz/g4vJREr8vlwEjUDguvVK//n5oEXYyE3tfW8ja7iCAg4uBtUm7W/Ndmoz
	5zfkQ6o+7797iOUXfsyh77Nj5vMnRx9AdiGHhB2Wpy5Qfy9X3sfcEDQexQTBTw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 12 Dec 2025 11:22:23 +0100
Subject: [PATCH v3 1/5] tools/build-docs-container: move container files in
 their own directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-build-docs-container-tlmgr-v3-1-a45c1ce6d8f7@bootlin.com>
References: <20251212-build-docs-container-tlmgr-v3-0-a45c1ce6d8f7@bootlin.com>
In-Reply-To: <20251212-build-docs-container-tlmgr-v3-0-a45c1ce6d8f7@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4070;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5Zx4mnbkzHZAVTziaLnujYwWTPGRT9G/t3/f5bhFPwg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpO+zqNOGI3GrjZhcwrHCoG6Nykw/7wGvpGWnNK
 tAVCBNZIIuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTvs6gAKCRDRgEFAKaOo
 Nq2qEACm4Pj7UZ9B6ote+5GnyAIWPpdIhPsTFinyKjN7h2ZsE0qy+IovwERhfqybLCisbAyDaLQ
 wRrfv7EcV6U35g9gD4OWzPWC3s3sWpotVxhjVGRjv5OXVcg2z3iYLgRb0xk1mEBljVRSzQD/QYj
 TZuWmD+1+vwal2Lkxm3zUmHYDS6biIgdPAxJi9zpm6fofwPHLE991i///05T28deqntvQWLpIKS
 gFDKFw2UTcNFcZrEOHY3Ra1FEnhk6S6dC4bkBL+jMKz0PQ415YRsQXKpHHo+HZ4g/Bn7/6inOuk
 kMrGZukYYCtJVR76Cu2Eo/VfSt/tQ0TUjO7hIzGehdARCrPER6l0WEX4H4kr0WTwtpJpltETTrc
 ppQUD3JavU98/WgVHSOi9cfJm9GoM+m9COyVTYoX27alZFM1+okvn6cKMmjQfhggL9aFlyvuCw6
 o7k+nMwKV1CJdPCsKQnAWm3uie5obp3/LYEtH0UkglLFW2E/mRh0KVo6vO/rsSC4c8ZTZ2/NaPZ
 ObVL43dFDg4gv4tnqdVnDfhBVi9pqGJq8985Q1PwJVRAu3WI/tSti3KSYtebTHdhDk0AH6TjMGC
 Q6asvj7P1h+cuI8UVvIqV0bVQyCVDwkjIKEZxfiqfcPANaJW6/y/us+fSl0SFERDl3eNlJcWZcZ
 BMpkMkVUmQ3oc9Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8258

Create a directory to hold the Containerfiles as they were lying next to
the scripts. As a consequence we need to change the build context of the
docker build command to build from SCRIPT_DIR and pass the host packages
scripts and container file relative to it.

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


