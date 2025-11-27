Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FFDD116F3
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 16:38:08 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22599.1764261481885516800
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Nov 2025 08:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Aqx/WLVH;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 49C8D1A1DC6
	for <docs@lists.yoctoproject.org>; Thu, 27 Nov 2025 16:38:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2168060722
	for <docs@lists.yoctoproject.org>; Thu, 27 Nov 2025 16:38:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91DAA103C8C53;
	Thu, 27 Nov 2025 17:37:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764261479; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kc7S19f2LlsIjWKUD0f8tf0FiE/v8fRKoIXms5e4zyw=;
	b=Aqx/WLVH7fT+UHtq9aYCQVPzkVuUapZDZxoaGyUxGt/PsnH9F09MaOVCZNtA8R81Hgmyzw
	3ctuj24hnS02TuApDdkbtUo8g8LVHZpB6OvXXVwqbYmO5mhV6xnBfzccJ4q2bH72//WO+/
	UrCTtbd1d7eAZ+ph+/C9SXXQd+pm+m1T5LegmqliRWTEa0v3/NRXbD1OyZFfOPnsHGorBJ
	8PofXXx30tj9DC+oGkaliAVIn6pJyLmYlh9edBIS8yc+Dzy5hB+ZgvnRBbOQ3HCmv7pmxm
	zVBKN15BxzcmAxJm2gsv3oygS1fKCSQe2gqdgumPLttWx1P4WNzTRs9MHDZyRQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 27 Nov 2025 17:37:46 +0100
Subject: [PATCH 2/3] brief-yoctoprojectqs/index.rst: update available
 bitbake-setup configurations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-bitbake-setup-updates-v1-2-75ac1e490a40@bootlin.com>
References: <20251127-bitbake-setup-updates-v1-0-75ac1e490a40@bootlin.com>
In-Reply-To: <20251127-bitbake-setup-updates-v1-0-75ac1e490a40@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=AJ+EWcQWzTms8OQy45CUJehrfQLzhvI5gdpXcptkmE0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpKH5lIUyluTQMATUvQkHhi+aOzQNOYGSYaE641
 m1CIsdkpSmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaSh+ZQAKCRDRgEFAKaOo
 NrYNEACyBvdkPgAvsiL0uJ5+kI9H/YvutP82gob/9WVhSxevcZiPuSoldxpZo8yrvjOPKhFHhos
 GDq1A62v6C30PVNU+kc4FzZXNj1F1YLBBLJk0EX5N7Z2HPqwwIrhi5cXlH5wONxEgqa9nhbQf3C
 8ggKNDRxzx8wDKuqOw2J3NXj8BqgtK4YEiEwTg8fURX0D/qZ0fVkEPdzGxmr4MgOXczED7PmqZL
 tsiCTUVnwLilCRixE/i/gtvlXnndGYikHLFh37dLVEYGIkAez4cpC5U9+JEtWJuxS5V7UwW5w9E
 v6EpuMPjSiFhViE1k1DQEKuhsW09PG587DhXFslBn+E0yuGELZjTiy79YJUVrQmVm77wJWlvecT
 COQoPcNKmfDujpB3vvtgwcGIb2NuWifKh/OGa2H1kMohdgYI79jPosbuYUope6qx+TrXLRXLG2H
 ajyjHI2IXtaL5DT204mdScnffGrxKSYB0SXp0XcjDb9G8o97rr+DtAvvrka2LhpZXeKbmiipqYa
 1lXZyBH3KJssrX1otB961AGwwMuEXKsrFQREJ5akhsSfFW7e80phfireOf3v0wO3/NxGpFBtxLh
 5s2yBsrvIr5zzk0Ya+SRiGAGDrk6Ul8Z/6gZoO80/Ig+6MauyDHt3mOhONL5artmyr8R8kgVvra
 6dpHDyVMc7dWfRA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Nov 2025 16:38:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8154

Configurations were updated with commit 720df1a53452 ("bitbake-setup:
add whinlatter configs for poky and oe-nodistro") in BitBake. To more
accurately represent what the output will be in the real world, add them
here by using the DISTRO_NAME_NO_CAP and DISTRO_RELEASE_SERIES meta
variable that are translated to "whinlatter" and "5.3" respectively.

Note that the real output mentions "(supported until 2026-05-31)" but we
don't want to maintain that value over time, so just omit it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 07bb4e1ca..1e0d867d6 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -129,7 +129,10 @@ differ from the examples below.
 
       Available configurations:
       1. poky-master  Poky - The Yocto Project testing distribution configurations and hardware test platforms
-      2. oe-nodistro  OpenEmbedded - 'nodistro' basic configuration
+      2. oe-nodistro-&DISTRO_NAME_NO_CAP;       OpenEmbedded - 'nodistro' basic configuration, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;'
+      3. poky-&DISTRO_NAME_NO_CAP;      Poky - The Yocto Project testing distribution configurations and hardware test platforms, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;'
+      4. oe-nodistro-master   OpenEmbedded - 'nodistro' basic configuration
+      ...
 
       Please select one of the above configurations by its number:
       1

-- 
2.51.0


