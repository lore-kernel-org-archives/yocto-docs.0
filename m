Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C269C35FF3
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 09:06:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.47830.1742202394802073486
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 02:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mW6LEfKQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A9B34329A;
	Mon, 17 Mar 2025 09:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742202393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YAVQOHuz7BfycXaTZ3bSEE30g50ozxnJiG17Mhkhgjg=;
	b=mW6LEfKQZj6z6NTzPlDVW/iujG3SMrssFTj5LzBy/teMCBGrItpxAD28t9K3GL6juL5+yg
	iOenflZQCeyHJzyUw91oR6ZgC7SDfn+5uE5ZyMvj5/2m6sSetG3Q/k40QyQhziC8Ds1yvW
	LQ6lbi9n+B4agZ98kgoDJMt+k/olzaFPrVE6zuRrZ6ROmSqWeKbJnH+7ENC1aPHoSHMErP
	NMHJTZwR1w/85x967j2+WZvjO9GtljT6E0jC/LL3zdG1To/0HYoQkYRfU9xg5lUNd72ine
	GiTr2wiWiTA7nPRfLoSr//F/+J2La9iA6lhXVAKkwIajIswn8zxowtbB9QXkNw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Mar 2025 10:06:15 +0100
Subject: [PATCH 09/11] ref-manual/variables.rst: add a link for
 BB_USE_HOME_NPMRC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-release-note-5-2-updates-v1-9-82b0a4182aff@bootlin.com>
References: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
In-Reply-To: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=798;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=WVE1nQcqr3WqjfLdzitJVc1RSJCaEFvqWIY126uKsYM=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn1+YWhAp5ePX5z4WyLd4ZzCNGTDlFGh/wo4y9X
 zkx1OokUQaJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9fmFgAKCRDRgEFAKaOo
 NrUkD/4xBs97zG2uwReOywUanf5idBedpdxef48LRqLd1eDSPpQWc1ZYJmdwmlp04urYw3eYTrf
 s/R8tbRCvpd3/zzXt68T5yRZpuX+fbu8dq9W9gg9N1A6R42KcRqH1p50Zq2CPxNXrW0zVZ0EbU7
 2uXo+2OdVJFWkSBv8j7DIp7yVccs5RMXf/gH1YfFPR/Oz6Pz4UUuF4bTcip951Usv2CTz6FeWD2
 eXQkrlsHJr9SajOWT4iyas2yNpHvCIQQSgA/lJxDEyul3CYuVRKglvdtZEXjS6EypUQu8pe8XPr
 KaM8MbjYuxOsSh34onTSGfNgmVpdKmpKslAsgRjouXzYBMATE+zxAm8ymPwXGjhc0ktLKnu7mEb
 orvu/G8pOa0WrNgQ9uEjkgVqjW4yRrwuftZqxMrZ3/eRAwJplCKF0X4lzruqVlXGMk5VHx9UqMk
 T3FjKqRXVZMsC9oVG2+JP/9THZm1FlIGFfU2seolq0pgQ1X2kez665PLSmawhiKMhctJ2/8Eoy0
 RfnIIhuHn/02lvE7gjAI+i/n4gVoIg4i7VnAvOAs4KA244cdzJcBLmKG1IASvFyLzoOlkc2aGVC
 lHXl80h2ZUb24ohRnyVr6vSDXfz56ZUwqQIOlYwiOSXj9pEXEU691OmPvHUhO8sM8pDdqL24aE0
 OKJeK02i9WVyrCg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeludduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 09:06:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6570

Documented in the BitBake manual.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 117893fcc..635573862 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -705,6 +705,9 @@ system and gives an overview of their function and contents.
    :term:`BB_TASKHASH`
       See :term:`bitbake:BB_TASKHASH` in the BitBake manual.
 
+   :term:`BB_USE_HOME_NPMRC`
+      See :term:`bitbake:BB_USE_HOME_NPMRC` in the BitBake manual.
+
    :term:`BB_VERBOSE_LOGS`
       See :term:`bitbake:BB_VERBOSE_LOGS` in the BitBake manual.
 

-- 
2.47.0


