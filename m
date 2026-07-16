Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8C9C44514
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 12:19:23 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11536.1784204354093520764
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 05:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QgiOLpoW;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 768E1C2B9ED
	for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 12:19:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 277A2602B8
	for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 12:19:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66CE311BD3CD0;
	Thu, 16 Jul 2026 14:19:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784204351; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aIQm6ksJ2b3o+SmETs4qAulYZ1LEI4VD6ZHlblc85do=;
	b=QgiOLpoWCInMfownmxlld+2LRBxqMVRT7y/h0svRnNFgmWNWVFQiSwRNy1EvVvfCUGapuf
	WwSiEHPtKPcrzzVZRWKhr0Zq0CPz/qMuil6Mus/e0jFMSX4PT2A6rE9NKPzxIO1ciUAUDh
	qhIkGXmVdtR47KZmOiAGZQweQ/sdOWznKMu5nGgQHEZjIoju8yDhbo4zuO98RwVTdfuSS/
	hMkmfrCaEoOCdK4aTZx2/mOH53kcMXBvibQdxcQQcAVPJ/aUEXBNefWTkwl9F1B1LipCZY
	FXR69qatzTdjb0Jz6wULJYMvyhZy8T1ldXR5vyHPot90ARUVEaX4EM2Ni1hASA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Jul 2026 14:18:34 +0200
Subject: [PATCH v2 4/4] .pre-commit-config.yaml: add gen-doc-links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-gen-doc-links-intersphinx-v2-4-83cb3aef6ff6@bootlin.com>
References: <20260716-gen-doc-links-intersphinx-v2-0-83cb3aef6ff6@bootlin.com>
In-Reply-To: <20260716-gen-doc-links-intersphinx-v2-0-83cb3aef6ff6@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=s4wwDGOZCiSJUMWk/d8oRaA0aQR2kO38lfOeimTtCdM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqWMw6pWlN/lTT8R/dKAjgNEd3V8Cl5I+WIhfL7
 sPuQhN+hwOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaljMOgAKCRDRgEFAKaOo
 Nm5YD/wNB9p+uqPAyoswMiY/56zdcA14+w+ge29WgwZtczxiFbUGNX+1kXnfGa9LZVCR+n3NuHU
 1G4I6apciuJZPHJMlAsreVO98ZPDXb394OyNVRTXUoLZ0k0+iohHxGMb2iXVGgsYQ9cyMOk1VOk
 WcMUgmdHY1Jg2XO+W6xctadcAHW3uUYOqja51/4SMoMvb8dGJ77dS6Elzxpv95BnMlfM0Ali0Sa
 UQ70p5ydkrprgUS7mOOjV8hugSXbHRO489aweEvVtxtLXUWIx32zcc2jGQ7LPY0oXjo05LgQ7MM
 dkpid0wvUd6Kj65gl3Y0NJi/Rl9sAreL1S3QK4mzrOUenr7yii/WFAYT2VE0A1xLChQgjHTbaB7
 3Nzg6bJtd+Pbkx1MQXFpS52SSQKKSeySCnjY07G+iV6Qcmy0QeyuE0ixeBVDQdIpiWs513O6wpt
 OFXaX1EYvTt9WHFw2F00shH8jqvvTsDLLqlAJ/P6XTQU/nfb31oGzj7KLIECEdHPSoMpbUkZmOy
 3Ny6kaFfxXTkBlcyAl5o6x+B0UrvhWpOFA0bBJ9NRNl8v3VPvP/CBE2rTjO8PRWouqcFaGKHChX
 UJThYi3/OwwsixWDM6OB+sNfVz5aZa5SYYqLos/FEAhrKH9ACdKOPJ2ESOfYa9V3a75iushQOri
 t5FOM9iO8C767ZA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 12:19:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10088

It is easy to forget updating this file when adding or removing
variables/tasks. Add a pre-commit hook that does the job for us before
committing our change.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .pre-commit-config.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/.pre-commit-config.yaml b/.pre-commit-config.yaml
index f2b73a481..041f5b30d 100644
--- a/.pre-commit-config.yaml
+++ b/.pre-commit-config.yaml
@@ -6,3 +6,10 @@ repos:
         entry: ./documentation/tools/check-glossaries
         language: python
         pass_filenames: false
+      - id: gen-doc-links
+        name: Generate documentation links
+        entry: ./documentation/tools/gen-doc-links
+        language: python
+        verbose: true
+        pass_filenames: false
+        additional_dependencies: [sphinx]

-- 
2.54.0


