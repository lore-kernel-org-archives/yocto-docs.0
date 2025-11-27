Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD80D111A8
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 16:38:08 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22591.1764261481526118969
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Nov 2025 08:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2lOgsGjJ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D25551A1DC4
	for <docs@lists.yoctoproject.org>; Thu, 27 Nov 2025 16:37:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A9F6360722
	for <docs@lists.yoctoproject.org>; Thu, 27 Nov 2025 16:37:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 302FE102F275B;
	Thu, 27 Nov 2025 17:37:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764261479; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zjPZoh3A1HBoxJsckWujZmZWq8aX8y0p56GY+eg6938=;
	b=2lOgsGjJOcSg2jzjpTjsdjZwNAnhzzWXMSGFdYmcE64ZIxzKUMb0o66p4cfTF0cu77zbSb
	kBBCjNrHAb4Z75dq4DnEU6zjjhIzydufxnqv2Kn8sJyhrthRwm863UOWDyY4SfqFaOxf8f
	0kEZ2/NUtUxwd8Hs+4jkJFwFfVLM+MpL9XJ933rcG3HZDPBM/YSgzj3ItUD3RWOtKYzwA+
	1L/FEKcZyJPOE0ov4WC+Y401C85mEIXfR2RDMhS1kHL+6pp1aKGynsYiJA77s5GQlp2MYb
	x3Lfi5TIyGPQvB9BHfres8LtlPVtnsFQOSMCfMHQ460B4hKo2eOS72qBr1zS3w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 27 Nov 2025 17:37:45 +0100
Subject: [PATCH 1/3] poky.yaml.in: add DISTRO_RELEASE_SERIES
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-bitbake-setup-updates-v1-1-75ac1e490a40@bootlin.com>
References: <20251127-bitbake-setup-updates-v1-0-75ac1e490a40@bootlin.com>
In-Reply-To: <20251127-bitbake-setup-updates-v1-0-75ac1e490a40@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=PvOCPKzaxVz4bnrOzmvmCcf/h1M7JvsPU5VKbCSvju4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpKH5lHCh3NAW3sx+royfwuTwuIfuiPzFI9CE+T
 Nhqlq8HASSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaSh+ZQAKCRDRgEFAKaOo
 NopGEACSgOjFp65YsQy9AkxsXYnngOmuYmBU6lFFEJslzld6QHsKfniXxYfOiqGLIScjVZrmdFh
 F6alMOWhBvp28g9WmpK1n5h7XhYYWPqOCgYxInPweah944SLIZQuJ9KcsXAKgxZ6BE8Im2pILCH
 gw20wLCphvoi1Q5YU6q5ME3/vCcMAU+V7VU1QBMyxG8U7y3SoGbi82fNcBkV6NzCulMR4J2O8W8
 sDmo3WlhQIljtbBJxJm0+vOidK61bUSRfV1SWcAWcVCiyLTwgTU6ztVWLgeBCwA2bDApYzCJ/n0
 Et2xi1p+0IWvaE70GDCcmZ171fyUedMQ9a060L1bjXK1U7hhDrEATboxOzIS5a6fqm0Do2FD0WT
 3pKYBIgVQtUsE041u1F7uJqgQBW+CjTvupWTu4WLoUDX8zQJo4gywZIkJeIUkkdhjs72eLUk+gg
 qwN3wUiOOt52LfU8eIBzZy6py5H+chnS5yJss2Qgrh9dSL1CGjZbTv0wXxvJkeZ54UhzW5CSC2j
 YQeCTIxlvJmbSkmFB5vUGwkQ4jqCfNJnMk2DSGFVSTCNRZGi4AFToyGXnOfeXsw0RCSemXo9NiM
 AEKIBfRTFxEzmRhoyInqJkLDQk8e7o9dA/Qnn6ODgZqyULUlt2Gy3mUL25b80HFS8vfbC177sPZ
 8sNQzWudTffr7jQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Nov 2025 16:38:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8155

The DISTRO_RELEASE_SERIES represents the release series in numerical
format. So for whinlatter, it will always equal "5.3", no matter what
the latest tag or patch version is.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in    | 2 ++
 documentation/set_versions.py | 1 +
 2 files changed, 3 insertions(+)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 7a19545d1..810efd4d5 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -11,6 +11,8 @@ DISTRO : "5.2"
 # represent the latest HEAD revision on the branch). DISTRO_LATEST_TAG should
 # always point to an existing tag.
 DISTRO_LATEST_TAG : "5.2"
+# The DISTRO_RELEASE_SERIES omits the patch version (so always X.Y).
+DISTRO_RELEASE_SERIES : "5.2"
 DISTRO_NAME_NO_CAP : "walnascar"
 DISTRO_NAME : "Walnascar"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "styhead"
diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index be05ef323..d146f93bb 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -190,6 +190,7 @@ print("Release series calculated to be %s" % ourseries)
 replacements = {
     "DISTRO" : ourversion,
     "DISTRO_LATEST_TAG": latesttag,
+    "DISTRO_RELEASE_SERIES": release_series[ourseries],
     "DISTRO_NAME_NO_CAP" : ourseries,
     "DISTRO_NAME" : ourseries.capitalize(),
     "DISTRO_NAME_NO_CAP_MINUS_ONE" : previousseries[0],

-- 
2.51.0


