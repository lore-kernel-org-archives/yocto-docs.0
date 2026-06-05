Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08C7CD6E7D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 16:48:07 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12389.1780678078040797447
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 09:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ptcBeU8b;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Gxk4DF4YOwDik41U1LxFDZ0YY6hUwOcpSzdF5ihjBHw=; b=ptcBeU8bwovxb8hztUJU7JaoqG
	c7Py/eT/mx6KGUBO7YKwUFSlKTH2//Nvn6N5h1v5CPBHLtrJKrWLoLNpI0yPKfqf6Nhh9pIuAytFA
	piEK29Hq5T3ajKTrHc5/7lpXb8BQBAG6JIxap8in7f/IdgGvTHCCdY4je4whf8jvj5OUChP5GF/Le
	ezI+9nto6zpht8h+4UYLgSbMrvwsHSgZArqQn3OvDd38Yzh7LDDvpejA+Cpu5BFjRlw1HVBemTxTz
	Wo+6eou4N5NkUiTV0lYMfN2BTviXu15iRW/L09HCrnqzlQlUBrU4+PAcxmxD93Cf5KR8IAnjsI/WG
	7i7hFOmA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:36636 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wVXi6-0000000E7eB-2mJJ;
	Fri, 05 Jun 2026 12:47:56 -0400
Date: Fri, 5 Jun 2026 12:47:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: antonin.godard@bootlin.com, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] "Required Variables" aren't really "required"
In-Reply-To: <fb282cc79d2400a2c7737fe3d3e2f83ee3606f50.camel@linuxfoundation.org>
Message-ID: <bc623a0e-e531-6141-8bd7-da5aac07a41c@crashcourse.ca>
References: <8571c31b-3d25-c00c-df7a-68b61c48cb63@crashcourse.ca>     <DJ167JWTFOGI.23YVKLIRK8LG8@bootlin.com>     <3091fc6f-a221-8af6-c844-4ffca0bd0ecd@crashcourse.ca>    <059b9f24b250f12dfd262d2b44d3afab53d1bdce.camel@linuxfoundation.org>   
 <3bc0de42-2b65-212b-c8ac-39898b4fc0e4@crashcourse.ca>   <b5010b6b2373955c252760ef900d860b3480d85d.camel@linuxfoundation.org>   <e8e3de5e-8cd0-3a86-92a5-11bc0e943ecd@crashcourse.ca>  <4f5e74f5e90c8eac3eac7c4a590455735c649ab7.camel@linuxfoundation.org> 
 <b68c0573-dcba-8edc-6ea2-7e898fbf960d@crashcourse.ca> <fb282cc79d2400a2c7737fe3d3e2f83ee3606f50.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-734737819-1780678086=:2628012"
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
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 16:48:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9621

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-734737819-1780678086=:2628012
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 5 Jun 2026, Richard Purdie wrote:

> On Fri, 2026-06-05 at 12:32 -0400, Robert P. J. Day wrote:
> >   yup, and i was a bit surprised at the result (although i'm sure this
> > will come as no surprise to you).
> >
> >   with wrynose release, i picked a random oe-core recipe (util-linux),
> > and edited the associated ptest.patch file to delete the line:
> >
> >   Upstream-Status: Pending
> >
> > i was surprised that if i simply wanted to generate the environment or
> > parse the recipe:
> >
> >   $ bitbake -e util-linux
> >   $ bitbake -p util-linux
> >
> > that worked fine, so i guess neither of those operations checks the
> > patches.
> >
> >   predictably, this command:
> >
> >   $ bitbake -c do_patch util-linux
> >
> > generated:
> >
> >   ERROR: util-linux-2.41.3-r0 do_patch: QA Issue: Missing Upstream-Status in patch
> >
> > so that works just fine.
> >
> >   in short, the necessity for upstream status applies only to oe-core
> > patches. should the docs mention that distinction?
>
> I went and checked and "patch-status" is being added to ERROR_QA
> unconditionally so it should apply to other layers too, unless you've
> something changing that locally (a layer or local config).
>
> I do feel this discussion is off in the weeds but I really don't like
> the docs being altered based on incorrect information.

  i will check why local layers seem to be treated differently.

rday
--8323329-734737819-1780678086=:2628012--

