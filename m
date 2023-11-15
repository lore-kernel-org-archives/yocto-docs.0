Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9A1C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 10:58:19 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.10577.1700045893387733457
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Nov 2023 02:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Ini9qm8h;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LMDmCIRmUwqLwYuiJbUBcLT0whQkp2QRpFmnWrOqhpc=; b=Ini9qm8h3PJ2ClSX0aurWJSYHM
	o2V6p4wHKO71QdGhzkAuRwRznjZ04JdxJRva6mN5btpltrc/SdS7rBUN1AUeLbIUb2QX3PqQVyD68
	GOrntaLI+koqqbHJRTEZX7v2eWkwyScID8sixv9I5K0QIphHckEqJXKzp74GY/tJlZ6Q5N+xtnVLU
	sOVrzyrFP6LIqEIAgsREEABIcjbA1yqpkuCyLxAUK8P7ziKRSgw20n8NmwtQAdLOHQdflSGjfKhfB
	dmakFrm6znSjeGaqycrevY1FLsovTgOb7seoeqfOqVBiyLPTY1RZyKkPe8TrlvXaf8RJWloYPsjlm
	dvwHpKHQ==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:33920 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1r3Daz-009bQu-02;
	Wed, 15 Nov 2023 05:58:12 -0500
Date: Wed, 15 Nov 2023 05:58:02 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] where is "But that file is already provided" diagnostic
 explained?
In-Reply-To: <7b160a7572f4ba0f3446975f8e14f1e01924d393.camel@linuxfoundation.org>
Message-ID: <b0f2c7d9-6de5-88c3-57a-8edfc5eb4f9a@crashcourse.ca>
References: <46cf229c-4a9c-833d-758-357b7d5cafc@crashcourse.ca> <7b160a7572f4ba0f3446975f8e14f1e01924d393.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-494077847-1700045891=:961514"
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
 <docs@lists.yoctoproject.org>; Wed, 15 Nov 2023 10:58:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4634

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-494077847-1700045891=:961514
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 15 Nov 2023, Richard Purdie wrote:

> On Wed, 2023-11-15 at 05:40 -0500, Robert P. J. Day wrote:
> >   Asked on OE list, but a colleague has two recipes that are trying to
> > install the same files and, while I suggested cleaning up the recipes,
> > just to get things running, I recall(?) that there is an INSANE_SKIP
> > setting that will override this, but I don't see it documented
> > anywhere.
> >
> >   The error message contains the phrase, "But that file is already
> > provided by package", yet I can't find a reference to that in the
> > "insane" class doc page
> > https://docs.yoctoproject.org/ref-manual/classes.html#ref-classes-insane
> >
> >   Thoughts?
>
> I'm fairly sure that isn't an insane.bbclass check but perhaps from
> staging.bbclass or sstate.bbclass. If that were true, it wouldn't be
> INSANE_SKIP controlled.
>
> I can't see the phrase you mention in the code though. I kind of doubt
> we'd have something that says "But" with that capitalisation so are you
> 100% sure that is what the message says?
>
> It is a bit hard to offer help when we don't have the actual error and
> you're making guesses about the cause which might not be correct.

  Never mind, I was just informed that this is Wind River Linux, not
pure Yocto. That would have been useful to know. Sorry.

rday
--8323328-494077847-1700045891=:961514--

