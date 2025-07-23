Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A68C87FC5
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 14:27:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.15971.1753280851251386885
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 07:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Beo5xHGr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DD1044422;
	Wed, 23 Jul 2025 14:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753280848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BbA5ivjF9bjChjD6dPzLdHcphOMjwe+mxKuS7M5xiXM=;
	b=Beo5xHGrAPAuJyR2ZLBBnqee8ZeUpgcUfhZq/5C2R/H97//E4ZtYIkbQEAPjwOuZkqCpmW
	2E8aoDl+0y9xmNoA6RPH05wGKk5BnIa1BJ/E1XmE++LHz1UeH+nJHKrBpqvGRgT7SFnr0h
	JVKjBtVxl5l3aulVTGX5XhCv0+zj9pQThrWdLT3ZFXhFIeimCFQqftFgNlGpFOwxA0pXBK
	cOh4YPqcEjnDIbVs6Vvrgr6ySbYUtLmfc5txj5tCPbizrHAKlfRYlWhjuLKHusuZeXcVyE
	BB/eGCjYK6mLSGsKQ0w4+G+qhTWfRlBGL+Tt5YpcnVevtoOm59JzvaAp1sNEsQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/3] ref-manual: gather all QA checks in qa-checks.rst
Date: Wed, 23 Jul 2025 16:27:16 +0200
Message-Id: <20250723-refactor-qa-checks-v1-0-3a72c751ba83@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEXxgGgC/x2MSQqAMAwAv1JyNqAprl8RD7WmGgSrrYgg/t3ic
 WBmHogchCN06oHAl0TxW4IiU2AXs82MMiUGyqnMa9IY2Bl7+oCHQbuwXSM6ci3rsaDGVJDCPTl
 y/9N+eN8PeX/1GGQAAAA=
X-Change-ID: 20250723-refactor-qa-checks-f2f9e3b128a6
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=642;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=2AhqxEbIqWCHRp55P3g1n5DES9l1hQUU0G+wVBovtM0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBogPFPFgC4aneT7XeUAvZ+RGnQSyuk922KJ+u2M
 uqdKurVzbKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIDxTwAKCRDRgEFAKaOo
 Np2AEACkPtiZe1eMtEvtkWbhGriCs8k5nop31R4bWlseKEBtbHZtnLrF22beOaibG3Zhrh+uXoC
 zpoV+VlJ9zB82Rns6sF0EV3QRnbF1mqIynJD8Y+utsa0VtKjSnK+CwM8oim4I/2aPZbLwW/QV2q
 NGZi6RtVWxbg1o1B99PqdIgFdUlal5fkimgTsxCk3wN6AcQXxRNhwbAA2dzacVR6cFRel/NdmKH
 Cs6Jvbae1TofDwJYhvPqWy0eKqtdjUjDFYog8eJyHGqGrafVt4nX2AAG0n3/nv7ushsno2+3IsF
 SsJRY3Yi23HzbkJpjbvdTGXbAvz5CGctqXdVNXvUIUWveAxVFhPyuB4n13kahUBdTmGl2bh4Vys
 rVxZmdCh0YDsHJcJu1ExQwIoWVJLy1dipGB0B7uxReVwPFsmMzuPR8k9aSHnxOauD2lRJxUXjCu
 JeuMwiQ9GFyyK9hA6SUR5xfVoYQ1XIZvSug4UjNAQ2pBpEqtzlbh4N8Wsf5muVdkmqZFlOJUuGk
 /1I5RTpqhk4O19XkQG/MIbHqgYfaRY99MR0DnCdQzCVec+iVmop/LdSgbAyr2/3eG9FPZuNP30y
 clkWzOYM0fzkxHzhN+b0v6KIOIBJxic7PWthKhOwdln0TMkfoqxsG9fu0ayqStfv6Y4EX1QRuPA
 fThkYWFnILiBvRQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejkedtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddvfeekffetleeuvdfghfejgeffudevgeffgffhjeetjeekvdfgueevtddujeeknecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjv
 ggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Jul 2025 14:27:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7368

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (3):
      ref-manual/classes.rst: insane: drop cve_status_not_in_db
      ref-manual/classes.rst: drop obsolete QA errors
      ref-manual: gather all QA checks in qa-checks.rst

 documentation/ref-manual/classes.rst   | 335 +-----------
 documentation/ref-manual/qa-checks.rst | 933 +++++++++++++++++----------------
 2 files changed, 487 insertions(+), 781 deletions(-)
---
base-commit: f9f1c87424d307d2df60024bc448bd6778605cf8
change-id: 20250723-refactor-qa-checks-f2f9e3b128a6

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


