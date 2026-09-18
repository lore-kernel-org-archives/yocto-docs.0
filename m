Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26377C982D8
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:06 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11754.1789739639109856745
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zjd2+K7U;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7B04A1A091E
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:53:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4F85560649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:53:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99BD310328FE3;
	Fri, 18 Sep 2026 15:53:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739632; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gOeXWOy2fpKnQoQtj8C10a9U4zbh4jsER5fCAGGzRys=;
	b=zjd2+K7UB+qG02rt/CF2OzGkYQ837Fp0PymeHBsovT6taT+9dtit/FqbXnqg0fRV7wPtu2
	C2T6eRG+iJ1GDPbFxACgxOOeMMYHCFOWF+lkhFKaG/VCksWPm4slm3v+V4IOTsY2wHeL25
	+IZkDE44bGxzXPrDWCEp8imB/RFBnvjvNmVHVF8OV14ejKEdaliZ6tRbrqusnMRHxYCPRh
	oui4i+C+4MsyUScXo/vrRGN8Y/9YvTSmizVtaTn1YsNjCH39hZjfvChtJ/L7zAk7EwKLFD
	Ga+xtIHJ7a4ifBrGw5sYWgQg/1PBVPvQrhSHN8o/QonU/Kuxt9+DRf+ukhGXAg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:32 +0200
Subject: [PATCH 02/20] ref-manual/system-requirements.rst: refresh our
 supported distro list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-releases-notes-6-1-v1-2-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=DvnIYOWU206jwR9qHYlDQ3t0lD2MQneBRfgxNbLJXqE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJjnZV37n0rgasHm8s1HPt/mpQ0a+2s+3nQe
 fa49ikSwleJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CYwAKCRDRgEFAKaOo
 NocMEAClnqpada3cU5o6nqKkiGaORPdxnx9qsZqv3/PwM/Rw5T0EBNCkXRNS4Y+cUhm0w9kXgVJ
 dSL1u4Ar3NEJW+tB+VMVYyvlsF+BbiY56ToE9hyvidvODW3qcFaFhkpES/Iqiy7a/n311o0q9mw
 gDSftJf+XbOAnoh43dy57nIAbHbYTr7fGd79+1T2gWZpCkSImrrYOMTkTmUJE9GfIW778JeMndE
 59ygRIWWadCJgvomP5CxQ0NC71N3r7/FqPYPZ+itKnGODfCcLCfggWvhxHqs48YVTpqH9e6Fz95
 uZFAWBC0K5+Uc05VKLFyAGt5Z9tg3gwJoge5YakPKoDSlc9pyQFJ8S3vv5EUZwYjV1Cz0ZihFPQ
 vaz17lpSNUHVUkl7kcaQpmbD9/QwDwfWRRMTXif8cVZhTGF1SWhOZgUaeOA07U0hXs61M/DWnHe
 Rdnd34UwbsJzpuyT7WktZAPA4n3ONq9kxsgtyXpgcqaV3qjL8XIMX76GgF4AXFkXnOKsEeswPQt
 6FiYw8SX6nk1feu/lE9VLRg9gUGKWljpPcuLANxGkEzYaNxoY5n40nUYVYRsb8RMwQxqiJEVSsU
 Dold94pPgUfgpWXfV/eLOhID0cbrShXsjO+1ozD5aeQOG8NKx8XrJYwmcI88/InyONP0cvQNBUX
 qzlZLH2omufiWKg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10534

Those are extracted from what we are currently testing on the Autobuilder.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index d602fa2ca..c0eb01dd4 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -64,16 +64,20 @@ supported on the following distributions:
 
 -  AlmaLinux 8
 -  AlmaLinux 9
+-  AlmaLinux 10
 -  CentOS Stream 9
 -  CentOS Stream 10
 -  Debian 11
 -  Debian 12
 -  Debian 13
+-  Fedora 42
 -  Fedora 43
+-  Fedora 44
 -  openSUSE Leap 15.6
 -  openSUSE Leap 16.0
 -  Rocky Linux 8
 -  Rocky Linux 9
+-  Rocky Linux 10
 -  Ubuntu 22.04 (LTS)
 -  Ubuntu 24.04 (LTS)
 -  Ubuntu 25.04
@@ -88,10 +92,10 @@ organizations publishing them no longer make updates publicly available:
    (meaning there are running workers).
    See https://endoflife.date for information of EOL releases.
 
--  Fedora 39
--  Fedora 40
+-  Fedora 42
 -  openSUSE Leap 15.5
 -  Ubuntu 25.04
+-  Ubuntu 25.10
 
 Note that the Yocto Project doesn't have access to private updates
 that some of these versions may have. Therefore, our testing has

-- 
2.55.0


