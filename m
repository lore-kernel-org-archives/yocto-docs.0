Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C91C433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 11:03:33 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.21880.1641985411532996942
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 03:03:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:44478 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1n7bPe-005tcJ-79; Wed, 12 Jan 2022 06:03:29 -0500
Date: Wed, 12 Jan 2022 06:03:26 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] was there any discussion about supporting comments on
 online doc pages?
In-Reply-To: <bbdb160b-a74f-8399-42c1-a31c09492fa3@bootlin.com>
Message-ID: <39a3630-ec14-ef57-1375-11a598d181@crashcourse.ca>
References: <e6aa3a37-78a-2a2e-b0e4-d7eddab21524@crashcourse.ca>
 <bbdb160b-a74f-8399-42c1-a31c09492fa3@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Wed, 12 Jan 2022 11:03:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2389

On Wed, 12 Jan 2022, Michael Opdenacker wrote:

> Hi Robert,
>
> On 1/12/22 10:42 AM, Robert P. J. Day wrote:
> >   my apologies if this topic came up and i missed it ... a colleague
> > is pondering what to migrate to WRT existing documentation, and i
> > suggested taking a look at how brilliantly YP is doing it with sphinx;
> > in particular, she was enthused about the expandable/collapsible ToC
> > down the left side. the only thing she brought up was the need for
> > user-suppliable comments on online pages so readers could ask
> > questions or leave suggestions.
> >
> >   i know sphinx supports online comments as mentioned here:
> >
> > https://sphinx-comments.readthedocs.io/en/latest/
>
> Very interesting. I tried to activate this on a local branch, and
> enabled the Hypothesis engine. After registering an account at
> hypothes.is, I could see that you can add shared notes or private
> ones. However, there's something I don't fully get... What's the
> real value of adding an annotation system to our Sphinx generated
> docs?
>
> Maybe because you don't need any browser extension to see that you
> can annotate text. Anyway, a solution such as Hypothesis seems to
> work with any website. After installing their browser extension and
> logging in, I was given the possibility to add annotations to any
> website, including https://docs.yoctoproject.org/.
>
> So, do we want our readers and users to share their annotations and
> comments directly in the HTML manual? We could get more engagement
> and feedback this way, but this should be extra work to manage...

  i haven't yet tested this myself; the idea was to support online
feedback strictly as off-the-cuff suggestions about a page, or asking
questions about something on that page, etc -- there was no suggestion
as to adding any of that feedback back into to the official docs,
other than manually and explicitly.

  in effect, this online feedback mechanism would be totally divorced
from the current docs preparation. is that the question you were
asking?

rday

