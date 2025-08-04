Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9F1C87FDB
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 07:10:13 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.12486.1754291406383033591
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Aug 2025 00:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Lz7iqjFc;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAD54442E6;
	Mon,  4 Aug 2025 07:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754291405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kifdn9R13yUcx3a5vXNnGpigjVry1oRZWnb19tEgqww=;
	b=Lz7iqjFc+dPBULzJH+1CwsSulOM3yd7ZXYdMWe5XCbpEvMrpFES9XZikd0y5vI/cqkPl63
	UiOC85dlWk4qZdCI+8vospuSkV7Z5PZEqA7JolFzGLpOVoQb3+rUzY7XnJ7tzeKvXcXKnK
	Xdvwr8AipmC0B5XZxvVGMQoguacrnt/gLIoFNPOMXBzELN+44bGXlTU8PSnpW6V8vqa7Gh
	rQVtQovakkxkEIfPhhqzBUtFiDAJfzrih2ylykmFyNPHjt0Z47lldkxCaMVBt1IKisl37D
	lKSff8c9OgRIeVCEVMCnPZoyP0knubJgR44YuXpl/9egXPXSaQX0IbE7IqeqIA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Marco Cavallini <m.cavallini@koansoftware.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] dev-manual/start.rst: added missing command in Optimize your VHDX file using DiskPart
Date: Mon,  4 Aug 2025 09:09:18 +0200
Message-ID: <175429133884.14949.5298540023876408965.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721093938.596-1-m.cavallini@koansoftware.com>
References: <20250721093938.596-1-m.cavallini@koansoftware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudduieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghlohepthgrhhhomhgrpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehmrdgtrghvrghllhhinhhisehkohgrnhhsohhfthifrghrvgdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtl
 hhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Aug 2025 07:10:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7433


On Mon, 21 Jul 2025 11:39:38 +0200, Marco Cavallini wrote:
>   After compact vsdisk you have to detach it before exiting
>   otherwise the vdisk remains attached.
> 
>   DISKPART> select vdisk file="<path_to_VHDX_file>"
>   DISKPART> attach vdisk readonly
>   DISKPART> compact vdisk
>   DISKPART> detach     <------------ new missing command
>   DISKPART> exit
> 
> [...]

Applied, thanks!

[1/1] dev-manual/start.rst: added missing command in Optimize your VHDX file using DiskPart
      commit: 1cc65ddf1a074f61fe5a63d222f3079b7fcb4c1e

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

