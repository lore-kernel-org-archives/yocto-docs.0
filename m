Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12782C88CB9
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 07:10:13 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.12485.1754291406376567699
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Aug 2025 00:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HldbhZFo;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5238B442E3;
	Mon,  4 Aug 2025 07:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754291404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OiiIKS8suzfDqdh8Un/MaUfRQFFLa8xjaKoaBhIPnyA=;
	b=HldbhZFoYdAlHxP6wPP3RGpq/YY/z9r8dM2uruCQk8l2lz1McBXcHKD5/b3CsWXKiGJAsu
	T1/VjBNn5pyjCgpoXXUx2ZqXR4/dZxeCWd4M8Rc161vQ10+conyox0WjxpKtLOrQU8yCUS
	rj6r29OgTx/xkTmwN89nC1JdyC0IlUung7c5HK6U17Q9y4fhV0qrMdDtvj7+gEO2//LIae
	C1PKkc8hDZGzZ2MilNYLRnAoQyOBH0QbfXfzNTprIZDtFVhhf1VCbS+xVzYSOpzU5YEcqF
	QnxgnXh0wHvm4JqLOgURWRJ/9KTXCPt/faBnqwovWC/eT5eAZ7ZfEh511fBBZg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH 1/2] migration-guides: add release notes for 5.2.2
Date: Mon,  4 Aug 2025 09:09:17 +0200
Message-ID: <175429133885.14949.9458674775578221559.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724023458.2932744-1-chee.yang.lee@intel.com>
References: <20250724023458.2932744-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudduieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghlohepthgrhhhomhgrpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegthhgvvgdrhigrnhhgrdhlvggvsehinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgto
 hhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Aug 2025 07:10:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7432


Applied, thanks!

[1/2] migration-guides: add release notes for 5.2.2
      commit: a9da828a7a10a5a2c2dbed6c4bba8aac0517cd51
[2/2] migration-guides: add release notes for 5.0.11
      commit: a17f47f21805cf636a0568b46bd5a6ed5cfd7306

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

