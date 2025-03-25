Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B449CC3600B
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:21:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.61363.1742894477972809310
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 02:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HQw2MgbA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8241A4327F;
	Tue, 25 Mar 2025 09:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742894476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jOaBx39KKS5kgktusoHUy9NkNysN7x6+TJL3v18wQfU=;
	b=HQw2MgbAfjg0CZfw+MPjlgWNSxHnbP7yI92063rGLf3qNjsgTMsaAUSGWMBlp7Tl7iUPM1
	j5twFUxt+1hBS5thMP0PX+vfkh339XPK+MslzfFDuboG9JtLF6ZUjDpzR5nvSQdAF6/3ec
	VbKO+l270/bKYb9zinvwZhIzSb06yyFpTJprwZGDbxxe+yuWfNl3GrqVWufGkQKyLgz4Lu
	isrmc70o2pUf3DmsYCwx8jmJEZ+3zkZmHYlTQ6NN/FoXa1k4KTvqgl/wO9CYKjvgPrUsQ4
	FhBpKDDuUYotPTkh1Fv4wRunIYHZ1Qwr4DaOjaUPb9sxqeDsnaFacW17/u5i/Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 25 Mar 2025 10:20:49 +0100
Subject: [PATCH v2 05/12] ref-manual/features.rst: drop ld-is-gold
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-release-note-5-2-updates-v2-5-19f050d61da3@bootlin.com>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
In-Reply-To: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=cvgkulSvpEx3+ShPw9syjHi8QtiJVc4csfQx3ZTtSrQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4nWKYMGIpu1AC9ezqK11yyY++6jiwfKk8DNIy
 cEBwrVb9bWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+J1igAKCRDRgEFAKaOo
 NjQGD/9Unzq6N4wPKNwShETahaASShyFGXnbF2rCKu1BoJG+fiZ/7XbI5DmuHvFFbQPw4YPK+eS
 FrPTn7on8dW7YjVn2XVBEDXVsff8CqyzLB+omVwz9y8IZONZfPYThsjg21ptTCcMLDDYsLcKUKm
 3gf/ngHxKHtUkTpvi+Umap5uU3Hki0y7n7uWgVewrRxmnts96cmD/nAZBFxwzbBZjq2qv10Qiab
 XvcPx15JIudLHTJfi+iLfYqAzbHucQC8gRoT1nUNAxMYFuEiBHyi8UIcNe/c+vUBsociQq7In+X
 qn/mZ5hEqdUGKXug6z/rnmyF045PgeIG/+cSojcjUXLuDtOHyxIw5guvJtaqNj1w3W5ZhXefwc2
 7o7dXVqb/VhIottpMM8EGOVinzXdSFOjYbBpLrVVTSRE2j3DRHtVVFKzj3DuQNBxdl478GccLQ9
 9NkX3embPV9ZEekSdyDAyw9L6In3xXvos5Is6PdUdgRbfAwFm+wUhe1ZgM1P4rRRHaw3CPiPiZ+
 NHWrmUoHMa0V7hhW4Z2f5WN/kXAe9C4+gDzDkv9Qxq1KCeX95DxZtvC5NrfkQiYs4X3JJo+ohWu
 oN0aFct3wOBLp/yZE5a93ISKXHfvvM7PBU7IwUd9ghH3yrazj+Voeqld7JfxHSnz4277SYuBlwn
 Ny4ceF8r+IR9P+g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 09:21:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6617

Dropped in OE-Core after commit a4addb9ab630 ("recipes: Drop ld-is-gold
support").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/features.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 746d6337e..2c074ab9c 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -167,9 +167,6 @@ metadata, as extra layers can define their own:
 -  *multiarch:* Enable building applications with multiple architecture
    support.
 
--  *ld-is-gold:* Use the :wikipedia:`gold <Gold_(linker)>`
-   linker instead of the standard GCC linker (bfd).
-
 -  *ldconfig:* Include support for ldconfig and ``ld.so.conf`` on the
    target.
 

-- 
2.47.0


