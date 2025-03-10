Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD4AC35FF2
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 13:20:57 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.37061.1741612854318352473
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Mar 2025 06:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E7cgnSgD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47E3B20482;
	Mon, 10 Mar 2025 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741612852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBmFlPvVONmxtWd80DCh/3et6hXLSgB4D4KrLed0zf0=;
	b=E7cgnSgD67LbYQ8r305luF6Pz9sp0EIm7Ko5uq/OGizoqfSJCo1ngO6BzecmpGTYl7QqmA
	T/6GZzFW9whnd1SsAA2XAuMimjQQK327a2Q3JxyQDztc2xNlhEojLlYX77MubQHKXtDLUY
	UMukgq+9dQZ+avZB6b/HM6+mjy4n92qi5uNJNYgoX+4YUa/v5UiDOxYR85/fIamlys3K7i
	WYNLe9L0mnXnw2Ekv5aP3wZKnnBRF17xAC9nQKZnDVitIFwtnFtwVxMwnE+qOt+CkTaj8N
	G0U4HPHtj7pq0n0jjUEuylAIK5NHHuQugx5IOVhsYoKObAqYtA+/0cu0tC0B4w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: Re: [PATCH v4] ref-manual: cover UBOOT_ENV variables
Date: Mon, 10 Mar 2025 14:20:00 +0100
Message-ID: <174161278501.647951.15272722170439646828.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250225222442.3347665-1-adrian.freihofer@siemens.com>
References: <20250225222442.3347665-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghlohepthgrhhhomhgrrdhhohhmvgdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehsihgvmhgvnhhsrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Mar 2025 13:20:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6518


Applied, thanks!

[1/1] ref-manual: cover UBOOT_ENV variables
      commit: dc2ff96a3401eba8dac86fc8305b261be52c8a13

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

