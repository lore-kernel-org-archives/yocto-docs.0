Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6897D462AF
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:30:41 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.12686.1731508239247440155
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 06:30:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=a4aZ40gr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96885E000C;
	Wed, 13 Nov 2024 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731508237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LNWvbcCGaHZ4HWAc1IWkeHgN2L+2SG1S/oHBgVXUnMU=;
	b=a4aZ40grKXLuhF5QnrTmAtfLO0LVDnIR5uzC92PmyrVPkVohdxtJZEHQJGNjx6X+BXJAGB
	94mJYonEZvqmqDGF2Dp9N68Pt5gdshfMEexYMDrQv6dIrKGJSQrY6nejMjZ99CnSP17zDY
	qia3tpICECXosvUHhZlSH0ltyC5aU1uWwV0L3nbP1miDKeM83WVQ9NFG7LKe6GD3Z45FrE
	issXBwRWA1II0ZDgArbg5TZDzAtXSBxM5JGxnOA42anpOZ9BYSiLljHhobrzGVwsq5DN33
	Y5L4PMGj5an77nNGEMnrgI0tKXqgH9gxdZXexuUqmZCYYBxqHODYDR2Fh9g8Sw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 13 Nov 2024 15:30:22 +0100
Subject: [yocto-docs PATCH v3 1/2] conf.py: add a bitbake_git extlink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-layer-confs-v3-1-3a84b0eb2750@bootlin.com>
References: <20241113-layer-confs-v3-0-3a84b0eb2750@bootlin.com>
In-Reply-To: <20241113-layer-confs-v3-0-3a84b0eb2750@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=953;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6ZNvm3WUu2JjNgLs8af7rSs7BtVbgsjHBX7632HItSc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnNLgLZe167T7cmXL4d5Q5Z1QJWxyvZEUnouXeL
 EZHIlzwnpqJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZzS4CwAKCRDRgEFAKaOo
 NuoyD/9SALEa1DhecUvUm0yMMHw0hfls+rEvxtb7S2YzNXUE2dNl1wOq5DjROWzv719kqsqjftU
 /dZH0OefP1wWAnxfzpsDbOnSw+a9powt9YRg3lDOnPYiSUo4lAjG4+6lwBhU1mdSuRCI6nMCK5w
 EmXmZ7fean+4C05lIRAAYPRU8L4NCALf6Hls1vF8kXuY4aNTWnWg0iBmR/avIGh9fzaXKfMFuVl
 ha/6JpcsxB9tZ24GFq+QRCS+1xuwJ1LD2AmUHoC8GRKPueMW+sOiY/qYwbTxToVkXou/r/lJC44
 Af4y/eXC36e3BX0ioqQtzLJ+ThaEb4+1jPTFrvOuHLGOag2hO3f2nbJRiv4gldjaDR8ITQwHb8g
 F1O4Nr67ETL9XaqBKyi6XrKOXf9LCuAfqr7wkdWi4tY1TsUk7O8Cl+DzHDcf8GSvY06nBj1ngtK
 1Oept8GGjvBPih7rZ7Y0bQo/XRFsZxPJUrbJnjyI98nhW+hCJ3FNUFdBYoAkSs8KLUs1bZiLqHv
 ugomwSjxnTxMG9ee+q09goOld6yejZskepRysULmi0PcyiNHylaOOmYrJ1H2OPvbV/AaLQ18Cwt
 lKjW2BMVFivfPCn7U65mi+N04Hi/1248YD9DGCKZ0vVQ17JBPRx7b5fB4piEsH0atKMdRGVqymW
 z2eelLuaak6f3GQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 14:30:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5731

To make references to the bitbake repo, add an extlink for it and use it
in the docs with ":bitbake_git:`lib/bb/utils.py </tree/lib/bb/utils.py>`".

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index c7dd4e03fc0e99176a0fa2f74fda58efaf0af9b2..b0e7c91eb5d8e4e855c0ca46351586cdf237fcb3 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -90,6 +90,7 @@ rst_prolog = """
 
 # external links and substitutions
 extlinks = {
+    'bitbake_git': ('https://git.openembedded.org/bitbake%s', None),
     'cve_mitre': ('https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-%s', 'CVE-%s'),
     'cve_nist': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-%s'),
     'yocto_home': ('https://www.yoctoproject.org%s', None),

-- 
2.46.1


