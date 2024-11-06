Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE59D59F56
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 17:36:58 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.51608.1730914608128314417
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 09:36:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SEPbj2Iq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50BF260005;
	Wed,  6 Nov 2024 17:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730914606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uy8GECtSqMIi62mx6AzLE7d+5Nl5GgNWKf0FVp35zhc=;
	b=SEPbj2IqSUESS8rYp1nqNPAwRGnbgcb8StqJunhUjj5WLmJL/5SLdajaZRO40eITJh7QDk
	CvQfbyJi+rHZXdyreC4N8eXi9Iby8wv/gZlCVo6z6zkPezkL/oIhdrR+A0mE8Vxhw5G9DB
	p5DDzKm1LzBoiY+dzesoYpgQBp+rGbHEKjd6EiFN4K1+IDet3diNIbuIXUa77llKsuwf0s
	RcoqhiowzB9RFe9wzl+y3KWOwLXvzUpyVuqe6Th/76rRzODuiCoFsNbwyQET/J/UyngCb8
	81QycEKeAtPcdWzxzO7d07RNQmo5bE9c+CYeUZE8YN566RNoT6l/fOXqOTyg2g==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: thomas.petazzoni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] release-notes-5.1: add download section
Date: Wed,  6 Nov 2024 18:32:50 +0100
Message-ID: <173091428258.147774.5803276602292473106.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241105014204.2824698-1-chee.yang.lee@intel.com>
References: <20241105014204.2824698-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 17:36:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5709

From: Antonin Godard <antonin.godard@bootlin.com>


Applied, thanks!

[1/1] release-notes-5.1: add download section
      commit: bb472a7000672ce836573c3f2d3baf42cca01546

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

