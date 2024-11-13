Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6325AD462BF
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 15:28:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.14131.1731511703591560375
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 07:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HxANBv2a;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03AEC240003;
	Wed, 13 Nov 2024 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731511702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LNWvbcCGaHZ4HWAc1IWkeHgN2L+2SG1S/oHBgVXUnMU=;
	b=HxANBv2a4+JUsHA8tc8D3H9KGUJvHG0nbgeYpTD1AtHQUK6pRwfeVn6gAbW4IPuTUlEHsu
	cwXpkcradPGz8xIOJyLFNwe8IzITOpiirAoqmWmbUHeeq+mi768nTAyyISIOdBFGYhjwKv
	AiF/HKV10x8CAs8ST0DaftTJmp52hnbo3ricMTXF417Cv0fBmOAErRJDRW0KA7PkkDvJaR
	ybgWCUWmE/HO8uiaaoXormp7bewNlNjZj4HuHJnRwrfP3Gog2uTD4KT7r7FgJf1l9sS68t
	HQFXIsQn/L3S8QJZ/kGHqErQzRPD8TAFaxAlj+j83oHXvkENuP7+vZlFuVWOXA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 13 Nov 2024 16:28:11 +0100
Subject: [yocto-docs PATCH v4 1/2] conf.py: add a bitbake_git extlink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-layer-confs-v4-1-a4758fa4d1a8@bootlin.com>
References: <20241113-layer-confs-v4-0-a4758fa4d1a8@bootlin.com>
In-Reply-To: <20241113-layer-confs-v4-0-a4758fa4d1a8@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=953;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6ZNvm3WUu2JjNgLs8af7rSs7BtVbgsjHBX7632HItSc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnNMWVjCBYluOoNJjGWH4iX93kOWRrR8knINUmi
 UsB42t59TWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZzTFlQAKCRDRgEFAKaOo
 NhiAD/wLU/ctJiiRN1dlXqmH26+a4TJp9/LH+LcC5Rau3GoI+pBF+CXFVogiE9um+yvLAbMMcfU
 5dTIHDWvo57Ch5EFxaGs7jgIwN1pBQN4Wj419yxWLYkqO/cA9FuLj00C7V+S+eanwwaKAWyTsIK
 HJKlwUh+8Mnbft9Rm7ZOEPZLPZUdMLupvLSz0YJCypXpUOeVmIFf1FD9bbkleSEBaHhFcCG8+q7
 UcYsEqvzgVuyqOfKpORREkHwdTMdXkIHCdFKEb2cynhTa2suDPHhw/DOKLGokzpVT24YSL5QIZp
 4U8yEmpCQzCLjw0afHnc3rXdFFejiy9g4D40HxJ+OrEwSOhJDPzibhn/aHvIzomy4gBI637ZQlm
 /Iw6iv5xZ6dVF4DIUa9ocH1qwI8soV9dUVhC2vyNIhqQPihJOSrTXFOGTk7m9aj6OgNV6WjZ2g4
 1e+jI8pFwytRBn85SXuSGk9CaPmLbG4d0LsMZhFcEaetx2TPfXvtd6/ZGHc1Z2fGuX2ecOO6ChC
 tl/J4999eqeXlS6VZUiPUIhGfZR8sSpFCm/1nRD3tgVW4DCnOARrEFwSvuGpGuapZa9fRImGy4q
 v8TpRtiUIT3/qtdVa/2xtzW9+Ak9vAEesfni7ZpiZBB6JluidxyU+VIe9z5RlAafeRKupgRVviZ
 MI6prANQau6jYkQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 15:28:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5738

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


