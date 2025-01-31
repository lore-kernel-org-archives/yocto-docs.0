Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D41AC02194
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 09:38:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.15579.1738316319064916877
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 01:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Eo0BSc0/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E922E4330E;
	Fri, 31 Jan 2025 09:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738316317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tANe9AcCvrvAWjhlAy9Dqnvq1YFzKqmJkuNl2JZ6+RI=;
	b=Eo0BSc0/4otm82vRJPWYFU84WhAv2aPg00MFAirm5717kP//eyEYDTvE75rVJJp8fK2ttI
	BjTw+R+tJCGRmss04w/nvwNVg0kQ3OW/ZgsyRRUnxEBQXrA5QwXtqb3BWrvl2ju3asX0ju
	ciZCWcjF6mXqiO4AK/ktn+oIREuNq6hxbD5enmuV5XsbheSqmgQKxkIN+FXug7wkoC0hNg
	XW0tpUU58ma4LisleMZ/FB9yP5MKQIhrnhiFtgJRAXwfcQZHNDF/9UV6p8Yh0akH2Ny4Qq
	/hlyNAqfzy1sUueVqkz789rx8oLf3MpNxCaC2J0OD+iiAKUJlLpyqLPg0wfMJQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: Re: [PATCH v3] sdk-manual: extensible.rst: devtool ide-sdk improve
Date: Fri, 31 Jan 2025 10:38:19 +0100
Message-ID: <173831621364.33004.17375413039743232781.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0.dirty
In-Reply-To: <20250120071619.2005696-1-adrian.freihofer@siemens.com>
References: <20250120071619.2005696-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghlohepthgrhhhomhgrrdhhohhmvgdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhot
 hhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehsihgvmhgvnhhsrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 09:38:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6219


On Mon, 20 Jan 2025 08:16:19 +0100, Adrian Freihofer wrote:
> The devtool ide-sdk section is reformulated to be independent of the
> eSDK installer. In fact, ide-sdk does not even support the execution
> of an installer-based setup.
> This reformulation is also a preparation for moving the devtool
> documentation to a dedicated devtool section which is independent from
> the eSDK documentation.
> It should be clarified that devtool ide-sdk starts the SDK directly
> from the bitbake environment. It is therefore an alternative to
> bitbake -c populate_sdk_ext and installing an SDK installer.
> 
> [...]

Applied, thanks!

[1/1] sdk-manual: extensible.rst: devtool ide-sdk improve
      commit: 287817f33688d61f7a71c056bfa5c645edb4fc4e

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

