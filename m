Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B4AC54ED1
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 16:45:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.3906.1747845899627584884
 for <docs@lists.yoctoproject.org>;
 Wed, 21 May 2025 09:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=j6uKpswc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1073343A42;
	Wed, 21 May 2025 16:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747845897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4O7+eWWsDM6HftOOl3e2Mw/2A7uEXk5iNL4IoUD2IQg=;
	b=j6uKpswcBW8V9mECrWTKQO5Jd5wosH4Tycf+ErauvQ/qINKpWRAtA6W/fpkTAHvrhu1g/f
	Bp+hM52go8OfGGnHLqSbZQtv/0vM+SdakzYA6XfLeKVq1d6hrOY6sZO0sDc+X16QVC7npY
	e/jsll2Nd0mhrhUk+zBUrl72D7pVFPPQy/LSyy5D+scXUAsiCsWAbtklTsu7WgEt6rOEDo
	My2pFzw7NaN3wFuWSYUwUQQbKYTeP4NdGGT1oRJqoXPe9PcgxFtLdFl8qhxoIxQF0XwIjL
	oNkKVVxJx1zVwjbZMf98NARKFfeK90EvHwpO9RzHOTon7SdP/GBJFn9I4y52Aw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	AdrianF <adrian.freihofer@siemens.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual: kernel-fitimage.bbclass does not use SPL_SIGN_KEYNAME
Date: Wed, 21 May 2025 18:42:23 +0200
Message-ID: <174784571488.218104.1919671844432425446.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250428201243.596148-1-adrian.freihofer@siemens.com>
References: <20250428201243.596148-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefheelucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddvmeekgedvkeemudgsuddumegrtddtudemtgdtfhehmeefsgefmegstdegvgemuddujedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemudgsuddumegrtddtudemtgdtfhehmeefsgefmegstdegvgemuddujedupdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehsihgvmhgvnhhsrdgtohhmpdhrtghpt
 hhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 May 2025 16:45:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6863


On Mon, 28 Apr 2025 22:12:43 +0200, AdrianF wrote:
> The kernel-fitimage.bbclass uses the UBOOT_* variables. The SPL_*
> variables are handled by uboot-sign.bbclass.
> 
> 

Applied, thanks!

[1/1] ref-manual: kernel-fitimage.bbclass does not use SPL_SIGN_KEYNAME
      commit: 8ceffee908a039deb1021361faa7637e83ef26f3

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

