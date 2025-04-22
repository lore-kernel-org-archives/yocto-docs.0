Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F058C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 06:57:22 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.34236.1745305034967001680
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Apr 2025 23:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DlZ1of+J;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5667A1FCEC;
	Tue, 22 Apr 2025 06:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745305033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0rQL3xXLXMc4ckzXFD+BUWUNj0WcRwJ3AlHaluRXiOw=;
	b=DlZ1of+JoI0hMLPVwAuVkUNrpCI+9nUg8ug8bJl3b8gR0FR/bW3rX/guzheGeMGYVG4mtI
	NWW79BUOgVjihdZDK0czQJDs9t021ENYy2gacXI+oS+7BZhyLop+A1RjBBvsDhIzUVvwZr
	ezkdIw5zUcZdbQTEvLwBaYdnh9dF+v9Sjt0dB90CB+s6et9sJYndIdtfZUAuVkBdcPCbbK
	obUFjwGfdFaKlHXbeV1jflUB8P7OPDwKhWv5yWsmPuFolYV0TEJXPSitXk1jeZTJPUpzMa
	96kzdCkKryIwx+scSKLcFSG+Il735/RHqJwBOvuX5mceigPCB6euxYSH7IOrkA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [Patch v2 1/2] migration-guides: add release notes for 5.1.4
Date: Tue, 22 Apr 2025 08:56:18 +0200
Message-ID: <174530487322.730280.9951082467060785925.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250403034416.1505203-1-chee.yang.lee@intel.com>
References: <20250403034416.1505203-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeftdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghlohepthgrhhhomhgrrdhhohhmvgdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheptghhvggvrdihrghnghdrlhgvvgesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhin
 hdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Apr 2025 06:57:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6767

Applied, thanks!

[1/2] migration-guides: add release notes for 5.1.4
      commit: 4602e6b42118e7fbd3b6aa07782779047d209bb0
[2/2] migration-guides: add release notes for 5.0.8
      commit: 3b50193fa0c9acf4a601aeae6e1c78d0e4a05aef

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

