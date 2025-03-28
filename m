Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 827A4C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:07:46 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.10721.1743167257161905478
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ejIEzdBm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC86F441AE;
	Fri, 28 Mar 2025 13:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743167255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6oegyWucSvQciSXn8WLiWG9CE6EaGmOHWFGH3WZo2Uk=;
	b=ejIEzdBmO/edIm7Yalm+f9ErTCnasNFsM5+RG3xVdd28+Ymh+VvEh+LcCBpyc7SvBigGB4
	QzZfLpzxw+0TbJ2Zp3eD0yKvLWX84KL6VFM57D1tarYyQR4kwKYzVifvq7JSdxzvPniX0D
	ZZqOHuiovHSJra31rT/v97ItkB4NC0fShJbr2Z45LBOXvsdmI9aVOH+YmINedMKz6T1+Ag
	8lXTW8R38ixoAcbdv4yewBqh/Rq1F3gLobT1YdBPpkAQytm+09aTqFW4u8nzuRQADmBGOJ
	IvuM6zR03hoL2bon8BF+liTtuIKjXTVS0RIyK7YChYNzPMkS5AELtmbn4KXzZw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Mar 2025 14:07:11 +0100
Subject: [PATCH 08/11] poky.yaml.in: bump minimum required Python version
 to 3.9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-release-note-5-2-updates-2-v1-8-c913513e9140@bootlin.com>
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
In-Reply-To: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=782;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=3PD11C+974oOTh6RO9ws4hDXoE3F3WXIJQPThBw6sGc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5p8VGgKog0B9hstYIZHIFTkCfP7ezeNwo6KBk
 WvMPdHWd3WJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+afFQAKCRDRgEFAKaOo
 NoraD/48gdymHpn8V+G0amjoS5n54E5BX+z8VbXNTiDU0qA5+BMAfU7WMzk/+ys23r0XBQlRNAr
 uG9hh7FBBISWBvXx9rNlRBftYdzX+tPfRcK8q5N7l1kaXal+Y7XuXKCTraSgg4f9mMUAS0pmb2w
 mGhtnx4rmjdW/XtXHcxwb4sTGmWtNL11KR/cf7mV5OzXzSVA8HANBCE+I2MBcms7GAzNl2UpSTl
 dn0Ue1+7DUVTIpROiVymluSquQmF0ISf+V/jFSIS2ksFUQNFjdr5oW1M1/dzYpRvWauav6evNye
 so+Kpy31owDfbrp9o2jfUSFP5ZveqamEZnmddV8/wrjasLlCb9+RNP3yPS5kTYz9QTtF9gBBpb7
 yuKbKm3qb0zfA+s7zUzmKdNzXJczT813SILENER8cx3/Po2gV8RMQZZZFT859iQgHYvMdf7bxw7
 /2fv4xJcQAdWTU1SW9HBdN0XI8KQ2k63WfmQMD6FdQVcHrV1md2wVKYN36DGn+075EmAXu1TqwX
 1hUuXcTB22j0uUdIDHLkoKgZjMU3G1X6Q3JJwoyckimin9bVpVM/WNeX8KXFVS2mQgB4rrKtnQA
 kgx/GOpSgeYQZu7D1sIFTzZCJb3o/APzVd5Trh2I2SSCrI54ejJOKGUMpx/9gR1Imxgfw+lvnL3
 N9MGiu7JsMjVz0A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefgfefffefhfekueevkefhgeevfeeivedtudethfegtdeukeeivefhledtkeduheenucffohhmrghinhephigrmhhlrdhinhdphihotghtohhprhhojhgvtghtrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjv
 ggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:07:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6663

After commit 67566c7410e1 ("bitbake: lib/bb: Bump minimum python version
requirement to 3.9") on Poky.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index c93b78066..aeda3665e 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -13,7 +13,7 @@ DOCCONF_VERSION : "dev"
 BITBAKE_SERIES : ""
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
-MIN_PYTHON_VERSION : "3.8.0"
+MIN_PYTHON_VERSION : "3.9.0"
 MIN_TAR_VERSION : "1.28"
 MIN_GIT_VERSION : "1.8.3.1"
 MIN_GCC_VERSION : "8.0"

-- 
2.47.0


