Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35235C3064D
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 16:30:04 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.12447.1719505799345219775
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Jun 2024 09:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KOscwQsE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3751FFF802;
	Thu, 27 Jun 2024 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719505797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzkw+eM+KisHgQvK73NgppeYaX3+CrUgsyh5HE4I9Yc=;
	b=KOscwQsEA7h2lYX985O4KrBhGIxUAyP/duchlj5j9ixKEqcXFihjYIorTopDAaF15R7+SI
	8HuqalsrrUwhQyY6ypigBwjTEXqf/IlMJrOFDXetP3P35ozxie42fAw0RSq+dZjmG/redx
	WcnqtXS6Sjc86Cjx7oTVh4IjMeRGSiGD1zj/rEhytvXUxNNMMqTs+VnNJXes6OFmlW4Mn2
	6v1zEN22x0MWK+Qoz/STrDt3jffeG9L1gyZF0ksci76lzDBCYekkKAbMiYzaZ6XRBiZ1HO
	ro8QsRdFdfWusHpyBZTKflihiOUZjDlLS6vEYJHCE7FukDvlrbrpm5AbEqdREg==
Date: Thu, 27 Jun 2024 18:29:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Michael Opdenacker <michael@opdenacker.org>
Cc: docs@lists.yoctoproject.org, Lee Chee Yang <chee.yang.lee@intel.com>
Subject: Re: [docs] [PATCH] migration-guides: add release notes for 4.0.19
Message-ID: <202406271629566057327a@mail.local>
References: <20240606013102.1462801-1-chee.yang.lee@intel.com>
 <17D66D486A5E0988.31248@lists.yoctoproject.org>
 <a5bfbf72-e3b7-4a1c-9f1a-9f50486d7547@opdenacker.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5bfbf72-e3b7-4a1c-9f1a-9f50486d7547@opdenacker.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Jun 2024 16:30:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5310

Hello,

On 25/06/2024 17:32:40+0200, Michael Opdenacker wrote:
> Hi Alexandre,
> 
> On 6/6/24 15:27, Michael Opdenacker wrote:
> > Hi Lee,
> > 
> > Thanks for the update!
> > 
> > On 6/6/24 03:31, Lee Chee Yang wrote:
> > > From: Lee Chee Yang <chee.yang.lee@intel.com>
> > > 
> > > add release notes for 4.0.19.
> > > 
> > > Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> > > ---
> > > � .../migration-guides/release-4.0.rst��������� |�� 1 +
> > > � .../migration-guides/release-notes-4.0.19.rst | 159 ++++++++++++++++++
> > > � 2 files changed, 160 insertions(+)
> > > � create mode 100644
> > > documentation/migration-guides/release-notes-4.0.19.rst
> > 
> > Reviewed-by: Michael Opdenacker <michael@opdenacker.org>
> 
> 
> This commit was merged into the "kirkstone" branch, but it should also be
> added to the "scarthgap" and "master" ones. For each branch that we support,
> the usual practice so far is to include the release notes corresponding to
> all previous releases plus the current one.

This is done now!

> Cheers
> Michael.
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5303): https://lists.yoctoproject.org/g/docs/message/5303
> Mute This Topic: https://lists.yoctoproject.org/mt/106515980/3617179
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

