Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A558CD3A67E
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 09:23:41 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.10873.1730280216804627762
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 02:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QEUOntRI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45654FF811;
	Wed, 30 Oct 2024 09:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730280215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2FlARFsFg9L9fK5vwVEhrd3ZczDhiGn6pF/0ZN8Rgps=;
	b=QEUOntRI20jMPIx4A4b/R8EZDUVRMwsGmoly2vaeFuatl16i9GkkVbhB01Hu7isa1nfMr4
	66Ex4ImrBoulPU7BE0I7klvpJXosMEysai+4DBdfkunDz08ZDnW6zIhgYCLn7n4iCl0fKR
	v5ZXUWNNjfRfHyO2WpBx9McdDlBvlR8Y400ML6FckxPY9ZUzWfi2dfhaiU9SdNWYTEzJQK
	28XbmJH/LA5bRe9GgG93W0QOuQfJH+zQoKh3hwYkvT/xuHztfyTzzOOx2vZQRc8d2z7sQm
	RhYs5BOztWYxOc9DP7lZHn4ry/R5ONEmCPoRIs1gRNPI1+L6CTLypK+G64v3lA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 30 Oct 2024 10:23:13 +0100
Subject: [PATCH 1/2] conf.py: add a bitbake_git extlink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-layer-confs-v1-1-0f7dcf460e27@bootlin.com>
References: <20241030-layer-confs-v1-0-0f7dcf460e27@bootlin.com>
In-Reply-To: <20241030-layer-confs-v1-0-0f7dcf460e27@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=892;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6Ds3V3oXS06fusETgQY8Tum2lbPh5mElUElSjc074LI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnIfsW8NTKuAZVr2Bq7XiqvF6WymJa1Rt/l6j3l
 3Hd1aU2cA6JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZyH7FgAKCRDRgEFAKaOo
 NrIiD/40KJq4gX1E5I6dYwoq3fHGDlSBZ5J+JRDU9Yfy8C5fx7YXJUo0hmv5gYD77/NKAK0rREW
 ctIC41UJyJq7gagYkTULnYmAXV0pDuO/9PkCsjzDIgF4pVX4ZuY0FD5og1/va0mmZFkZegzQRai
 ovnjLCQv76Bm+wNyUZK846sN53pz8477n4XhIGCJ550sb4Y8RktX0aoabtR2knUsDuJc2w+CU1e
 +4BuSvA1fRw3yyQyMrx1L0OgE4uutH8qszluhl7o+KjakatwrMOlK5ECxeBO3jSwKnDIzVcTZ4o
 es+YiWK7yf8xoENwGDsTisnY1wbwOZO9xmFVY1rFnnaIBgv7az7HamFD8j59tkpIXGVYgvG9lLT
 eWrGRyBS9Kx6HZ40M1RhsuaUufIZNTBsrRU+3ZGuZ3/7CYyYfn1/9h4IHQKlY0SB/6GaGbCGMtd
 xYyIeMOSk0jASVL9rc/Rbu5fmTzzDDQJYva4QlbyMYNKPBxQkmMFc/MfBeW7gkCbYGzQqzp0a/H
 K85+giz1A6nPbtyV/kosL+GKr3MITh3C1yDaPuMXHEfm3W0TrA7fODfcwabNVH9Ygu6ooiw89wF
 hjgrnCuPyymw3Y7vzdOqpwQGFfdrCqqQgHzO30CrNd3HlDr+40nFOzBcl1NT96ec8s7n7z6SOAl
 p5jp7zvUrcbwkcA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Oct 2024 09:23:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5609

To make references to the bitbake repo, add an extlink for it and use it
in the docs with ":bitbake_git:`lib/bb/utils.py </tree/lib/bb/utils.py>`".

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index 35c5c14535ba67aae3554819b55f0fb52a9d0027..d45aab45241fdce0e7eb3938e7562168752d7c93 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -90,6 +90,7 @@ rst_prolog = """
 
 # external links and substitutions
 extlinks = {
+    'bitbake_git': ('https://git.openembedded.org/bitbake%s', None),
     'cve': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-%s'),
     'cve_mitre': ('https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-%s', 'CVE-%s'),
     'yocto_home': ('https://www.yoctoproject.org%s', None),

-- 
2.46.1


