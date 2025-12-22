Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35A8E674A9
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 12:28:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79014.1766406515428564143
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Dec 2025 04:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ieDAX+yX;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E5CEF1A236E
	for <docs@lists.yoctoproject.org>; Mon, 22 Dec 2025 12:28:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCC26606C1;
	Mon, 22 Dec 2025 12:28:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB60210AB0283;
	Mon, 22 Dec 2025 13:28:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766406513; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xFSlIBGedndN9NE6ggGh0D6sVadj8lLqZKU4PgqQVMY=;
	b=ieDAX+yX9pDBGk9H0rUc7R3toe57qM6+z47zs67w7cvstCu+RrGtkx7NV6n5bUlhmw46kG
	culBbta90vPmPrVf0+gXUKerfQN+ctd70hvT6o66XfVFk+HzK26LcBhH4qtrQ+K15X4/Pg
	6zafFy0+MN5BT+UWQAxlphqSIXTNDuiaxoIe77C3A1yQw6h+vNgZl+8oArSj+T5SDyCrbM
	su67nM9Gl2v6VJb8iXYLnrMkOJZ1YqqUbOJWPs9us6E8ibQ2fcqpbpPl+DseYi8l8oJTNx
	X/7FigdKKZdJq2AT0SaL2lzIE30L7hYS+j8LYJ6ehWTsRXGoJ9SQ5ROad6vetg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 22 Dec 2025 13:27:54 +0100
Subject: [PATCH 8/8] tools/build-docs-container: make it possible to print
 the distro list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-concurrent-safety-v1-8-e3d86e44cd38@bootlin.com>
References: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
In-Reply-To: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2120;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/muZLrF2y+QCVwR5K3hnUw/QGpzj42pGYstqmIhWXVo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpSTlSbW+mEcEopEXgh0gOBIJGyopf113+a0ArB
 wwDK3kFwFiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUk5UgAKCRDRgEFAKaOo
 Nm6pD/0WEtUD8akB5uFSjwSKc6QtKP4J+2AknnG3RRf3ZcVTF/eKtRGYJoacFmrelOapzP1Qkre
 gnM4zU7YhuDCn/jWFOUOzhNlIi7OUfjKW1hgbteqc3oMSdQ5y/HDxOBQZhk5FQN2gTsRwtUE3tv
 N2VseYzNceNzQLlqts48HkDrjSv5+GtMlSJI3tgys9UN2P22oRauSE1CA9Qp3oHEaYSvPyYITaq
 hVP7uWLung192Bs/sBfAfxF4a4JuW4CPC+xuPhzupsr+U/O/eTxJjZBfAF5DYtSbIKt8J60kRdj
 eSj5aLBbrAskQO0EF519n1MH6mOLWzQj+DWAusuziFd7d30R5uGUYlRY6Rj2ZExxV1dTFBB98bU
 rCZ/pgVj8bQPDyJqGVY0CwYirnR1KZDj+OnxIhECu274l0j6DuUzcIxjswsSESriZaDqljG2eGg
 p2+Midq0Rn4HXgbiAOV+B4wYJFoebbeVYr78z8mc2nxEJSrbatzexbN7JuRE9/Nz/fJO+vVfpKT
 g0bfObcuritch699D1Ux7HB95EFuDaqMpyci6uUiFsH6jyBsdtLjfDczu7E2YPOdpopbmHa1QEQ
 OyZtZuzzDVWDojZ+ACy0s4RMq4ICeTp0YSy2kOHTKMkcNuirOfkLz65nkCBeXB7gHjPqYn0uCWy
 rtJdUfMJJ7Sfzbw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Dec 2025 12:28:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8317

Add a special "supported_distros" argument to the script to make it
possible to return the list of supported distros. This is useful for use
in a external script, to run the docs build on a specific set or all
supported distros concurrently.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container | 49 +++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 17 deletions(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index c5cdd9c4c..510435c3c 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -20,6 +20,32 @@
 
 set -eu -o pipefail
 
+declare -a _SUPPORTED_DISTROS=(
+  almalinux:8
+  almalinux:9
+  centos:stream9
+  debian:12
+  debian:13
+  fedora:39
+  fedora:40
+  fedora:41
+  fedora:42
+  leap:15.5
+  leap:15.6
+  rockylinux:8
+  rockylinux:9
+  ubuntu:22.04
+  ubuntu:24.04
+  ubuntu:25.04
+  ubuntu:25.10
+)
+
+
+if [ "${1:-}" = "supported_distros" ]; then
+  echo "${_SUPPORTED_DISTROS[@]}"
+  exit 0
+fi
+
 SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
 CONTAINERCMD=${CONTAINERCMD:-docker}
 DOCS_DIR="$SCRIPT_DIR/../.."
@@ -35,24 +61,13 @@ $0 OCI_IMAGE [make arguments...]
 
    OCI_IMAGE is an image:tag of an OCI image hosted on hub.docker.com. It is one
    of:
-     - almalinux:8
-     - almalinux:9
-     - centos:stream9
-     - debian:12
-     - debian:13
-     - fedora:39
-     - fedora:40
-     - fedora:41
-     - fedora:42
-     - leap:15.5
-     - leap:15.6
-     - rockylinux:8
-     - rockylinux:9
-     - ubuntu:22.04
-     - ubuntu:24.04
-     - ubuntu:25.04
-     - ubuntu:25.10
+"
+
+  for distro in "${_SUPPORTED_DISTROS[@]}"; do
+    echo "   - $distro"
+  done
 
+  echo "
    [make arguments] is one or more argument to pass to the make command of
    documentation/Makefile, see that file for what's supported. This is typically
    intended to be used to provide specific make targets.

-- 
2.51.0


