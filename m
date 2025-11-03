Return-Path: <contact@schnwalter.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E713ECCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 17:05:14 +0000 (UTC)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2659.1762189509069481222
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 09:05:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@schnwalter.eu header.s=fm1 header.b=fDAj39QI;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=D+UwrMkl;
 spf=pass (domain: schnwalter.eu, ip: 103.168.172.150, mailfrom: contact@schnwalter.eu)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id B9B43EC0298;
	Mon,  3 Nov 2025 12:05:07 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 03 Nov 2025 12:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1762189507; x=1762275907; bh=CCG1hGwsaOquS9u15DAMo
	gZLQXifu648qWRsF+PPmak=; b=fDAj39QIGjXzi8SUeQAlZSn05mzwX/SG/rrcS
	F/CEyM23yeUlaQ3RYun3ISuBYvoYH9s05YHp9VN1htBrFZSOnCMrQ3WqVfAj1yCi
	wMT88iPS5WFTmNCL95B2MV1JeHOhUEVJj1Eanxe53ND4/cRWA13O/wdZ/ZnW71et
	1/d8ZlWt/++0sWH4Evvmp+gUcGPbqn5HB3JWMMS+pPE/+yAGjpq6H5b+Ij5A/33z
	CU0EEwjvDYV0xh32+/ArRlA4/x/zlbzrWHOM88ErYt6fHyW1NLdl4jDmkdt8reCy
	TDqZN9hFMIOdLuj3fIWTwhosCluY23hX87VjYtRtrocRIRbLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762189507; x=1762275907; bh=CCG1hGwsaOquS9u15DAMogZLQXifu648qWR
	sF+PPmak=; b=D+UwrMklE3OwJUA/SiBb/gjxdr/q2m11S4fPu+5RLnyL6Btg6Af
	7gZzuJO7iLny09zQp9GMe5XCeRJYdS4RrKBBiL7muf/T79F57p7te36d1b63yj3v
	l8UmOAyZW7eA+OSkUJ32P4AbW2EF4fyq70ohmIcLMX/v5OyL0l/P9XVjTNITXWEo
	3Z/XgLKWF5LvAGo+/asH+xUf4SU4D69jeZcTFLHuoGy7e0w8TSgRH+94W2cuOinP
	7e7B4xbBvSddoT227Kc4RIqhmdqFQHE/SSGcFMht5bfG5XZ2f4CrEB6GiFQepbsW
	tQ80MkkVOvMsBny0Gul87LKOTNpX57JmGGQ==
X-ME-Sender: <xms:w-AIaeymEXp_Qh4w605IdevZ2k98ER4WKLtnQKb69_zpt9w2JJAz0w>
    <xme:w-AIaRMvrAVI5mWLZ242v4WCkJNBtDJUkWlO_W1-7N6o63v5u6WH6HkbaJc0n1tGy
    nCMmyVCwV_w3DPoXtWFlH5Wp76zFHjCmkSveosN6l-Lixd2heIL>
X-ME-Received: <xmr:w-AIaV-IQXg8wxQRLcR4L32oX1mBtQhHIlAPwXaVFKjzeRDcIxuB9Nl->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeekieelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtredttd
    enucfhrhhomhephggrlhhtvghrucghvghrnhgvrhcuufevjffpgffkfffgtfcuoegtohhn
    thgrtghtsehstghhnhifrghlthgvrhdrvghuqeenucggtffrrghtthgvrhhnpefgkeejhf
    euffdvkeduheegudeuffeuvdfggfekffffgedvgfekgeevieevueffueenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohhnthgrtghtsehstg
    hhnhifrghlthgvrhdrvghupdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorh
    hg
X-ME-Proxy: <xmx:w-AIaZrrdZZFtsbUHY_Og1cwgJqGK_Y_h1GP67ikqqCsyzofVu5eLQ>
    <xmx:w-AIaf6h_mCMVaQTaPJ6rjDb1HC6lA9xJu7vWjFgSmfwqDIFsI2ymQ>
    <xmx:w-AIaRMayG0KrLH4s1FlZgjSmEljfb-GnyFZIMdY1k88F-lm_TaEbg>
    <xmx:w-AIaZM1Ixh1z_r5Yb4fENtcBYMDHgcce9nQIG9YGve9tsVcEN5Biw>
    <xmx:w-AIaVAnHMxvehokZS1tkT-T_NeUZJ1iklO5VN_3jytqvDcxS20lNt2y>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <docs@lists.yoctoproject.org>; Mon, 3 Nov 2025 12:05:06 -0500 (EST)
From: Walter Werner SCHNEIDER <contact@schnwalter.eu>
To: docs@lists.yoctoproject.org
Subject: [PATCH] kernel-dev: add disable config example
Date: Mon,  3 Nov 2025 19:04:10 +0200
Message-ID: <20251103170449.86766-1-contact@schnwalter.eu>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Nov 2025 17:05:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7982

Makes it more clear that the configuration fragment can also be used to
disable a configuration.

Signed-off-by: Walter Werner SCHNEIDER <contact@schnwalter.eu>
---
 documentation/kernel-dev/common.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index bd6c3fb2c..9ff6ec221 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1191,10 +1191,12 @@ appear in the ``.config`` file, which is in the :term:`Build Directory`.
 
 It is simple to create a configuration fragment. One method is to use
 shell commands. For example, issuing the following from the shell
-creates a configuration fragment file named ``my_smp.cfg`` that enables
-multi-processor support within the kernel::
+creates a configuration fragment file named ``my_changes.cfg`` that enables
+multi-processor support within the kernel and disables the FPGA
+Configuration Framework::
 
-   $ echo "CONFIG_SMP=y" >> my_smp.cfg
+   $ echo "CONFIG_SMP=y" >> my_changes.cfg
+   $ echo "# CONFIG_FPGA is not set" >> my_changes.cfg
 
 .. note::
 

