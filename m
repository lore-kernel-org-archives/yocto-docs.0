Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C181C433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 11:27:21 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.22194.1641986838192867018
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 03:27:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:44480 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1n7bmf-006h1R-8o; Wed, 12 Jan 2022 06:27:16 -0500
Date: Wed, 12 Jan 2022 06:27:13 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] was there any discussion about supporting comments on
 online doc pages?
In-Reply-To: <88ac71ee-08ce-9b25-9893-15e456d1918f@bootlin.com>
Message-ID: <b18e4752-447e-4f3-427b-13907a6d9183@crashcourse.ca>
References: <e6aa3a37-78a-2a2e-b0e4-d7eddab21524@crashcourse.ca>
 <bbdb160b-a74f-8399-42c1-a31c09492fa3@bootlin.com>
 <39a3630-ec14-ef57-1375-11a598d181@crashcourse.ca>
 <88ac71ee-08ce-9b25-9893-15e456d1918f@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Wed, 12 Jan 2022 11:27:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2391

On Wed, 12 Jan 2022, Michael Opdenacker wrote:

> On 1/12/22 12:03 PM, Robert P. J. Day wrote:
> >
> >   i haven't yet tested this myself; the idea was to support online
> > feedback strictly as off-the-cuff suggestions about a page, or
> > asking questions about something on that page, etc -- there was no
> > suggestion as to adding any of that feedback back into to the
> > official docs, other than manually and explicitly.
>
> Of course.
>
> >   in effect, this online feedback mechanism would be totally
> > divorced from the current docs preparation. is that the question
> > you were asking?
>
> Right, but it could be a valuable source of feedback. However, we
> would have to keep track of such comments, take the relevant ones
> into account, answer questions and if possible discard the
> irrelevant ones.

  all certainly true, but nothing says anyone *has* to follow the
discussions -- one could just look at it as a place where readers
could share tips and so on.

  on the other hand, it could also take the place of submitting
official bugzilla bugs, if someone just wants to leave notes like,
"hey, there's a spelling mistake", or "you forgot to mention option
'--fubar' in your list of options."

  anyway, it was just a thought.

rday

