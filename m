Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA58C87FD3
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 07:10:13 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web11.12489.1754291406870309492
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Aug 2025 00:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KlEWRQzA;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15896442E7;
	Mon,  4 Aug 2025 07:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754291405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qRvKdjedlWutRekzIkrKnASclHCXa2XO2OPp+D0D3s8=;
	b=KlEWRQzAB79P4fvKGiiWBHhDNQLxg4xNAL0cB1Zf6U3zEWFGO+D6uvilVgYttaXgE0FeBb
	imo1kz+O7AuFF4a4MEM19tIfqbXT4G6OC3jdvzBdUIS/rMK34TH4x++AJ6bzS5PY29Crux
	GoqkWCLt4jtY4Oa0QpyYHd7TwA75hWRWEwGlxC47xiCZiK317iRF3ep20kXnEAtHekeKQ2
	2c4T2GO6CbzuaSVK7rJfiCw0sC6EOJiv3fquBWEK0flc1sSTQAklr3iYW1FMSwBKdjQiOz
	5PFDK0Tb7hiD2cwRg9V1Up2LCJeHngjUyqzcBDKMj7gLLeedodncNKeyGKKNzQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] variables.rst: remove references to obsolete tar packaging
Date: Mon,  4 Aug 2025 09:09:19 +0200
Message-ID: <175429133887.14949.1834722757423347607.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <26fc08c0-b3ba-dbd1-af40-6de560fc8769@crashcourse.ca>
References: <26fc08c0-b3ba-dbd1-af40-6de560fc8769@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudduieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghlohepthgrhhhomhgrpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Aug 2025 07:10:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7434


On Fri, 25 Jul 2025 06:02:13 -0400, Robert P. J. Day wrote:
> The tar packaging format was removed some time ago. Also, add some
> minor grammatical tweaking.
> 

Applied, thanks!

[1/1] variables.rst: remove references to obsolete tar packaging
      commit: 8e9fd1ca232f3c1e8be51cb881a68b4745ee548a

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

