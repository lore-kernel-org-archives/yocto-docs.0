Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B943ED0EE0A
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 15:53:18 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.603.1764085988797376726
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 07:53:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=j/s7S5gS;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8ipIYX7LwgqoP84c53HZXe8dQi+pf17k/yCFd6QYHok=; b=j/s7S5gSvO4vrf149ESH0tmqEf
	M7AplrkPHZdr46C1KsBwnNz7Neo9CYHIHsTTO1RcW5eBqZBhUSY6QpKam9V4QdiP612uny7QUW0Px
	dzLEf/FawqYOQhBWcrjb0kZ51SG6hv74+YQDhKgtvYZUDrbDYIbzJGrMBjsIvQ2XB68I4T6JrZFv4
	EGltlRsacCKtRFr8VgSPozZ0SCnD7DJN9DqLDSdNWwnlygCa7CZNhko6p9SuW6ZV2Z2JdTUeiQ47s
	/OicExw96gKYyqabYnkZRIKph+7Vi4XCB+N+kNbAcXEqvl2MAnkynU+mtFk09bH2KXvGQJqqf2+Ms
	/cyH7t0Q==;
Received: from [147.129.179.166] (port=58546 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vNvLf-00000008QA1-48Pc;
	Tue, 25 Nov 2025 10:53:02 -0500
Date: Tue, 25 Nov 2025 10:53:53 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] is there any value in a short section somewhere on H/W
 bringup tools?
In-Reply-To: <90133708303aa9fdb7d2bc0cbe3c70aabfc3f3a0.camel@linuxfoundation.org>
Message-ID: <560cd947-5501-98e6-619c-59b509468c8a@crashcourse.ca>
References: <8f9e9bb5-e84e-c9a2-bd27-105ffae5c2e8@crashcourse.ca> <90133708303aa9fdb7d2bc0cbe3c70aabfc3f3a0.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-857962856-1764086039=:1073744"
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
 <docs@lists.yoctoproject.org>; Tue, 25 Nov 2025 15:53:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8123

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-857962856-1764086039=:1073744
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 25 Nov 2025, Richard Purdie wrote:

> On Tue, 2025-11-25 at 06:35 -0800, Robert P. J. Day wrote:
> >
> >   Is there any value in adding a short section on useful OE-available
> > hardware bringup utilities? i just added this to an image to help me
> > poke around a new board:
> >
> >   IMAGE_INSTALL:append = " \
> >         devmem2 \
> >         dtc \
> >         ethtool \
> >         i2c-tools \
> >         libgpiod \
> >         libubootenv-bin \
> >         lshw \
> >         mdio-tools \
> >         phytool \
> >         spitools \
> >         usbutils \
> >   "
> >
> > might this be something that would be appropriate for the BSP guide,
> > or as a section in the dev tasks manual? (i'm sure there are other
> > packages that would belong here as well.)
>
> Most of these are in meta-openembedded? If so, would a packagegroup
> there make sense?

  i was thinking that very thing. could add pciutils and whatever else
people think is appropriate.

rday
--8323329-857962856-1764086039=:1073744--

