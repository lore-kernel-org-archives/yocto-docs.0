Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9187DC7EE31
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 09:55:07 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.4869.1750758904883867510
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 02:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DxUZYdw2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E62E643424;
	Tue, 24 Jun 2025 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750758903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zIyUPJOJT1MIm8WhfCXQb5DOaCm4b22ChLP5DJaum/w=;
	b=DxUZYdw2ljIFC4cLu0Zgkct2yxcA+PjLwLv88EDcDCCZTpG0DQvUFRCsD2Jb0xh7/KkNi1
	1wHLRYXxIszxHBB5cA1ajF4DzDNKricSjKu8SmrBqdwsPfPnE9WQ7SQeNThIMd15AS1HMn
	Qw5zYqr1J+eWLOGqUBXNLhnR2+QTAIGghqnMlfHT/V9kwTERXtGrk8TIDAallVdkxQz8Rt
	QHUs/uKTu7K9gCKYrsNi/jChgGlcVtCPm48j0FKrRyzlY6kBlEJdWF7cqnaB0tKTlZmiWS
	Sm6esTea8BfJ5hTYXVGkvrAw1i30qNaRVkWBTP1kcDPUrWg57MBP6BGi7KlDoA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] migration-guides/migration-5.3.rst: add guidance for
 breaking WORKDIR changes
Date: Tue, 24 Jun 2025 11:54:57 +0200
Message-Id: <20250624-migration-5-3-unpackdir-v1-0-ef6ef00d5cbc@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPF1WmgC/x2MwQqDMBAFf0X23AWN2qK/UjykydMuxSgbFUHy7
 w0eB2bmoggVROqLixSHRFlChupRkPvaMIHFZyZTmrZ8moZnmdRu2eKWa97Dat3Pi3IHg9fHjUD
 lKderYpTzPr+HlP6e4PUgaQAAAA==
X-Change-ID: 20250624-migration-5-3-unpackdir-9e2e7bcfee1d
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Alexander Kanavin <alex@linutronix.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=631;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=uhrYeCKj9Dxjx8IDbAyhtSECs13Vl6l9dDp3b3T5DSc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoWnX2AsZdGalxJUN7LuCYPqWJme1GDweym2F8F
 WLVqqCpKquJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaFp19gAKCRDRgEFAKaOo
 NnG6EACzp+mUCS3GRhYoFNwgwBI3x3BK9dqgqlJ2r/bUH68t8YEbTGEc2waTtS4pVdmObs/Mt6/
 brZ69p8BU1YVGkLJrty1IWK/UlinWE+OfIEzY6Sb4LLo30Ryki0K0YzYTmCAfYn7pFvrC94c9it
 nDQAXDhqTyhr5llF1PkS3H6NgNUD93adbQOMRo/mV7mdMitRHZ59mwuWVnKTd4F40XTPQeXtGyE
 epae6BzzDmnKAiaR9GIVKkJjH+6iiA+8/E4Mcrn+LhIAAKBP3PtZA0K07l7TdKfP3Bg+x8iNejt
 uIBPp9USESXP0EFS4zT/GJC7YO3mhwC1SPwbv+HhBQuJwtKQew6c8LbQGwdQQokr7grpHkwqTGl
 rHqKnaElu+X6nVvthIb1CHMosztxzIP7Do+Xbpmr8b9KMR8kLq2gQE2lUjrq6x01CwuhmVT8FYK
 wfD1QW7eGkwTixXiWpgrJ9qKB/KPnhKXWIbX69XcqAFz3gMR8loIEItfkJzi2e/7c5KUHopWO0T
 eRpRrtaPjtkb8LN9pe4i7LFiRW4zlycWg79X8C12OOOZ2O8yCVEHZ9jLHdMQ2nobsDxUYmu7+V/
 iHP83vWbkgdis7HLfG4Ud/TpcFPU29/olFYT43y1z1A0uGfuETXEV/LfDAWT2H1EJCd0HinnNmP
 sdJhsYZlbz5IbVA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddvfeekffetleeuvdfghfejgeffudevgeffgffhjeetjeekvdfgueevtddujeeknecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrlhgvgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtp
 hhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 09:55:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7206

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Alexander Kanavin (1):
      migration-guides/migration-5.3.rst: add guidance for breaking WORKDIR changes

Antonin Godard (1):
      ref-manual/variables.rst: document BB_GIT_DEFAULT_DESTSUFFIX

 documentation/migration-guides/migration-5.3.rst | 50 ++++++++++++++++++++++++
 documentation/ref-manual/variables.rst           |  7 ++++
 2 files changed, 57 insertions(+)
---
base-commit: 8a64ef83efcd5df70706a651751c8198f7c27c13
change-id: 20250624-migration-5-3-unpackdir-9e2e7bcfee1d

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


