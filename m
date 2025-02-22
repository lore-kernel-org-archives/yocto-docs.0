Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D13C021B5
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 15:32:23 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.48474.1740238337898984384
 for <docs@lists.yoctoproject.org>;
 Sat, 22 Feb 2025 07:32:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Eaid04K6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13C004434B;
	Sat, 22 Feb 2025 15:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740238335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fr8Bh1b6tyNxfH409kEsawa6qm+KfiiugK94KeEy9Ms=;
	b=Eaid04K6FtPVEwkZjXMctTKALfyzHqPq1aGsTYgBovblqq2nFAwUGQ1S3GPpdHjXa/BrE0
	veh9GWsr4TVj6+FpSjeRJ+yR/HGL06Og+7skragUlXUcJwpStIBh6mzd4zIG5XQXD1880Q
	Fv+nddnOWCDGnTtOdZBWbZhQGOuBzwN0Cpwa5MQWwUkevyCF5bkFO1E1Pxwbpxf0w+MdHN
	4mgBnEB9/xXh0t7+wNd6hHgJlfKMA1qhRP96n0XhNBGHQBD3fyCZse2t1Za+jXeVv356gs
	k5/arjLGCbaR5wFPbqya+R2uV+8ARl931lxATJutEC/2lyxPgQQbNL6pAu4nww==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guides: add release notes for 5.0.7
Date: Sat, 22 Feb 2025 16:31:38 +0100
Message-ID: <174023827958.706697.4877063458368654226.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250214032715.4042877-1-chee.yang.lee@intel.com>
References: <20250214032715.4042877-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtvdemkeegvdekmeehfhgtudemiegttddumeeivdektdemkedthedtmeekfedvvgemvdehkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemhehftgdumeeitgdtudemiedvkedtmeektdehtdemkeefvdgvmedvheekgedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegthhgvvgdrhigrnhhgrdhlvggvsehinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtr
 giiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 22 Feb 2025 15:32:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6430

Applied, thanks!

[1/1] migration-guides: add release notes for 5.0.7
      commit: 9f1f9f1a3a2a541ed70df72d4fe391b5b7fd3733

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

