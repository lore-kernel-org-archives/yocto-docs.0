Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19739C36018
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:21:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.61728.1742894477726688834
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 02:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dFIDIUeD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5ED9A441FF;
	Tue, 25 Mar 2025 09:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742894476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L0aetUQRV89VLTU/Mga5Jt+5AbW1kWpT/6JrFBCTCxs=;
	b=dFIDIUeDv7KgRHE4987XltpD9XbEOJhuM1a45YAjpuBakYc4o8PqS+R9T9kNn0RHOOrXCa
	E3pw4bqwsqAC+mY+TU6J3Awe715+D47xxEyGP6fJRwrEw37VQ4g2yhHxvAV9yBqxOF2r7f
	khT+/qIWQHE+BCs9dpNtmmYHMa4o45YtoJgVYSV9M91HP+Yza490n9y0+UA1JpzMJ+TtLz
	kBm05Qc8TutLuQ4amv+u3vDdavaW5fI8S7J4tXotsVwPt79JGydHdb9yGPmMFd191zSzVN
	pUU+vYwBNxA0uhMDhdDijkdGVmtSkcxPYXt1xsL5zyK4XGHyoxp5ZK5cgMb9XA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 25 Mar 2025 10:20:48 +0100
Subject: [PATCH v2 04/12] ref-manual/variables.rst: document the
 MOUNT_GROUP variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-release-note-5-2-updates-v2-4-19f050d61da3@bootlin.com>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
In-Reply-To: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=3qryxnaR+ydbZXShz2Y9liWf87KdI2ro8lFLTgw/R6Q=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4nWKhE4Nkcq6y/Xaax+q4GJCOnWPWhmSMTwiu
 4mE19R93sGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+J1igAKCRDRgEFAKaOo
 Nv9QEAC/+SQ/ml3DITlb07RG3ZnejF/U16YNhLwPvADEXCmdVeuo3Uuc1WXpBG+ocOLkPICUv04
 Y5SONEtq1xltS2qnPO8/aliLJhaFb3EupqI+bwDngsD3YnLaF8+6ydZptvdm/SErNzoOA538F2T
 VsTKGGQ4e3Rrzr5+BL2sdeu8SliJtMjXaBDJmhrZmp3pD022y9iV23Yb4f7p8JoU/05U5e2zk51
 6nQoPvz1MWfIHq+NKFUpdwtRB6DxM3kpYNRee6ylq61gGKz9fsMjQ9wQlBo0hAo8jOwFydQTSGo
 8JVYTWbGmHLG7hpGWFOXYFGOPKM0bbj0ui3/tbbBkaWyEXrigxbBUriZwv06TdJBRNXsfGwSD0F
 cdZgIO+iUHZqcnYiY3mOwSC7BPuVdSPcls1jBdq4kp7g5lI3e23eale32Jix/tBpkAtXacYK8as
 PSzoi+m9czVv0M9FU3MIQpBiORwZK68lZZD7dHS1lQtutds9BrL/44hRpMMwzVor+JmmvvJNGF1
 LMjuWHVmR0ahGhh7pHXOQ/lvNwKcCaIQaVydF2+4KbOggJD+6zxErKfXXoWVr5213pqchT3IXPP
 EHV9GhyYY8BMkCRTbmJkp1O6z2m+NPlww5H67b3fhylTh12nwqhueRzVoWa5roL7iB9z2aWrGRW
 sDWGjmmqHa735jg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 09:21:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6616

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 70ed7db4d..b872d7935 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5739,6 +5739,11 @@ system and gives an overview of their function and contents.
       specifies the base directory for auto-mounting filesystems. The
       default value is "/run/media".
 
+   :term:`MOUNT_GROUP`
+      On non-systemd systems (where ``udev-extraconf`` is being used),
+      specifies the mount group for auto-mounting filesystems. The
+      default value is "disk".
+
    :term:`MULTIMACH_TARGET_SYS`
       Uniquely identifies the type of the target system for which packages
       are being built. This variable allows output for different types of

-- 
2.47.0


