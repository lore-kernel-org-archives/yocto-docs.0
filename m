Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37904.1793174718403292127
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2026 01:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0agsm7y8;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BAC8D1A1375
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FE6160769
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF5EC103290AD;
	Wed, 28 Oct 2026 09:05:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793174716; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qtZ26L1jOBVGbOKFRHtmDT+KNLW9APqwdfUfVr1Iozo=;
	b=0agsm7y8JBcOeuFPGNHN698X1DR3uCKvMm2h2B7urX92Km515O9mKPhsvk18qO6gA2Fczn
	VJ06Y4daBc/uLubevenxJS/ECO50Y8JiYcJE/tSKwMN7+42leU2d9yF7Lz7OrGm/DxyM0z
	knH914UJ5heEvyPPJWO7KA5b+qTyYvvHDN8JK9AL9cKEd+MX9tz4aQoosebvb/uWGHoHDq
	o9u+zm+kYU5LRPDNkZCwAgGwND8Qtyaxp/x0Cv0CVm8Az06iQviSCm57YcVHGOOJgbtiAc
	z2Noatu/x2eHRIRhGo20HjhOsM86h2PWETmqZBiKczguJTI2j029+Q8SRjxCGA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 28 Oct 2026 09:04:53 +0100
Subject: [PATCH 1/8] Pipfile: update dependencies for sphinx-tags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-tags-v1-1-d5ad01019eae@bootlin.com>
References: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
In-Reply-To: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=682;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=AE0X6RTupufkh+RPWbpaeci858/anrfy/1tqSUdW6I0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq4ay31S/wDIVJDRZCTeYnD0FknHKPwRAFCXYk0
 VpEaTZRjM2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauGstwAKCRDRgEFAKaOo
 NnlUD/9CFRRPzo7I+jmJzDpZolI6OTRQQA9rCQhUCoxLJ2SLNUYyhULZ7VE/aryApYghXkc3mhm
 6ndxg7EPWKZik3CU+gmSv3SukLJDuQnBFrJKdI/gR0AYb5fpOIZ8o9jPGZgdNslvOCX3ydiMDMZ
 1A6RhuEQCI0QKa0rye5n6hgsnUHXgjP+oq85s/bFBXlMC+p4GOyHVm0Iu9auTOP6I/MR9zTQmBl
 AkBFDDkDurdT6DSEH3GfswBkdbBKx5oDFwwcQWW8Iwr8kpZ21wBMSblIusAbHVIfyQ0gqL78QDx
 MokmSSBmKQVY8mJOTORgcHRrKVI1WqhqS1IkXpMfit6dFBx1bgZLBp7xd1ck0lN5Sj0sZ5yONYH
 mI7k+qcMhgvdZUYbz9iVJjCBt7oKAjkdNgsEh2Al6zy0kM2rFHi969GjVEtcRN6k6Cbzo+YVyVR
 9TKCUGR0vB96JhMCUEzmWVkmS/a0gomAn/FwQuGptsqT0rIunD8i7k805YiOlBZt4dtNOYFJfXx
 mfMUI0JBnPCldVGxoESubHCoFTs8VOD1HISHjadRoeAU/IM6bRsnr3+Zbtv8XAzuOHGaOqNDKiJ
 +KaWclKZouG/R82Eb6AQwZY8vbInb4jqu/AUluaXSMcv3hE0ceak+ndrCj0rb3qHP0oM2tjKhYy
 LEm8godn8NUPNNg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10728

To prepare for the sphinx-tags addition, update our requirements and add
sphinx-tag, as well as sphinx-design which is a dependency of sphinx-tags.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/Pipfile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/Pipfile b/documentation/Pipfile
index f415cbf3f..c857d9940 100644
--- a/documentation/Pipfile
+++ b/documentation/Pipfile
@@ -12,6 +12,8 @@ sphinx = "*"
 sphinx-rtd-theme = "*"
 pyyaml = "*"
 sphinx-copybutton = "*"
+sphinx-design = "*"
+sphinx-tags = "*"
 # SVG to PNG only supported since 2.0.0
 sphinxcontrib-svg2pdfconverter = ">=2.0.0"
 

-- 
2.55.0

