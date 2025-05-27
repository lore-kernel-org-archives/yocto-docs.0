Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012A2C5B54C
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 06:35:07 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.45179.1748327703441861670
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 23:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PtRJd7QP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A73DE443C3;
	Tue, 27 May 2025 06:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748327702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uiio7OhbLkrTA2duDc7xtqp0TULfQNiUMEgTXR0IYno=;
	b=PtRJd7QP19SZ1dUgKCnSvy7bToRE1u/GFJL1BUNxEsphsvlfyaRgxJzANnyw2chHBatTDd
	kitlFlGLCb15kactfeDH5usHSUYLcK9IK44qloD7V9A0xqR4ziARmiOHExxBIJmOnr28Xw
	E3FYKEOieUfcbxp/5jWrJxC2fjFN398sYZ1xf/RFawWjrTL7ntXRVtnh18Knlxsn632kp/
	XAII8JIXne551qtoTZKZeGs4USGvsRNmT7W1PuxOxudSJ0rMr/4KM3VafKG574AiXOCfqZ
	4PyimFQ/5o8ozha6xqVtUUBbnSJbqeRWBU0nHNEOqVOkXId+6eXzRuPx53vrOg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Christos Gavros <gavrosc@yahoo.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v5] ref-manual/variables.rst: document the INITRAMFS_MAXSIZE variable
Date: Tue, 27 May 2025 08:33:52 +0200
Message-ID: <174832723399.222026.17738587381724487278.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250520101952.4951-1-gavrosc@yahoo.com>
References: <20250520101952.4951-1-gavrosc.ref@yahoo.com> <20250520101952.4951-1-gavrosc@yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduleeikeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehgrghvrhhoshgtseihrghhohhordgtohhmpdhrtghpthhtohepthhhohhmr
 ghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohephihorghnnhdrtghonhhgrghlsehsmhhilhgvrdhfrhdprhgtphhtthhopehrrghnugihrdhmrggtlhgvohguseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggv
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 May 2025 06:35:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6933


On Tue, 20 May 2025 12:19:52 +0200, Christos Gavros wrote:
> This variable specifies the maximum allowed size
> of the initramfs image in Kbytes.
> Fixes [YOCTO #15797]
> 
> 

Applied, thanks!

[1/1] ref-manual/variables.rst: document the INITRAMFS_MAXSIZE variable
      commit: 07bcdddaf71c76cdec186cf0ddd97a47eec54972

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

