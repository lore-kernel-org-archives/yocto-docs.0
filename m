Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14127F44872
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157882.1775832229580862187
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZqnLFuoS;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CC3B3C5C1B2
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9E525603F0
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2D4610450070;
	Fri, 10 Apr 2026 16:43:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bN3sDV9Pbzr3OgciYa4naYhSYgFLUmPqPHzi0vdfs9o=;
	b=ZqnLFuoSaUc9ReQ8oY3C45YYYFo0A36q8gaVUSvF98VxY6KRDfXwrdL9SI5R55TgupFa0J
	mqKAfvDPO9ZsYdbZlY0I5Km1eglkb+nKcFDUY9DxEZjnG74TnFd1osuN36dzO9i2/jO/we
	RFb5ud4Lnvsso+K+iYR7Rgm9n1q0Q4KYnsdO+bhMqQ4DBWhkCwei7oZgJP0eYzlyhF7gLg
	syzx34VHKqvxI3JIaoWrths3Bnz1HKr/LrV5Dgx5e26fDTOlNVFhOgUGXY/cJulDyrEJ8O
	4WlRYOdcD1BI1mmwPlx0cNw/36GJMXmssdzIJRVVfkFoxB3ZhBbWOdSrKmT6oQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:38 +0200
Subject: [PATCH 14/18] ref-manual/features.rst: drop pcmcia from
 DISTRO_FEATURES
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-second-release-notes-6-0-v1-14-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=862;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=UNmVsgejAAcCKSLXFFG+1hJAkQF7PhsjlfMX3/NM1ko=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyYz3pKDo8Q05kDljitrWXgK66FyKb0+9Ga8
 Rezks0Keo+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMmAAKCRDRgEFAKaOo
 Nk0BD/9bPEM6Ax9DtJlFMbEXW7rV5k9o7h14CwVy46mLsy2oJZjbRXo1prU60JzR4f7+fzfgnld
 2rnJ/JBVlZ5t8wgEuq+DUjFBGe8HmoEry6fJmCGIRHNdynvGknrZOng08MxMOgVlUkajC7LmQQJ
 IvXhMRpnxfUwrkqQf17FpgE4yy6o/li+RwoZ1wI5i4kgGmDGfqAG6O2Ec9/neC5XEmD/Z1duyR0
 zrLWPt9giaLd72Hgvpo+3GWxx70AGZYennO146OUxE5XszaP0ySjlbcuvqLWuNCpSGnsoT4+4w/
 /0mJwuNtUWyZlrC+hYLbfkLTMDqQr78za0mclpc0SVlI+lc1nlFMFdV72q9LWYit0eCZIesgK+M
 AYsp1pIG+idyW8jYOwNJhtVblgu1QMLBm1xZriO+R5gYciYMLdG+Khn0tmNzFKRDV0zycl4/Nj6
 BulXJfsRb4oj2XATaZp6qW6Yq6EbjW5eyA0JTFWNNQr1yO1RWmT8yGU5vs2/gcJQcCWABYvEq0r
 9L6fXkv076ju0o/lO1TpIKxVnk0foPbpYHccqRs3oeIVB3U54T6ROon2RKAUDT4hgaDh8LsUMIp
 VZkbSofJNttsP+NYjKWgk7mFpH6gSUNwmTqVWkUQGjoI7baQTg40vGycrhCjjFZ1LHt93kxw/iB
 9IRvmxI9gy0xA2A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9239

After commit ec0a7650a4fd ("conf/packagegroups: Drop pcmcia from
DISTRO_FEATURES to MACHINE_FEATURES") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/features.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 5fda7ac9a..9173b9553 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -200,8 +200,6 @@ metadata, as extra layers can define their own:
 
 -  *pci:* Include PCI bus support.
 
--  *pcmcia:* Include PCMCIA/CompactFlash support.
-
 -  *pni-names:* Enable generation of persistent network interface names, i.e.
    the system tries hard to have the same but unique names for the network
    interfaces even after a reinstall.

-- 
2.53.0


