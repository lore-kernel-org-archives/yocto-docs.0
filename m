Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD59C28B2E
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 13:20:57 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.37063.1741612854958702452
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Mar 2025 06:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=i+ly1heU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4FB7E20488;
	Mon, 10 Mar 2025 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741612853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y9MrQr+vmWgQcMHEzIl6PhsbKnB4o+IjNiyjzMmN2w4=;
	b=i+ly1heUf9LCLoliB/XyBcDI01SP/F0ebBPqpwNzAI8msADGlfBgIGnPuUuGLekHZj9ZkM
	KC/gL11PUBmSEXLAIU/y4wKu/cjb0HhIqv8kwxoB2vPZWgPPykWOJ8+xYt5WvP8CxyuuOy
	QERte5CfbUnWbw7coQBZZHMOwfS36/XC/lnCJf+q5Da+iR9FOIO+lozSlagWRCWD+2C2qk
	uD3I3YVBkuxPjr7hWnst5DHHcUW/QPXTa/PfvQ/zrmR9TxNiu65+nTN1NTMDEwbDoWnTMz
	cgDt1EslLRZFO43B+b8PifUt21hU25bkrADPHqwNYVzZSDdlOVSxuxXtq6uELQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual: remove OE_IMPORTS
Date: Mon, 10 Mar 2025 14:20:03 +0100
Message-ID: <174161278502.647951.17968713196071095819.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250227135847.3439559-1-ross.burton@arm.com>
References: <20250227135847.3439559-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghlohepthgrhhhomhgrrdhhohhmvgdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrt
 ghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Mar 2025 13:20:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6521


On Thu, 27 Feb 2025 13:58:47 +0000, Ross Burton wrote:
> oe-core no longer supports OE_IMPORTS[1], so remove the documentation.
> 
> [1] oe-core 1f56155e ("base: Switch to use addpylib directive and
>     BB_GLOBAL_PYMODULES")
> 

Applied, thanks!

[1/1] ref-manual: remove OE_IMPORTS
      commit: d03dad11974ada7a99b4406e2350b9f5f0acc746

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

