Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD225CA0EC4
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.3360.1753783011212263309
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UAnpDOUL;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9460E4313F;
	Tue, 29 Jul 2025 09:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rr0N7WkTwqLlRXk13SGkINYRPB9hpE9XwNd+e4Ipa7k=;
	b=UAnpDOULuLorl1JkLleBu+sfs550eSoXmyKEua9kSv7N/XTwvWsmOCpiV11h+cX8/XeMX3
	SrcQZbuSiOdkFnKb3lOWxSC90DRU457GTtDlIOKPM54/AuDeQyXxXxURH/JCD3V3rfNVtf
	nguF/wKwbXAI82kWrtjPTRHUNXuU+IOT4tKj7LBXdtbcrpk2MsppDdflkxeEtCcLG6lsMi
	crGtCQc6wqUQ5hrS7OsCKLQ/+POphl/yaPCJbXRNT3TCBkmAb310dXmRuwYlEaZ6V/LGKW
	QA00qFtulEGgImNABV1BV4mc85aprAgYKN7rbD4xWYnyanMv2saGo2e0go/qLA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:35 +0200
Subject: [PATCH 01/19] ref-manual/tasks.rst: add documentation for
 do_recipe_qa
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-1-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wMJ2BSwYfIaH3WrClPQADvQvANtJsgtcxzX58JWXT3g=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJrdi/c+/lOT0KrXXJ0HbUDK15CvIbQpQP0hq
 FzpB/Srbj2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia3QAKCRDRgEFAKaOo
 NqBwD/9YJ+yxPj0QBg3IO3qPgVEmDPw9e++Q6O9pXfVZoLZkc2FtAUAmFb7H2v1pYzeubry5e+Y
 sY90JArIailpbsIs93Xjf3N2oZ8nM5xSwRReqirqp+wEoVM24AAgr3BhsY+cYRuYWoKhlo4Bcx/
 i9tZ4QK+VHo2eD/W7Tj9hQz5AjUWutMWw0fgF6Uq2uYRodxvJKc9NPHG2q84yJ0f4CEwp2+XD+2
 CjaPgVFfBcjefetfsAif06N7OJBpHuC83xJi4jsPTTYVl0ngU1UjfOTwWd+2QdUOWcOVdM1UVaw
 S2ggPJOcZduRAlYcd8MbkTKKsvyn5I/6e+WiWIbh53zGuosaanbWl756BqSyfKD7OZEU1+ZO0UT
 6vQNM3PED/ltfFxTskEkA2cmvU+KdetJLaO+F9SIVMrwkeuS5rwNGAfHsO3fBH8G2XUzohNlhav
 /+o/0yGenIZTbD73IVbQSIu5kfrCapCO4en+zuUjTkfE15i17eaxGXV/wSeHlhzmuiSE3PzQ7TQ
 JWGcoIZdOE/USe013qH2RjtsfqM/luaIv/rtkZ1z1KrSS+pDAA4ovdRzR3YL53QohELriJKl596
 FcpnAcLBXfsjs5uT7Yo4lBvW2y6yR9KJWTJIHYGnxQ+cL7P63alAI99biQJBN07FfaZNesFdLjB
 +Y1K1nkg6dKA5fA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7394

Document the do_recipe_qa task in classes.rst and link to the insane
class documentation.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/tasks.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index e379c424d..d7b19e04b 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -397,6 +397,17 @@ Installs the files into the individual recipe specific sysroots (i.e.
 dependencies specified by :term:`DEPENDS`). See the
 ":ref:`ref-classes-staging`" class for more information.
 
+.. _ref-tasks-recipe-qa:
+
+``do_recipe_qa``
+----------------
+
+Performs QA check on recipes that can operate entirely from recipe metadata and
+do not need any of the build artefacts or source code.
+
+The list of QA checks that this tasks defines are documented in
+:doc:`/ref-manual/qa-checks`.
+
 .. _ref-tasks-rm_work:
 
 ``do_rm_work``

-- 
2.50.1


