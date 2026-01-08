Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437C1D1D480
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 16:09:43 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10063.1767888580006103917
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Jan 2026 08:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=q/5lUyGE;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=msz6j1Ms5sGV+nSXMNNBHWD1i2D7nP4vEVukNMHlqzY=; b=q/5lUyGEPXYOjI9n+n3gHXKKC+
	LYg6609E3QfhVEnX28/ZP4AfB3olpgZS8G7kPi5z32QlBo/Ua4XUR8Bz8IEXoVHa18yGD8YkQ2dIj
	Z6rBOsX2X7ES8hwiN0EQiAdqn1Y8CwX8rT45SwWKpdb7YoK4/E/GyFBGv/DpGLIk0/c63haXcrGe+
	K1GPt9rz+4elFDU7Ef013GOyEJlU5zXzWjkkZzjboDglZ9c+7x0Ur5xkxhJ1jihEsXRYhkQFh9y1e
	QbrqRg2SxFD36GOR6stas9XkkzZDfL0aboUasVd7fnq8/fmiihFjsxkbGktTTOHA2Z++GLmm/xOgR
	HQTwq5Uw==;
Received: from [147.129.179.166] (port=43920 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vdsZq-000000020eZ-363g;
	Thu, 08 Jan 2026 11:09:38 -0500
Date: Thu, 8 Jan 2026 11:12:32 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] should docs explain unversioned recipe files and unversioned
 append files?
In-Reply-To: <95d28d64-2db5-4281-b2e0-2a42159cd891@cherry.de>
Message-ID: <974c63ef-16c3-0271-d4fd-7a92b39bd8ca@crashcourse.ca>
References: <fbd1c18a-ea92-1a7b-14bb-2ccbf0400828@crashcourse.ca> <95d28d64-2db5-4281-b2e0-2a42159cd891@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 Jan 2026 16:09:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8428

On Wed, 7 Jan 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 1/7/26 2:05 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    one more pedantic observation about append files and corresponding
> > recipe files. occasionally, one runs across an unversioned recipe file
> > for which some other layer has an unversioned bbappend file, one
> > example being the "mesa" recipe:
> >
> > $ find . -name "mesa.bb*"
> > ./meta-raspberrypi/recipes-graphics/mesa/mesa.bbappend
> > ./meta-freescale/recipes-graphics/mesa/mesa.bbappend
> > ./openembedded-core/meta/recipes-graphics/mesa/mesa.bb
> > $
> >
> >    so what is the rule here? if a recipe file is unversioned, then the
> > append file for it must also be unversioned to match? what if the mesa
> > recipe were suddenly to become versioned? would that append file still
> > be applied? the docs don't seem to cover this possibility.
> >
>
> Can you try and report to us?
>
> - does mesa_%.bbappend apply to mesa.bb
> - does mesa.bbappend apply to mesa_git.bb
>
> Considering mesa.bbappend applies to mesa.bb, we should update
> https://docs.yoctoproject.org/dev-manual/layers.html#appending-other-layers-metadata-with-your-layer
> to mention that recipes without a version in their name can also have their
> own bbappend following the same naming scheme.
>
> I know that u-boot%.bappend also applies to multiple u-boot recipes, see
> https://git.yoctoproject.org/meta-rockchip/commit/?id=ebfc42663d52f2247b7de5d6267b353887cc2d91.
>
> It'd be nice to check (and document) whether mesa%.bbappend applies to
> mesa-foo.bb, mesa-foo_git.bb.

  i'll find some time this weekend to test the above, but is it
reasonable to ask how this feature *should* behave with unversioned
recipe and bbappend files?

rday

