Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419D9CCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 07:13:27 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.37082.1760339597727107450
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 00:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RxxyLD2k;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9B216C093A2
	for <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 07:12:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73026606D7
	for <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 07:13:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C48EC102F2249;
	Mon, 13 Oct 2025 09:13:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760339594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=skma86guvOBrFo0CX7liukAhczxWnlpQBMI1LKzlRqo=;
	b=RxxyLD2ks91kTJ/ZELGioc6RLoeFaPEyNGTO8h4fap4VuzeQUw8GRryxMctoSQJ5zE/5N/
	9VYlo2Vx1rE944HfOl7DV23DVFPq5WONp16t+d1PYJ2Oim1YDNBB3GgQ78leCNekLmScQW
	73WwtyvrrTmtmdgBQUNoZoM0/25pi4Cd455BsqJaOU92FMKtNe9+XSReJZ52wCqQbi2xBI
	gWjoORgxiJ/YdGayhbxhk0wA8q82RfS7m8aV9K9ndsFDOWpXS2XXDJPB6p1ZUkRJHhKoNy
	dkmEKzN17oD7p49iYmTcJrsq/Vcs0S3Kx4QwBawbs27mRXDIUTuT8W5cMv6fxA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 13 Oct 2025 09:12:55 +0200
Subject: [PATCH v2] tools/build-docs-container: use CONTAINERCMD to append
 args
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-fix-build-docs-container-args-v2-1-9ac0fd56bc65@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAHam7GgC/42NQQ6CMBBFr2Jm7ZjSAIor72FY0OkAk2DHtEg0h
 LtbOYH5q/eT//4KiaNwguthhciLJNGQwR4PQGMXBkbxmcEaWxXGNNjLG91LJo9eKSFpmDsJHLG
 LQ0JfGWqYXH92PWTHM3Ie7P57m3mUNGv87HdL8Wv/NS8F5tQNcWnLS1nbm1OdJwkn0ge027Z9A
 QBfp/bMAAAA
X-Change-ID: 20251009-fix-build-docs-container-args-d50c9ecbf7bf
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vXldlhMdbBPZqnJkdAj+hxERrcaqMdcKVIOm27RVN3U=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo7KaJbOGoVzJ1OnZm51l6Q63MTvE8nK8j2bIOO
 PLWUcnjjFmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaOymiQAKCRDRgEFAKaOo
 Nt38EADH3mpCS+1P0Zxag5m3CYfFgDmdWuPEQJJfzoGT+jy7Y1m0nDqDBLLAoKW9TnT9v8jhXnT
 q5xs+N3H6QJ1N/vpJ1Ngs1xMS9RngKD+CP6WoEoxxtXxSgjmLuwxlNgaC9qtgTtEJ6dCAZ8IS3g
 10gIx4W7191ef7k/PJKywAw2q9I2hVQ4qtgGco5KgAiSQZqqzHCNgUew4+FooEiZ8zvE+3sada4
 aGudCiKRPNL3xcXiqUJafbibsLgSGVGAYdv2QsWVcgfJPEfrYPLe/WsX94+Z4lzbTD6lgt27Shz
 ZkT+GQLDpJozNvyLy+1oJ73z0yBOMhtN/xInErfa94KfqEkDJ0Au1DeHnblrJiFK+LXBBWpFCDe
 84NHzeLwX6wEPkpu7id0BZ3FZL/Y0BS979QizFixVCWse79MbL9eJCrBBB8tyJgTQiPLcpkrKNI
 uY7GhGk08SWjfYoGOEKeRIJoJdOnwyaBRc/t7FWeMcppooYdXliwPJherjgFOnAL1Y9/pjonn5R
 8x1Vjy3/sOMdEwWtW66JFabpUP9biuZSIAUgG/x7fCU2w2FXqMJK+4/N7xPHHrydiOl9NGZH913
 Qz/A12szVV7gbzvYsCOqq9MArhlw53X2RVGTun18f+g0F0vGhLrYxz9V4nkhQQrubfy5IaMwLPd
 Os6VX6cUSY0IOgQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 07:13:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7688

What we have is OCI = $(which $CONTAINERCMD) = /usr/bin/{docker,podman}.
So we never pass the current if conditions. Compare against the basename
of OCI to pass the checks.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Use basename on OCI instead of CONTAINERCMD, in case we use
  docker-podman (thanks Quentin for pointing that out).
- Link to v1: https://lore.kernel.org/r/20251009-fix-build-docs-container-args-v1-1-169ce4248462@bootlin.com
---
 documentation/tools/build-docs-container | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 70e05f295..791b36c3a 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -157,11 +157,11 @@ main ()
     --security-opt label=disable
   )
 
-  if [ "$OCI" = "docker" ]; then
+  if [ "$(basename "$OCI")" = "docker" ]; then
     args_run+=(
       --user="$(id -u)":"$(id -g)"
     )
-  elif [ "$OCI" = "podman" ]; then
+  elif [ "$(basename "$OCI")" = "podman" ]; then
     # we need net access to fetch bitbake terms
     args_run+=(
       --cap-add=NET_RAW

---
base-commit: 09c7800333b17b21e50d2a089a3ae1b123697243
change-id: 20251009-fix-build-docs-container-args-d50c9ecbf7bf

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


