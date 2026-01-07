Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913CBD0D16C
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 19:17:08 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14360.1767813423317789521
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 11:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=rXaczGk3;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1XHyA+XsughfRhzoQhmrMwIKwf+RaUjB7CJq9gmfQ+4=; b=rXaczGk3LiNAknU24TdeZvq+ZV
	h9u3TYW5cyDYdFx7/FvUa+vk9EZoXpYCwkvliR1xC3rvaF/M4AppmPGNxRblP3deZmcBOuqnQViBa
	DrwU0iQDSR4wigOQ72wbl7o68/bF5go5BMVX9DCjHHIEjTKfIlB8YBKWeXZu1JiYade6KMKnJzBhW
	Z71DtWfzFIVQNIksreH6n9Ijwux/OCz9C2E96rQuPxyybumv3yqpdCMpmqgqnY7NS4BAc7DFgcMeo
	uoptsbw+/Vo7JqDT9kR3mq7mVAQ3aBLktox+eWZALm6NMdFlOF7lyraOq4eMC5CAKpb2alJhslCNm
	sLjnQt7A==;
Received: from [147.129.179.166] (port=42094 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vdZ1g-0000000GHOY-2dNW;
	Wed, 07 Jan 2026 14:17:01 -0500
Date: Wed, 7 Jan 2026 14:19:54 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] questions about documenting conditional syntax
 (overrides)
In-Reply-To: <236c2bac-d0e1-41fc-a0c9-2fb62d938a5c@cherry.de>
Message-ID: <26042863-66d4-374a-a0e2-814cbb86b84c@crashcourse.ca>
References: <a4d00d27-a3e5-4cf5-e9ef-22c52c1c2b39@crashcourse.ca> <236c2bac-d0e1-41fc-a0c9-2fb62d938a5c@cherry.de>
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
 <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 19:17:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8417

On Wed, 7 Jan 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 1/7/26 7:15 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    i've never been crazy about how overrides are explained here:
> >
> > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#conditional-syntax-overrides
> >
> > but it seems that there are advanced usages of overrides that are not
> > mentioned.
> >
> >    first, there doesn't seem to be any mention of using multiple
> > overrides; here's a sample snippet from meta-oe's rsyslog recipe:
> >
> >    # Disable for powerpc64 with musl
> >    VALGRIND:libc-musl:powerpc64 = ''
> >    VALGRIND:libc-musl:powerpc64le = ''
> >
> > that appears to incorporate two separate overrides. can there be an
> > arbitrary number of overrides in an assignment? does order matter?
> >
>
> Pfew. Someone needs to check that, OVERRIDES is *very* complex. It is not easy
> to explain. We need to do something better with it in the docs I agree. The
> same can be said for variable context. Also not an easy topic.

  i remember first reading about overrides and being persistently
confused about what was happening, especially trying to understand the
difference between

  A:foo:append
  A:append:foo

and just this morning as i was experimenting did i have an epiphany
about how to look at this. i might be completely off-base, but here's
what i came up with. (quentin will love this example).

  consider my rockchip jaguar board, which has as two of the overrides
"rk3588" and "jaguar", "jaguar" being the more specific so it should
take priority over "rk3588".

  now i add the following to my local.conf file for that build:

RDAY = "rday"
RDAY:jaguar = "jaguar"
RDAY:rk3588 = "rk3588"

now since "jaguar" is the more specific of the overrides, that should
be the one chosen and, sure enough:

$ bitbake-getvar RDAY
RDAY="jaguar"
$

  now one might say that when that override assignment was
encountered, it assigned the appropriate value to RDAY.

  wrong.

  what was happening is that, as bitbake was parsing everything,
*three* different variables were being assigned values:

RDAY = "rday"
RDAY:jaguar = "jaguar"
RDAY:rk3588 = "rk3588"

  all of those variables exist and i can even display their values:

$ bitbake-getvar RDAY:rk3588
RDAY:rk3588="rk3588"
$ bitbake-getvar RDAY:jaguar
RDAY:jaguar="jaguar"
$

  so all of those override assignments are not doing anything with the
base variable RDAY (yet); they're simply assigning to different
variables and only at the very end of parsing(?) does bitbake decide
which variable's value should be used to assign to RDAY. does that
make sense?

