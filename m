Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BC4CCD187
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 10:05:46 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.8543.1760004336660527833
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 03:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tbAgP50R;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 560024E40FAD
	for <docs@lists.yoctoproject.org>; Thu,  9 Oct 2025 10:05:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A0FD6062C
	for <docs@lists.yoctoproject.org>; Thu,  9 Oct 2025 10:05:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 796AB102F2171;
	Thu,  9 Oct 2025 12:05:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760004334; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=WoMWUU3DR4SR+VGAU+zAIa1XuNhKmuik50Jy4jHdtAk=;
	b=tbAgP50RWaJT2m6/tV2tE9ZgB8Iv0TnUOREUMaia/193KaC3W8AdGZ4G/d2tFRIzuN4XjD
	13HiiAN9YYUsbhFNZdUQUBwOyxnM/gXkz7oVqhqvLhdwXC2oy7N1WXN4Cup4LSGeZlilvy
	d4RUA4Af3CU83SyLeSu73pThPSQM9XpvNRQFox5jWYw5fzrRG7WwHIVrKS0pCHpXtGgeg4
	W07kcRM1pe87cqS9d4awW7Lvjlqp7HbO+2kgKs//v96rQy7OyKO9GIOjeM1nWE9suteN2h
	mHI5LtybT5LbJ2t/xVv2cUPAdL4+MmKRWUxsw0KNX6DpaH36DTMjZtLdK60jBg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 09 Oct 2025 12:05:25 +0200
Subject: [PATCH] tools/build-docs-container: use CONTAINERCMD to append
 args
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-fix-build-docs-container-args-v1-1-169ce4248462@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOSI52gC/x3MQQqEMAxA0atI1gaqIINzlcFFm6YakFYSFUG8u
 2WWb/H/DcYqbPBtblA+xaTkiq5tgBafZ0aJ1dC7fuicGzHJheGQNWIsZEgl714yK3qdDePgaGQ
 K6RMS1MemXIP//zc9zwurKpjSbwAAAA==
X-Change-ID: 20251009-fix-build-docs-container-args-d50c9ecbf7bf
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=N8jr4RoxlGXuuSHwRSN7cIr7NycFjOf778OXWAmeNss=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo54jt6zUJ6b018AvYCVEssHRHu+amOGFpsWJcu
 HXZ/uqXO3aJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaOeI7QAKCRDRgEFAKaOo
 Nq/DEAC4sFOj/MngYTqwIXzio/5giAF+XjktugYsQ7dcZ0UQDhU/KEzlKt0sjcqRPralHW0r0lu
 yfev9DKsGThK2Yo9BSOSaVoHS7/5CXdJnH311Ucc1cTZjehxvZ/PG4FjmMcShKxWdvrA6FJafIV
 wPVr0ZGcYB7WOtWZGmm5o/gSXH7BtDNKg6r0w5tq8QqGRwKkqo5zb3zn7oFQf50T120NbauuyXS
 QOpHdrT2UxhWE0ywba0u1LG1WDKflV4e5WcohyBiYvoiwgMNGgtm0ssBmPcMvAHmJdvS9akxO+o
 sIgXcoFyh31jaRi7dHqXbYi70Itzywgezit1ydbbHq1DFjz51OVWKzQ/ShuuzUR/krtwhsTSR/T
 Cq47t74/bOsxAmpvoCusn0Abi+1mEeqjgwJM/cRVSBEsRgFg7F2Jhovdrtsot3RN0TbJHZYeOU8
 RX619XeCq4U3QnzpQWrVdfNe1p1urzCnELcHMhe+C+Eur6w3103XS78N0r0bJaN+ELbJFZmq5d1
 aheY4GhRdxT0X07gVwecJK9WgxOW8WTXsCQ81LWLvWdxuD8v0aRv6GJP7VwE6upXAbqlRHx8bE1
 t+eIyq8TvDbt9Nu/JyUtImCqTG8XD2aceIPqFyYx2ANXmsJ3oPc11bQA+D65jKrMiMCpd8bkrgA
 pVLaaurhBkSDdnw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Oct 2025 10:05:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7674

What we have is OCI = $(which $CONTAINERCMD) = /usr/bin/{docker,podman}.
So we never pass these if conditions. Compare against CONTAINERCMD instead.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 70e05f295..a93e0668b 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -157,11 +157,11 @@ main ()
     --security-opt label=disable
   )
 
-  if [ "$OCI" = "docker" ]; then
+  if [ "$CONTAINERCMD" = "docker" ]; then
     args_run+=(
       --user="$(id -u)":"$(id -g)"
     )
-  elif [ "$OCI" = "podman" ]; then
+  elif [ "$CONTAINERCMD" = "podman" ]; then
     # we need net access to fetch bitbake terms
     args_run+=(
       --cap-add=NET_RAW

---
base-commit: 09c7800333b17b21e50d2a089a3ae1b123697243
change-id: 20251009-fix-build-docs-container-args-d50c9ecbf7bf

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


