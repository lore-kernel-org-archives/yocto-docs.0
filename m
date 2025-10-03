Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A5DCCA470
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 07:34:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.2411.1759476856374354346
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Oct 2025 00:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=psuP9Z6D;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C4A32C00D9D
	for <docs@lists.yoctoproject.org>; Fri,  3 Oct 2025 07:33:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C47D560683
	for <docs@lists.yoctoproject.org>; Fri,  3 Oct 2025 07:34:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 345AD102F1C35;
	Fri,  3 Oct 2025 09:34:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759476854; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=elaGaGvTxAZ85EcV1mMWzxhj1CTQ7FeeeivSXF6eTts=;
	b=psuP9Z6DjEZpXCTypsZAop7UPmU5w9BhKKu+sYjHA/WwHtqkkxExhj5WxqsHzE4TmNqNiJ
	OtcV8e3M9qBAOcu/pofJOIWHCjydfoBw0NCIxZArDH6iWvED605W4HNVZIO8rbZ3Rrx+jj
	mYzYbvc4umvuUWVU5NSBoDhyrLfpIqvfKmBcUWWgvGXW+OdrhMuFwecvY+CePEVJCsw3rl
	PaqD1a69mHXNLKM9bWZHc1T/Kaw8EtKppEujRufPH3DckN07Rjdeyc7DLjUAqib/E0aQdY
	tGlrNCsENnx41UYnl0d00tp/aKna8NEm8/EUD+S5YAkLPfZ1ALNQ+zRy1MVWFg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 03 Oct 2025 09:33:26 +0200
Subject: [PATCH 3/4] set_versions.py: fix subprocess.run call for older
 distros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-update-tested-distros-v1-3-240e2da1af5e@bootlin.com>
References: <20251003-update-tested-distros-v1-0-240e2da1af5e@bootlin.com>
In-Reply-To: <20251003-update-tested-distros-v1-0-240e2da1af5e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0DNUrja3wwRZBX0hfaWGKlAYT1d5K0TFjeJy6NHU4PQ=;
 b=kA0DAAoB0YBBQCmjqDYByyZiAGjffG6htaQOlx8MSIzXil4PndsmsWF7DXd6q3PO5fr8xJzqu
 okCMwQAAQoAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJo33xuAAoJENGAQUApo6g2VrMQAK9a
 04jz5xvqeZRcmPcHbczbmHDcVjC/WMT3E5WyVl9rlFVRQRI5ht9xjnhvrqOFBtxP1GlUofl1hL5
 uTgEBMQqsYnDnhgSJamU81PEYTv+RRKrvxW3gqLKR+gCzJtpuGtZ+SEjE70ll+U7AcqlMeP9RS/
 OSK/je1N2Nut6KWInstAx65Ps+zqQZpolJ8UFzAcjUQ6QjhYk2OC2zSJLsl42Q16MgTQqmUKkvy
 2i0oBhz18SkqCbjrGkguvJmeSkN58kE3MqgWWLNth4HfoSclERT3SOWL5XBGULy8Wy8cPiLTIDP
 ygxhoy7VwHq0IhNFHwmZLLxmQrJxExNC3LTEXbvv4YPnieZ/Tc8K+Zlt2VWzKm755oJI6xjLK/K
 L+Tqi5IAKkbBvGIfx2oMz6OOsJFX3zKsJ0Bz17QEaXVh03OFtwuhxIVIDHuabH92xsKtwO1uPwl
 /xAUl2Vx0Rz5U1CRl3Sa8jxfxea0ievwFOGXFJ2Kogvu6ZbeqzJpPOF8Sz/EaSPIZVHTODxljbJ
 Goj0FZfZ1tnyMa1Ox5QzL7HBabg/t0I2loOznGhoUaEDQij3a0zvnEWiRp2V3MXAkVz9tq/0EmS
 +s3Gl8+0Ag/ynkfHPCV89OknqE1zaXuVCogyZ8D+gQ+XHTPYupV+HkzBtJPY0h/nSZZDkQZN3Iu
 YHlIX
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Oct 2025 07:34:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7636

Like in 28850c974a38 ("set_versions.py: use backward-compatible python
argument in run"), replace the capture_output options by Python <3.7
compatible ones.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index b8dd4b1b9..be05ef323 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -172,7 +172,7 @@ series = [k for k in release_series]
 previousseries = series[series.index(ourseries)+1:] or [""]
 lastlts = [k for k in previousseries if k in ltsseries] or "dunfell"
 
-latestreltag = subprocess.run(["git", "describe", "--abbrev=0", "--tags", "--match", "yocto-*"], capture_output=True, text=True).stdout
+latestreltag = subprocess.run(["git", "describe", "--abbrev=0", "--tags", "--match", "yocto-*"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout
 latestreltag = latestreltag.strip()
 if latestreltag:
     if latestreltag.startswith("yocto-"):

-- 
2.51.0


