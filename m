Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0306CCD1AB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 09:52:19 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.6626.1761299533778632394
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 02:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=DmQoBufq;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oSnW3IWOaCuWQWiwwodVVmukZaMo0a5agEbXCu/B9fM=; b=DmQoBufqt3uS38uZ0pi3rgL37Z
	sCOBI1Hx/k8C1yoEMp+fam2F3Roq/CyvP2ppMBI16vHegPfYVTZ2l6YEXay/EokEXBxmaxXMkKEzA
	lvs770mp3Q7wj0kNMV9S5bSp72Mi0Ppv/wS2ik/l7xY/L3qbiNj5PtGFJ272l19pCDC/MktgdeOPA
	lpGE1cJNWP1x2RstEQ/wST+dZuMKdMuh3rtenfEHOSDC0ovrhAG1WCZZ+4ykuZDtogkffDd/U/+So
	U89bxvuh+N8juMgTmLzA4TM43X5RIB0y7mfFH/LM7j+f4Wg3FFAXwO/pSZ9loPReQNVOG3oQW8OKO
	mpSIU7dg==;
Received: from [147.129.179.166] (port=38970 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vCESt-0000000FrOv-13CF;
	Fri, 24 Oct 2025 05:52:12 -0400
Date: Fri, 24 Oct 2025 05:54:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Paul Barker <paul@pbarker.dev>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: observations on YP overview manual, ch 3
In-Reply-To: <89dc93e796c8a8ab920324f64168e4a5f04cd51b.camel@pbarker.dev>
Message-ID: <93d6ba04-0274-74d9-0fc3-b951f089dada@crashcourse.ca>
References: <e59c985c-1b0d-3702-fb17-363ad6ed161c@crashcourse.ca> <89dc93e796c8a8ab920324f64168e4a5f04cd51b.camel@pbarker.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-439147684-1761299691=:3917649"
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 09:52:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7812

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-439147684-1761299691=:3917649
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 24 Oct 2025, Paul Barker wrote:

> On Thu, 2025-10-23 at 08:40 -0400, Robert P. J. Day wrote:
> >   from here:
> >
> > https://docs.yoctoproject.org/overview-manual/development-environment.html#
> >
> > * section 3.3, "For any supported release of Yocto Project, you can
> > also go to the Yocto Project Website and select the “DOWNLOADS” item
> > from the “SOFTWARE” menu ...".  i do not see any link or menu entry
> > named "SOFTWARE". same claim is made a but further down.
> >
> >   ah, the graphic on that page shows where it used to be, so that
> > graphic is clearly out of date.
> >
> >   i think that's it for that section.
> >
> > rday
>
> I don't think the website screenshot is adding value to the docs here.
> We can drop the screenshot and update the text to match the current
> website.
>
> Are you able to send a patch for this?

  if people are good with dropping the screenshot, sure, i can provide
a patch.

rday
--8323329-439147684-1761299691=:3917649--

