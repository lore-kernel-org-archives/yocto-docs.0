Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F24CD98E4
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 14:36:54 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16918.1781707006551894822
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Jun 2026 07:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=YkDFBhzc;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=P2drRTtv7WGAbSsUTWZxsYPp7T4sZp65cFvxRm9w/so=; b=YkDFBhzcyKxQBF+g8wGL/tUnTA
	9QFKds/3jRP99FO+Tl0wM9uVG9lo8QflHQwKuSWOION/2YPitTBbg7zArPTlXyUTH9KcHKrsajTN8
	hS9r8XJCdQoo5iM/4UdK29iv8hu3s7K85mJnruki464Gwlq/7bSqag1BpO0Fr3/ZJj6AHdz/NX4Lk
	34b6VNVtFDMo7NCIM2RTl5I6ZnZkIOFN9R2NomXiBGP0MvLHD3QG0QOsRcBC18Nws1JZPgxZ5gyZL
	hQx5/yf9nM7sid5Pt+pmR/viWRHl2c+iezQiFUNQ+pjCd/OgF05TdLM2Wfd0oXhN9Pe/mclACXTnB
	60P4bj0A==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:49778 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZrNf-00000009iZF-2Bpm;
	Wed, 17 Jun 2026 10:36:44 -0400
Date: Wed, 17 Jun 2026 10:36:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] should the dev manual "libraries" sections explain
 "oe_libinstall"?
In-Reply-To: <18B9E36686EC9874.671003@lists.yoctoproject.org>
Message-ID: <25c5d646-2cbc-5448-88f2-a9fdabe9c65f@crashcourse.ca>
References: <3b08f39f-86c4-ce11-0761-8ef793c0fbdd@crashcourse.ca> <DJAI1K5XJBDD.3QTRALTBOKL1I@bootlin.com> <18B9E36686EC9874.671003@lists.yoctoproject.org>
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
 <docs@lists.yoctoproject.org>; Wed, 17 Jun 2026 14:36:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9775

On Wed, 17 Jun 2026, Robert P. J. Day wrote:

> On Tue, 16 Jun 2026, Antonin Godard wrote:
>
> > On Thu Jun 11, 2026 at 1:26 PM CEST, Robert P. J. Day wrote:
> > >
> > >   while the "Working with Pre-Built Libraries" section:
> > >
> > > https://docs.yoctoproject.org/dev-manual/prebuilt-libraries.html
> > >
> > > explains the "oe_soinstall" utility, i see nothing anywhere in the
> > > docs that explains the similar "oe_libinstall" utility, for which
> > > there are a few examples scattered around, such as mtd-utils:
> > >
> > > https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb
> > >
> > >   does this deserve a mention?
> >
> > Yes please
>
>   oddly(?), while i have a couple dozen layers checked out, i could
> not find a single invocation of "oe_soinstall()" anywhere in any of
> those layers. i did find a number of calls to "oe_libinstall()" so
> while that's worth documenting, is the former even being used?

  never mind, i finally clued in to the fact that oe_soinstall is
meant to be used in the context of out-of-tree or vendor-specific
recipes, so one should not expect to find it in "normal" OE/YP layers.

rday

