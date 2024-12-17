Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2E4E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:27:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.77898.1734427635703907565
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 01:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fvtAUwMT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B22E1C0010;
	Tue, 17 Dec 2024 09:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734427634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FLYvaujV4R/wPOZkudl/xw0jooiri2vNYLfgjtkidMM=;
	b=fvtAUwMTd2RdIwlOezb7LcTt3Wtow/NL4ZmTYFh4BtSquSdreGm0wD8ridQDlBOj+5UgJg
	IPnbZ50/rd1FnQkIA7YFTYX7vauNeExklb4eNxzOiLBNLJvrrb7F3yur84dn99MSbgvOi9
	z7dv5AaLt32+JHc4TpPayTvT95mwTN+v0fys6PAIHidJbz4Jw6kQThdNAO3djeVEqIgxr7
	buM1PgI+NbK944aUcLEk0u3MhHjUQvpBfhGmpFHrzWuETYuZZdiVCScUwDsWThbiC4eGeO
	sGc3TkBClVexNmcJeTD3o9r0cXT0N9FsKvmdFMmmrRZRKx2ekFiPCTeIBu/VoQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Dec 2024 10:27:03 +0100
Subject: [yocto-docs PATCH 04/14] ref-manual/variables: add missing entries
 to SDK_ARCHIVE_TYPE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-release-note-5-2-updates-v1-4-b189493b1b09@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
In-Reply-To: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=784;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=AGhXDXDoZlVZfBkAm+13Rc1LA42UignrXD6xEncUcPI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnYUPw65RHcFkBI9XZGY6tEFT5spuEKkS07mVm1
 0VXqjsIsS+JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2FD8AAKCRDRgEFAKaOo
 NlJlEACnaTnsGHLz4WUR5s2Cm1XVoMk2gjMP5cnkeO2m5XALie4I8Zw2Jgieqr+jfczmWjJBVii
 yCn34EcSJxOBzI/rvMLHXZOUvaw6a76P2DQi3sYHfN4yDRaW44ROa5QAET3sbqyiyLBZOgZUiEc
 /m5nflVGUDulY20dckdri/hB6D4wL/vR6dihMc01gi3sFnrRskytV1q+gAkVVg9je9H40RUMDLl
 5mcecxZ8/AJ16Xp921ym+woUySZwhFB9QZdN2k/1m4OtbkqWNFeKWY3rgqiCPQwTr375vhppP1u
 zubGQhpQIVV2TEqjdDJdEEd3E/Ca//howFUD/nnlh3MjcHRIK+rpHUFv7fvLPNBSiwOA5Y0KjlI
 OtlScEmG+SHRrs5HNWpQoCMvdIChaKJr2Lq45DYJc+YUmXDvzL5lQXph5xGWZjKanyginLrpsJP
 UkbzxgSlh0NIO27wRWPCTahCPn7Q7DCKmnA3AuyErKx5h6HDU4OGIGubPkFnidlf8ERKHljUrcB
 QDD4sSKT/YyI+ULn85CYwFqrUmFPF5u0DG8OMNr7TY557aql3Q8PQh2CYLDdnCZpcjZ6HuU3R8v
 2Y/OYIkAsGJb90CgSorQDE5tsc3vQX98e7i6V93U6ZyNlvQCuRZ3EgD9MH94CW/Uy8ae3T2HpBE
 X2e15a0FBMTlOLg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 09:27:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5937

Both added recently in oecore.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5875ee3e7c554ffedf4af86e61c207d10aa46ad9..ada761045e9bf37cb294c0b66007a9faab995ec3 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7515,6 +7515,8 @@ system and gives an overview of their function and contents.
       Specifies the type of archive to create for the SDK. Valid values:
 
       - ``tar.xz`` (default)
+      - ``tar.zst``
+      - ``7zip``
       - ``zip``
 
       Only one archive type can be specified.

-- 
2.47.1


