Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2879C021B2
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 15:32:23 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.48311.1740238337423037396
 for <docs@lists.yoctoproject.org>;
 Sat, 22 Feb 2025 07:32:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZdHv7Cpb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B7BB4434E;
	Sat, 22 Feb 2025 15:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740238335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDWzj/Nx6T/THTOOL8zBxEpVhkBx4hFMCbx0r29jPw8=;
	b=ZdHv7CpbIMdSIKFKs3hZIo3NgFrOLeBgNmWSUZyrroMegQ3iabqJDtbludQkVbvv3ozhtB
	OcDv3XaNa5mwSNiZ0MqKZ+2/gd/MD5nsCBr3SHqdBMHTyjpTgqXiKzZjfU27vGEvYSWyAP
	wgZQA8GXFmdtfvVc0i2FNw2UR97grcM9HsuEpW3ljywLZwWfdN6fv2FwbfQHYPZHCpdy8S
	okSMdvMLu5odrFbKKsesLmvCSeMUttTQczw6ELbhjzyPBSKC0nTLx8n6vp3bNDkMv+dC/V
	ZAawnzNWXIQDXoYZ14eNAOD8kHsU/kfQ/th1rhk52Lj1nMh5J6aM4lhRGI7fEg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v3 0/2] add script for containers building the documentation
Date: Sat, 22 Feb 2025 16:31:39 +0100
Message-ID: <174023827955.706697.7608974632312608597.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250127-instructions-shell-container-v3-0-9373d3f156f5@cherry.de>
References: <20250127-instructions-shell-container-v3-0-9373d3f156f5@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtvdemkeegvdekmeehfhgtudemiegttddumeeivdektdemkedthedtmeekfedvvgemvdehkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemhehftgdumeeitgdtudemiedvkedtmeektdehtdemkeefvdgvmedvheekgedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopehfohhsshdohihotghto
 hestdhlvghilhdrnhgvthdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 22 Feb 2025 15:32:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6429


On Mon, 27 Jan 2025 19:37:03 +0100, Quentin Schulz wrote:
> Based on initial work done by Antonin Godard[1].
> 
> This does two things:
> - move all the installation steps to fulfil the system requirements for
>   each distro into separate files,
> - add a script for using those separate files for building a container
>   which allows to build the documentation within,
> 
> [...]

Applied, thanks!

[1/2] docs: use literalinclude for system requirements
      commit: 8d993022c2aefc0fde9baa949d39d7a3613f9f46
[2/2] tools: add script for building documentation inside containers
      commit: cefced592f1302fcb65afa9e0b1f9f5ff1570e93

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

