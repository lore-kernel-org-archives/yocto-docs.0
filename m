Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDC0C87FCE
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 08:52:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.77274.1753692752401466224
 for <docs@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 01:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cHizf8xQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBD8143354;
	Mon, 28 Jul 2025 08:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753692751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IUM4Adzo8rR6BUfwlvEIIHIhJLmnRRdPS5iGbL3VCVY=;
	b=cHizf8xQo2c8RkqFI6hvjjyxIKaKefrZ21S0k1CKZS20r1eXk9zMgIUqQc7J5pb/55fhEh
	fgdXZy8SGLfgWkmWRTmvH/aaXUa8tdkLa6CQGDYRL+Hgp4sMczqK/YKRdiQpm5S0jaeefv
	wi+4dMnMvaGdYEGVFijNBir6QKJ+vJe2Uq6OsW84R92ao/3dnQUpnhMZ9GCnF8phyqd3nL
	N8qch3p1jHJphl64s9D3CFsc1o9vKiHbGt7VEA6kmH1dxFV+2DnUD0JOKgKASMlXRtAcEs
	IhqUvULNqaWR9oRXA6GLZxb0I+eKzbckTIiMi8A2X2D1hRNYoE4P0FVtzs+8ww==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 28 Jul 2025 10:52:23 +0200
Subject: [PATCH v2 1/3] ref-manual/classes.rst: insane: drop
 cve_status_not_in_db
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-refactor-qa-checks-v2-1-9e0737979f05@bootlin.com>
References: <20250728-refactor-qa-checks-v2-0-9e0737979f05@bootlin.com>
In-Reply-To: <20250728-refactor-qa-checks-v2-0-9e0737979f05@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Tn99EqM1wLMjov9n/7qA+RjFR9tLnNA0UCChAR+SRA8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBohzpOicMoLN6BDCUBJQS12RqR3djOGcWn1gDwX
 6XSZokBgTaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIc6TgAKCRDRgEFAKaOo
 Ng20EADJ5l+/7CKeQiVmDAvGmUPIlFMWG2BUTu072/3A036JLvTouOGddkFqOebXQubLGk0kxoH
 zKsbz17IWiDtfWgTQ+8EexvRcBBDq2umSilBExusPh/BoQrIs7m4XlltksEd8cEDDZ8ElOAsgLI
 FsrU/UdDBXUqAtkkyO3uzFik4AngK4rPLwCJCWNkaHNhATQfDOZxnzhBAb6K1sfHW4ZXK2yFySH
 gcvXAkfYXT7YiRQ75em/lM1p3j5R6127T6StpXnEgcZMNGwR4I40c0A3kBkCE0wy8K7cWN7jaV4
 mTdZBycS3HQ7b6RRI55S9QYTUVOmeHu9HQwW+QT66V+xhxIRtUw+z2LPO7Grk2yo35aeQOTlCSV
 SLtD6yrT9qMDal5LQmc2qmMhjjf1ljmJxEVid56d4Uef7hVemfDWoT4GFT4w0YRb/fhNsPDupUB
 pjwT7mYnm80L8YLmu1aLjs3zUAKrs4d9E7v4/LoBPDl6eCvHyiPD65a+NkdjR2mWJsVbUPR0++F
 cr8WUZ89IARadV+VnsO4TqN6pQKTDXF/TUKCybs6LPTLDZcdbUD/V4r3G4X5XIWOMM11J/AEJ7e
 ISqukzWSi75HxvPKHgcTvjn/o0kacYID4iF9fF7oPilKssdi+/qdvX4xHZqpETzuqZ7lW+QE01R
 wRf/XpxLyRy2PhA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Jul 2025 08:52:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7390

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


