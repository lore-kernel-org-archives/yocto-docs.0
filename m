Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5A2C88E5F
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:56:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41381.1789138590799479387
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 07:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0qYHyqa9;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 028B0C63A0C
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:57:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3339F601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7319911C7AFAD;
	Fri, 11 Sep 2026 16:56:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789138588; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R/ta26o24dCfRozXL2K+QJ/xVreF9Fm5mdDtoyU9qK0=;
	b=0qYHyqa9/Y5wrKVHeavjjlRc+o1GIyHdslgs3Xbdm/AP26b2fwNgxet3aU6QNaBGp4MJOJ
	4HzMUA85EwpcvntkhG2+c6irxwNBSwaFSwlPqLEkL+nsez6NtGWyBkhXPZ3FjMjnG2B8bc
	JLE8nHsn7LxOXczTxOkUWFodgSGfR66KROL036a6MoDre7neYeWgAIOW4bB/saDCrdAo4s
	U1wAjpbNcVQApZtQrq2GlsfIz0Kcc7lMw0zGuoD+yh/D6P/a3Yg7TGFtWt4s8a/NkVKYIJ
	VCzhU+5venmaH7i71epVLq65i9lhdttIrVJRRcdBn2yrEmxuHjEzO1VrAy4ssg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 16:56:07 +0200
Subject: [PATCH 07/10] ref-manual/variables.rst: BBMULTICONFIG: fix a typo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-assorted-fixes-v1-7-0d92a8112918@bootlin.com>
References: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
In-Reply-To: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=963;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fVpF8xXTUop8lng672mpugLGMMIltu+JnJEGMUERHfM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBaWI8C4f6LFeLXdEOohX72Pbh3gG88OO1ILd
 jjf9xn7hQSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQWlgAKCRDRgEFAKaOo
 NkYtD/9VLOp6A2Fb0fvGnYyNrVso+yNogRWfuJxLgBVHnRLo9XiwSQhSAnRn37CAHMxs0vbzl1O
 BEuH3jjG4Tx/rp7YpXp1+gC+vA4AEM/kDEet6kHTJrj2Hkn42MBDM5++MgkCRxl6tsBZROliLgJ
 AgzqqLnmjfvBI/z/9ePw49crSvt90elaVSl0WYQslDg+dYIhNJd9xwybEJfKF3mm9a6sddR6M1I
 vck7LP1iIbL108Fz4HbEkPxZA7uhVse18wyZNJtP+2WIQ5A7Lz9YQpsIizVfOeb1KNYt6d14EZn
 24mxzGiDE1karhoEauQbLJyo452Zsa1otmJDWH4afS7PiDX5XF6o3OSj1jWMuLrJR30gj7xNObW
 XolZVpcIhoWd8Qpeaqug9gXrofvX4UcDAauk7ScsIS/wRjpuq9QeXUkRtlwwrnnE3mvhSvqTpiL
 XqXzndYEHUX7aEPAk/o/7P1hOpWFtvAPg/6shCnmfDaBJncM1G0QrXeMS7nSvJjhobjKht605L7
 rcnBN1JzRT9oMvKTYEf8vjeOavgZF8nWZOBt+zKhmI6486+cuSonMogi5pwDwvpSBLApZuWCCl1
 AO4X0cQWMExmPNxfuLHxvDcIF9B3Pnu6d82pP4src9+puNPzd2u20ZHbJYdKH/iJmwgpRmG4iHy
 X9tOEJI7hVCkKpA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10461

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 08eba7ec5..972349497 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -943,7 +943,7 @@ system and gives an overview of their function and contents.
       Specifies each additional separate configuration when you are
       building targets with multiple configurations. Use this variable in
       your ``conf/local.conf`` configuration file. Specify a
-      multiconfigname for each configuration file you are using. For
+      multiconfig name for each configuration file you are using. For
       example, the following line specifies three configuration files::
 
          BBMULTICONFIG = "configA configB configC"

-- 
2.55.0


