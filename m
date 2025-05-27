Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3667C54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 06:35:06 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.45177.1748327701797382703
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 23:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=klgW9avL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21C4F443B1;
	Tue, 27 May 2025 06:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748327700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WhnItYbVwf7v820gKI5YzxVLLEJ99kNv5igl3XNmP7Y=;
	b=klgW9avLW/eVg9neEgK9Y2iwnSbVJDtFrnRYLY8dkLGl00UEd+yeO6Dd5ytleUofWEMZkV
	FXDaXH38nU4fSank+BEeh8ixGudkFuhb5YTGGTS3tLsTgOLvlJR3zMuaFsHKcUomtCGjM5
	A1wVJmeCNHn7apJIoVwhN16pp/REKjlM7SYJqs/czetwcUTwT7XlxyRSORMAOChAiSbuTw
	hn+bhyxEuvIT/Pc6Gz6UvFXHubfiRv4srjBNGzMEWoO/z3oac4+9e7uV8GyxprGPAN45vl
	ZxX//9mNRdMCJ52qF+m2nGCReeHtpaJNeg97WffrBXDWKKfOmOLJ/mFe5b/+tw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	ecordonnier@snap.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [docs][PATCH v3] ref-manual/variables.rst: document SSTATE_SKIP_CREATION
Date: Tue, 27 May 2025 08:33:49 +0200
Message-ID: <174832723401.222026.2378827172415999896.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250523143430.194305-1-ecordonnier@snap.com>
References: <20250523143430.194305-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduleeikeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegvtghorhguohhnnhhivghrsehsnhgrphdrtghomhdprhgtphhtthhopehth
 hhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 May 2025 06:35:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6929


On Fri, 23 May 2025 16:34:29 +0200, ecordonnier@snap.com wrote:
> 


Applied, thanks!

[1/1] ref-manual/variables.rst: document SSTATE_SKIP_CREATION
      commit: 3982720668aafa18c9ed27304d09f896740b1653

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

