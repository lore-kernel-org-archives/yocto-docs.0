Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3735C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 18:31:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.4405.1752085869485408824
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 11:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=saN2AI1D;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9ZIYfGp2Bqb6MORLJZ92HpAnG8ulrGy2flIc4fyCWR4=; b=saN2AI1DQJ7i6UDkunVG+OrgCP
	525T+/4BbZ6mCB4HvghTkMMQkqK/J49Bwah9WxjUp8JgsOFrFuBNsSJbFOqDvWS+FsO1AlOHstejM
	Vb762Eexz414SsdEWhlJ1tJz2xR+dhfSdRfhZ5I1Q/MWO9nuiZPdO3ETZtOUTAaQabRuZhdtz/E/6
	bP7PulqVGNXHxJ+HQdFdBWsh+qKXARL8n9UeTwlLLr4vo7F7So79vCh9+xg8EjmV4SibxY6df8jkU
	rdXYA4g8k3t5Dd8NJGj0SoCziZ4wSZzL/AqwRJU5gCLWhh58a1sSOkH1nr8DVnztIyD0O978JtGbg
	WTWqHUZA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:32998 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uZZZR-0000000BbDU-0tsW;
	Wed, 09 Jul 2025 14:31:08 -0400
Date: Wed, 9 Jul 2025 14:31:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Khem Raj <raj.khem@gmail.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] OVERRIDES explanation in BB reference is confusing
In-Reply-To: <7d8d6444-7183-4149-986e-7a4ec8ddedf3@gmail.com>
Message-ID: <f34bd5ea-282f-beca-f077-41e88ee5ad36@crashcourse.ca>
References: <1725d309-893c-d825-2d29-90353e3dff28@crashcourse.ca> <7d8d6444-7183-4149-986e-7a4ec8ddedf3@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-763936928-1752085867=:831408"
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
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 18:31:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7305

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-763936928-1752085867=:831408
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 9 Jul 2025, Khem Raj wrote:

>
>
> On 7/9/25 5:16 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > here:
> >
> > https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-OVERRIDES
> >
> > the example saetting for OVERRIDES does not resemble anything i've
> > ever seen:
> >
> >    OVERRIDES = “arm:x86:mips:powerpc”
> >
> > what is that supposed to represent?
> >
>
> Nothing, but learning by contrast I believe, but it can be made more serious

  i've felt for a *long* time that the entire OVERRIDES feature
documentation needs to be scrapped and rewritten in *much* more
detail, with real-life examples. that feature is too important to not
be documented thoroughly.

rday
--8323329-763936928-1752085867=:831408--

