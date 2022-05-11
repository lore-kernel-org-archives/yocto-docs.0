Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F005BC433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 10:41:31 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.9770.1652265681541597164
 for <docs@lists.yoctoproject.org>;
 Wed, 11 May 2022 03:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:38790 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1nojmS-0007sZ-BS;
	Wed, 11 May 2022 06:41:20 -0400
Date: Wed, 11 May 2022 06:41:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] is there an actual "Getting Started" guide?
In-Reply-To: <731ed051-1887-c9a3-f09e-1003113d2e89@theobroma-systems.com>
Message-ID: <e14d577f-fe71-d71e-6eaf-2e87214a593f@crashcourse.ca>
References: <e9ed828b-e775-66e9-5d28-b1e7499adc6e@crashcourse.ca>
 <731ed051-1887-c9a3-f09e-1003113d2e89@theobroma-systems.com>
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
 <docs@lists.yoctoproject.org>; Wed, 11 May 2022 10:41:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2930

On Wed, 11 May 2022, Quentin Schulz wrote:

> Hi Robert,
>
> On 5/11/22 12:28, Robert P. J. Day wrote:
> >
> >    was building a fresh ubuntu 22.04 build machine for OE/YP, starting
> > with minimal install to see how much more i would have to add, and
> > got (via sanity.bbclass) a missing module message based on:
> >
> > status.addresult('Your Python 3 is not a full install. Please install
> > the module %s (see the Getting Started guide for further
> > information).\n' % e.name)
> >
> >    note the reference to the "Getting Started guide", which does not
> > seem to exist (anymore?). where *would* one go to resolve an error of
> > the form "missing distutils.sysconfig" absent a Getting Started guide?
> >
>
> I think this is what you're after?
> https://docs.yoctoproject.org/ref-manual/system-requirements.html
>
> If so, please send a patch to update the error code to point to this
> piece of documentation :)

  i *suspected* it was something like that, just wanted to make sure
there was no "getting started" guide i'd managed to miss all this
time.  will send patch to OE list.

rday

