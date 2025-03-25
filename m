Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C2BC36008
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:21:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.61368.1742894479302489921
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 02:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=D9hbQ3Zg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E96E432B8;
	Tue, 25 Mar 2025 09:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742894477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/U3U+3CDwOoVUGo8XiPXoItnB1eLogUaZoIFx6JI424=;
	b=D9hbQ3ZggwtR0/rMLdSa5puv8DLZJZ/B9bVELdyiLNEHvWJNsi+dTTE3MmrT1kliNpySzC
	ghxDClNeX/twp0VVloQDrlzwkpD6nIvL2SzbwAl/mh0Eb0agCbMVkxTfo9auOJVO19DiBp
	no2Zo9JVD3rL5s8DTL3s44izSmS0CsECoMeJXDGfnOW/5Iivfm4NgGH0FmmdeAs38iYsKQ
	OvsCY49O2pt0Nl55XtVX2E+KYwrExo05xHlcWhvvEyy5a0y1w5Q8lE4aLfIiszEfjKUV7N
	8Rlc6VBe/5RAsy733r1NJsQKktl8fe7BjZJwMnhaHbjrvlXP9FeWVyhfkSTm4w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 25 Mar 2025 10:20:54 +0100
Subject: [PATCH v2 10/12] ref-manual/variables.rst: add a link for
 BB_USE_HOME_NPMRC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-release-note-5-2-updates-v2-10-19f050d61da3@bootlin.com>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
In-Reply-To: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=798;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=eZTdoxL7azmT4KDjSchLGfdSDPNMKvPnTkmav45GJQY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4nWLbTnxs0SJVLUo1wV611exeJ2scjstA93wx
 RDNjNrnd8eJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+J1iwAKCRDRgEFAKaOo
 NrruEACpSVDTH1O8QqIcZjSq4L7ujdfR456e/qxt58cgpuyXnLgK8TX3V55DnuFPJV101nvC4EX
 fvw40Yqaq/yxcDm3qugXSRAit788hmzLRg5l9YXmQTH2bDsZCPOJj++5IXx70+0+G30J9/TzInK
 EhtdfaYNFEk0T1NmZ/exqQVQz6QyIclaevSTCQueiWEE3cPSo7NOKjrXiFkwVODXl7vd97AqRrZ
 kcdhewAlyc/e1e/B6qpchKHPSbu7p495GwIkE5FP0PcCj+043nUK2w+cwddj4DARpEChpgEuMjG
 3v5t2drIsi+LcvqumXatFwds61tZ/2lZlIMPCdCqx5e6wpnHaWX/EmYCKsPIPsD7Y8WTNFQmjX8
 wDmfTHPQlZAxXWOZcAaXbOODXd4wczeD6NswyaQnfRCPeWAR9VthAcogbo63lh0bLUe6mdhyIxo
 D7mE1R/WQDaL/v2gmWXngaRLn/n9jJtTfKJjhP8qPxp/TwZMOpdHytjWXJ7IdeFL9XMaz9kXn3H
 vL8up4j24XNPrWP+8UuIJqWU9uX+7VAzvpmSiAnXoCB4+9Xq1JMbeuszhVLZ3DZqlIJjOmWXDOs
 VB8vo9W6wVQpaml38av2e8gxmsyelC64s65F3K5PZ7P+YRrfuPt1PhaudGCp8hp9Ak8e030AQB4
 /S5ICRpE5Ps2QEQ==
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6623

Documented in the BitBake manual.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e9e8a6933..dace40f59 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -711,6 +711,9 @@ system and gives an overview of their function and contents.
    :term:`BB_TASKHASH`
       See :term:`bitbake:BB_TASKHASH` in the BitBake manual.
 
+   :term:`BB_USE_HOME_NPMRC`
+      See :term:`bitbake:BB_USE_HOME_NPMRC` in the BitBake manual.
+
    :term:`BB_VERBOSE_LOGS`
       See :term:`bitbake:BB_VERBOSE_LOGS` in the BitBake manual.
 

-- 
2.47.0


