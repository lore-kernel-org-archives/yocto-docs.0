Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBCAC83F34
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 14:27:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.16430.1753280850251621845
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 07:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=epXUGqSI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 787844442E;
	Wed, 23 Jul 2025 14:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753280848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IUM4Adzo8rR6BUfwlvEIIHIhJLmnRRdPS5iGbL3VCVY=;
	b=epXUGqSI2iWDLXWu8jpREw1a/Sj6fwWjc6ttaycWACQJ6s7pYx9q/LDftaUwvlOmKYDO4k
	yM5ip+nhTfnd0haXkCv/JUr1i4vPFKB7066k/zxDCpKrBu3AltDbjxuknQ8lmQv7TSrEBi
	EeZxPutsBfVqUwtLlhXuK/XPb0OI2fhBR1xQCce5G+jxk6wOSq1z1b9Bnp3XaqNP4KbXG2
	AfQgVxqgzjNuNosNzxyovTptOHTc4rtyU7hDKRSJHgknX2ld1g3CAbwH/eg5j04Pek5/vX
	KG0lu1jgjG44QpcjkPSzEiY7Xv1xnWzZqLVRGRtG73jarr4N9uOBCGaF8iHmrg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 23 Jul 2025 16:27:17 +0200
Subject: [PATCH 1/3] ref-manual/classes.rst: insane: drop
 cve_status_not_in_db
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-refactor-qa-checks-v1-1-3a72c751ba83@bootlin.com>
References: <20250723-refactor-qa-checks-v1-0-3a72c751ba83@bootlin.com>
In-Reply-To: <20250723-refactor-qa-checks-v1-0-3a72c751ba83@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Tn99EqM1wLMjov9n/7qA+RjFR9tLnNA0UCChAR+SRA8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBogPFP3xbk81EeQEC8LeCgfXhwIBfmC9Esc1NKs
 gzrTBhLPZqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIDxTwAKCRDRgEFAKaOo
 Nse5D/98wf3BQzk4dPnB0NoMy3kfy0DwVvKFcIoDpLhZgqulSX829paTzN6NhtgjesapFX1Ev8T
 TjZ6qk+IKkpID05wLMlGGCfR79gLFi0oCw1Nk48nCxgL/2TkK0szENAxs9w6dAiLJtAnROMLQNW
 ohObatEm3tQgj8Zrmd+6wRZpgak2W9+ojo0eDR0C0ssoBi4DtBVeCuwrGBmgyvVC1FfdEZ56208
 DfJHBV9t9Nbhm8aHccJh5hDOj0uoe/EOpw0riPvbFjUwOVXGLolLUOuR3z0yKRDpwf/HvcvXHPu
 NkxigA3HXeqp8VpkZtynhfa9SWVdK5Lxok7syUYvlvErN4L8NV2gc5rf5oFCpXJ5g1v3xzr1IJl
 TytGQcoSV5X1r7XM4hRlI4U03x0QJqFsu3MGuLdFl7gp/HpagUOT5ESe6j5K088hG2b/4CiJzcw
 fnaAhaNrv80Vp/DrbTjiZz4lkoZeIXMbqful2kkiTTnCDPI55852CddZqDYPVz+VLI499VYPUaS
 FpNqqPU1seTKlMmOwAGk6cU/O+ajCfh5lK8kquL8v/l8G+BPf8WSvwIxzAJxA/aUs4UMxRfSuV3
 ZBk2QeQbJ/v7Yx7CioUde/OaipVtrkJxtmv0b22euLOla56MsMH9FNu4zdVQVYBYTxpFNyfqlbn
 lu24y0fC8KjMokw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejkedtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhro
 hhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Jul 2025 14:27:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7366

This was dropped by commit 452e605b55ad ("cve-check: annotate CVEs
during analysis").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 4705ca3f4..f22af7b04 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1395,11 +1395,6 @@ The tests you can list with the :term:`WARN_QA` and
    paths to locations on the build host were used. Using such paths
    might result in host contamination of the build output.
 
--  ``cve_status_not_in_db:`` Checks for each component if CVEs that are ignored
-   via :term:`CVE_STATUS`, that those are (still) reported for this component
-   in the NIST database. If not, a warning is printed. This check is disabled
-   by default.
-
 -  ``debug-deps:`` Checks that all packages except ``-dbg`` packages
    do not depend on ``-dbg`` packages, which would cause a packaging
    bug.

-- 
2.50.1


