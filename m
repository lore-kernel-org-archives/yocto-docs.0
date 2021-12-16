Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49C3C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 11:11:29 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.9261.1639653089006409484
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 03:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:45076 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mxofX-0001Yk-8E; Thu, 16 Dec 2021 06:11:26 -0500
Date: Thu, 16 Dec 2021 06:11:23 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] no mention in var glossary of SSTATE_SKIP_CREATION
In-Reply-To: 
 <e3b5eab5515c4602140797c7a9133ef1b719a87f.camel@linuxfoundation.org>
Message-ID: <5cb3a7f8-eb31-17b3-9b25-78aefed9e221@crashcourse.ca>
References: <5e9071cc-fdb1-ec62-efa8-46ac447895a8@crashcourse.ca>
 <e3b5eab5515c4602140797c7a9133ef1b719a87f.camel@linuxfoundation.org>
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
 <docs@lists.yoctoproject.org>; Thu, 16 Dec 2021 11:11:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2285

On Thu, 16 Dec 2021, Richard Purdie wrote:

> On Thu, 2021-12-16 at 04:57 -0500, Robert P. J. Day wrote:
> >   asked this morning about how to disable sstate-cache creation for an
> > individual recipe -- i had no clue so a quick google took me here:
> >
> > https://stackoverflow.com/questions/69674939/how-to-disable-sstate-cache-per-recipe-in-yocto
> >
> > whereupon i verified that there is no mention of this potentially
> > useful variable in the glossary.
> >
> >   i'm not convinced that this is what the questioner really needs, but
> > i'm suggesting that solution until such time as i can figure out what
> > they're *really* trying to do.
>
> This is one of those variables which was added as there was a
> specific need but you really shouldn't be using it so I'm not
> surprised it isn't documented and personally, I'd kind of prefer it
> wasn't, not that I can stop anyone.
>
> It does have some really "interesting" side effects which once you
> use it, you'll then complain about.

  that's why i added that i was skeptical as to whether this was what
the OQ was looking for, as i suspect there is a better solution. i
will try to nail down what their actual problem is, rather than what
they think the solution is.

rday

