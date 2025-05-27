Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1365FC5B553
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 06:35:07 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.45321.1748327702451585308
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 23:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AWeWFa8U;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C144A443BA;
	Tue, 27 May 2025 06:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748327700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fHCP4sH+nzJZklxK4Q8aAyjfoKvxOAaw2JxFv0LXDZA=;
	b=AWeWFa8USm99Uh5HFPzux57s6mpEoHC/KkNjUXohQK6nS4jtQRdWTpaRKU2FKXLNh/kjPk
	5gXny/xDwf2i/Qf0fK6+gFwHTBITFW2d/9y6rVrPNB+udaNJFqEg6P2l27LPVfZLS6HqoB
	qPwH5ndgdYgLtv6cuho3lBh/T1R2FZCeKuYbCRWKrsK+qmgG4PfkxMPv/myCFXMHPAZvXl
	UcU3+LuZBNO3nCB7kxRaWQhM5o1tdfzh7WUDQKjcyRN+wMvON5hJrVJHifaD1HEAFCy4+v
	HVLzhTKNwRIC3Em4qVDdU37xUIhtmPaZabUKjWLlGmmW6UOQ3I+81aU4Jh7lLQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Alper Ak <alperyasinak1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v3] ref-manual/variables.rst: document INHIBIT_AUTOTOOLS_DEPS
Date: Tue, 27 May 2025 08:33:48 +0200
Message-ID: <174832723395.222026.8043352382398442980.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250519122825.63816-1-alperyasinak1@gmail.com>
References: <20250519122825.63816-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduleeikeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrlhhpvghrhigrshhinhgrkhdusehgmhgrihhlrdgtohhmpdhrtghpthhto
 hepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 May 2025 06:35:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6931


On Mon, 19 May 2025 15:28:25 +0300, Alper Ak wrote:
> Fix [YOCTO #15756]
> 
> 

Applied, thanks!

[1/1] ref-manual/variables.rst: document INHIBIT_AUTOTOOLS_DEPS
      commit: 18a2686b530ae428103653450d8963d38dcdef46

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

