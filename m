Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34814C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 11:11:32 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.10195.1652267490405392720
 for <docs@lists.yoctoproject.org>;
 Wed, 11 May 2022 04:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:38794 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1nokFd-0008Ng-EB;
	Wed, 11 May 2022 07:11:29 -0400
Date: Wed, 11 May 2022 07:11:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] is there an actual "Getting Started" guide?
In-Reply-To: <36a536ea-b77e-6e9e-e9c4-00a3790fb32d@theobroma-systems.com>
Message-ID: <e1d5fe50-d15f-b54f-929a-dd7eda8ff4f4@crashcourse.ca>
References: <e9ed828b-e775-66e9-5d28-b1e7499adc6e@crashcourse.ca>
 <731ed051-1887-c9a3-f09e-1003113d2e89@theobroma-systems.com>
 <e14d577f-fe71-d71e-6eaf-2e87214a593f@crashcourse.ca>
 <36a536ea-b77e-6e9e-e9c4-00a3790fb32d@theobroma-systems.com>
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
 <docs@lists.yoctoproject.org>; Wed, 11 May 2022 11:11:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2932

On Wed, 11 May 2022, Quentin Schulz wrote:

>
>
> On 5/11/22 12:41, Robert P. J. Day wrote:
> > On Wed, 11 May 2022, Quentin Schulz wrote:
> >
> >> Hi Robert,
> >>
> >> On 5/11/22 12:28, Robert P. J. Day wrote:
> >>>
> >>>     was building a fresh ubuntu 22.04 build machine for OE/YP, starting
> >>> with minimal install to see how much more i would have to add, and
> >>> got (via sanity.bbclass) a missing module message based on:
> >>>
> >>> status.addresult('Your Python 3 is not a full install. Please install
> >>> the module %s (see the Getting Started guide for further
> >>> information).\n' % e.name)
> >>>
> >>>     note the reference to the "Getting Started guide", which does not
> >>> seem to exist (anymore?). where *would* one go to resolve an error of
> >>> the form "missing distutils.sysconfig" absent a Getting Started guide?
> >>>
> >>
> >> I think this is what you're after?
> >> https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_ref-2Dmanual_system-2Drequirements.html&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=yPuNzagIy_whkBE_pem1x9YQx7w5lvQlVIoLNlaMimJyeWKCJdIPq9TjDyYGWrjs&s=24h3qNQNp2mMdaiqx5o7n3youEbYKRITx0hwOnd9Mdo&e=
> >>
> >> If so, please send a patch to update the error code to point to this
> >> piece of documentation :)
> >
> >    i *suspected* it was something like that, just wanted to make sure
> > there was no "getting started" guide i'd managed to miss all this
> > time.  will send patch to OE list.
> >
>
> I think it *might* actually be
> https://docs.yoctoproject.org/dev-manual/start.html.
>
> c.f.
> https://git.yoctoproject.org/yocto-docs/commit/?id=028f8f7a1b93a023a99ffadb01b0da699b4081c2
>
> Either way, it needs to be fixed :)

  actually, backing up a bit, i think there's a slightly larger
problem. consider again the snippet from sanity.bbclass:

  # Check the python install is complete. Examples that are often removed in
  # minimal installations: glib-2.0-natives requries xml.parsers.expat and icu
  # requires distutils.sysconfig.
    try:
        import xml.parsers.expat
        import distutils.sysconfig
    except ImportError as e:
        status.addresult('Your Python 3 is not a full install. Please
        install the module %s (see the Getting Started guide for
        further information).\n' % e.name)

seems to me that, regardless of where that snippet sends the reader,
how to resolve that issue should be explained there, no?

  so one gets "hey, you need to install the module
distutils.sysconfig'. great. how? if the reader is not a python
expert, they may not realize the solution on ubuntu 22.04 is:

  $ sudo apt install python3-distutils

how are they supposed to know that? should whatever page they're sent
to address this? is it simply a matter of adding that package to the
list of required packages for the various distros?

rday

