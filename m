Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B52C54ED0
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 16:45:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.3912.1747845901582777797
 for <docs@lists.yoctoproject.org>;
 Wed, 21 May 2025 09:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eK5/DS8o;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0093A43A34;
	Wed, 21 May 2025 16:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747845900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B7ixKPUDb9nzBD88URKm5ivJXQOX6pSfP0SiEHpMAUo=;
	b=eK5/DS8oUACIVQ8gMtXmFfAXF6MnsRWl736GRr/Fkbohmf3pptnHDOQlZGTrZ+Sby13K1/
	qoue6q1co4iH2wORddNBZLNDoYH3qw6QRHTMYUtVuRpfoGn11Htvk6mhvC006qhVUFUTIZ
	baEzv0cTfcdVmrG0YITp95ULs3RaaoZIKIsSbXsqElBbT2F/Xv8SbbLtblRRVjt0lPp9qK
	aOVsReEmtfp9zxFq4cl9g8HiOuESYXforle2GKQFG0+FxXH3b0EUBMxAJnfikz977jedaV
	OnlJzvMrCJMHHEVlJAWWHUt9WewShXY+5nTy5k9IvCHMfmQA0b6pwdI5dZ9vcg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Trevor Woerner <twoerner@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] sphinx-lint: various fixes
Date: Wed, 21 May 2025 18:42:30 +0200
Message-ID: <174784571491.218104.16249826143869474606.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250506180301.32610-1-twoerner@gmail.com>
References: <20250506180301.32610-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefheelucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddvmeekgedvkeemudgsuddumegrtddtudemtgdtfhehmeefsgefmegstdegvgemuddujedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemudgsuddumegrtddtudemtgdtfhehmeefsgefmegstdegvgemuddujedupdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthifohgvrhhnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsr
 dhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 May 2025 16:45:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6870


On Tue, 06 May 2025 14:03:01 -0400, Trevor Woerner wrote:
> A 'make sphinx-lint' pass found the following issues:
> 	trailing-whitespace
> 	missing-space-after-literal
> 	role-with-double-backticks
> 	missing-space-before-role (role missing opening tag colon)
> 
> 
> [...]

Applied, thanks!

[1/1] sphinx-lint: various fixes
      commit: 6d4c67457e00a80dda4cd05bc5f05d8ebd8da5fc

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

