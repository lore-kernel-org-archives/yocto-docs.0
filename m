Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4305FC87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web11.3508.1753783014352384579
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GLTDXG+u;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4F454313F;
	Tue, 29 Jul 2025 09:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GV1Te1FrwuNK5QGU4gDrOVtzcRCaNVMSaks9jG4nYsw=;
	b=GLTDXG+uBAt0AoxS+9WyPCewiWauduJV78FpzQLH+MZ4dwYmzkPpwVxKmWgzYWe16scMnw
	ghCfZ95BW5m0yllpdwYjIsoRfZwoUnn48ON8kdICpDgpTtBbUFD85FCg8VmLWSIuoSNz6W
	b5VkFulrUn98wYrX1ktvCmzyLyFI1iErhg4gOyBCNY7M3TZumYYlBoDPi355hVGn7E2PgK
	LqdjvGYiETo7hJijz+EvCBMzc1DEu+obHZuKMfpSm5l2/tEl86vUB6YVHTJWFJpj+w1/Km
	M1YY0fbGGXJpczUGIbQRF+bvn5f2v2fA+ODwZm/DRxpetuvdyjstcueC95AOZw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:51 +0200
Subject: [PATCH 17/19] ref-manual/qa-checks.rst: add space around equal
 warning
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-17-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=VHFvnZ3n1GPjXI5Q0qKfqEyDEsZljByTwRd/+ugNQH0=;
 b=kA0DAAoB0YBBQCmjqDYByyZiAGiImuCgku3OQ7j9yrimOIAs6v6ssQY9YQPNToerszT2wE8s8
 IkCMwQAAQoAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJoiJrgAAoJENGAQUApo6g2cm0P/R3U
 wg54dFqkiJqqG/MZhtbnEieMGmeCDXdO50oJaCxSMOohm92hwkqSnJivSrdfB/soFYJmDk+sIC1
 AUS6Rhm9aVG1pOgmFrzO5qhY7QvxtzfY5pfWDjIQ5CXO7uK2DaiXxlZTR+0SYqMaAhyG3IPMzKh
 1hkT4u7guUytTeLj7a8dr4SgGZwfoZAl3Z1D+1kw0NKE6ljHYvqvPFQtVW/vMsSCCRsbfXqRGRA
 sWkjd2r0fMxhgRZ+8AAnAMqGkj8Lm/Y3uSlIPM5RkGbpRFI6HnUxGy9/mWdlvva13mnSxN1Lpex
 FxjNpmSJ7ksH/2jHm1UacI8kS5g1Xef2ZExJ5dktR0WYzXwwWNFaFG+/Z94v47zqxw15GVlHnaY
 7Jw6I7ctYUilRfRGCcGH9/wTbWSMdVkdmM2eCmn5JGCfcKYFwwEaBeZdGii1tHT9gx+P4ULRf9j
 E0YaoYuk891YZo+td0233Rt+zXYbeH3FJJL1lscgBFECk+jmOlcUm4rl2A2oETMUSjRFgmctXV4
 TTjARQlSosx4kzzZjZm37pKwh1qSE1zn/7kDK/o2ysxcqRkS2Gmz036I0pUX0BRy3kdASMb/hCS
 C5fA8skJ9lppL4+KomBYtJgmZcyJkZ99d3X3t+d6nGfbKeo+SnXIp3dbuuwwrPXI3u01QOHlt5E
 tqOB3
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7409

After commit 24772dd2ae6c ("parse/ConfHandler: Add warning for
deprecated whitespace usage") in BitBake, a warning is printed is
there's a missing space around an equal assignment in recipes.

Add a qa-check entry to qa-checks.rst.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/qa-checks.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 91a0f6149..69ecad74b 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -649,6 +649,22 @@ Errors and Warnings
     on the operating system. If you are seeing this message then the specified script
     may need to be patched to have a shorter in order to avoid runtime problems.
 
+.. _qa-check-space-around-equal:
+
+-  ``<filename>:<line number> has a lack of whitespace around the assignment: '<assignment>'``
+
+   This warning indicated that there is missing spaces around an assignment.
+
+   For example, the following assignments would print a warning::
+
+      FOO="bar"
+      FOO= "bar"
+      FOO ="bar"
+
+   These should be replaced by::
+
+      FOO = "bar"
+
 .. _qa-check-src-uri-bad:
 
 - ``<recipename>: SRC_URI uses unstable GitHub archives [src-uri-bad]``

-- 
2.50.1


