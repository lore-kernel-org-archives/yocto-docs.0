Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1772C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 09:34:21 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.7044.1633340060660088832
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Oct 2021 02:34:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:42584 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mXKMU-0000RY-R5; Mon, 04 Oct 2021 05:34:19 -0400
Date: Mon, 4 Oct 2021 05:34:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] best practices regarding using WKS_FILES to reference
 multiple .wks files?
In-Reply-To: <20211004082421.2rgtcfjxodmkrq5e@fedora>
Message-ID: <8b867c34-b494-be37-736e-cc1ed3aa0ec@crashcourse.ca>
References: <409faf0-ab12-33b5-20d0-aa60d678ef6@crashcourse.ca>
 <20211004082421.2rgtcfjxodmkrq5e@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Oct 2021 09:34:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1912

On Mon, 4 Oct 2021, Quentin Schulz wrote:

> Hi Robert,
>
> On Sun, Oct 03, 2021 at 10:53:54AM -0400, Robert P. J. Day wrote:
> >
> >   quick observation -- variable glossary makes no reference to
> > WKS_FILES variable (or a few other wic-related variables as i think i
> > mentioned once, but that's not why we're here).
> >
> >   simple practice for wic is to define a single .wks file which
> > defines all partitioning for the target. however, what i'm running
> > into in my current project is that that single .wks file defines a
> > couple dozen partitions, many of which are maintained by a number of
> > different developers.
> >
> >   unsurprisingly, since all this content is in a single file, and
> > those developers are regularly tweaking their partition attributes,
> > it's a regular occurrence to have commits step on each other when
> > merging to master.
> >
> >   is it reasonable (or even doable) to define a collection of
> > reasonably independent .wks files that, collectively, define the final
> > partitioning, and use WKS_FILES to pull them all in, thus avoiding all
> > those merge conflicts?
> >
>
> No. WKS_FILES is not doing what you think it is.

  story of my life. :-)

> WKS_FILES is a list of candidates for the .wks file that will be used by
> wic. First to be found (left to right) will be used.
> c.f. https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/image_types_wic.bbclass#n57,
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/image_types_wic.bbclass#n39
>
> What I found reading the code is that an include statement should work
> in the wks file, c.f. https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/scripts/lib/wic/ksparser.py#n282
>
> I don't know if they are supposed to be in the same directory, if
> the path after the include directive is absolute, relative and if
> relative, to which directory.
>
> If that works, I think this is something that should be documented
> :)

  yup, that could very well be what i'm after, having the same effect.

rday

