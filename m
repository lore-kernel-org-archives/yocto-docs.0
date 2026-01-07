Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12914D0D176
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 21:09:09 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16882.1767820146556884488
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 13:09:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=RrB9o4SQ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1zPmi6J2RyG1o1wMWjyo6TkZchYPY1PVK/CjhSAqOVk=; b=RrB9o4SQqPgCG6+rp22uKNMKbH
	yPXlILP2GB9qKN3VTW9KsgZjC6RVLpCq+TmGNko6hy0k2apxnOStZWJW78/57mmxIg/r0JNzlpVLS
	FfOYB1NEJXO08PCDie4i+im6G+4hcIuD0VbgVjMf8oWtczkkoWFQSMLVYyR+aeIqKXVK7Owlp4HkC
	ti+s8KRQDOVbZYkfEJLdiKyPFZRH0R7ic2q8FuWEP09m+85Mx7n8YEHNyMTGOxBQziZ9gG+ui9s9i
	epJGAhL/50+AQ6Hm+16kv6lD9FdkruOKVLggI6LHkcQmTe+cqsGuyfQHJ2UUtGrNzJGEMdGRMnI6/
	hVJVcSug==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:33878 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vdam8-0000000GZ2x-1848;
	Wed, 07 Jan 2026 16:09:04 -0500
Date: Wed, 7 Jan 2026 16:12:09 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] questions about documenting conditional syntax
 (overrides)
In-Reply-To: <236c2bac-d0e1-41fc-a0c9-2fb62d938a5c@cherry.de>
Message-ID: <e4979bdb-6276-e43d-5ab8-c06c8b0c2f48@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 21:09:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8418

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
>
> If I remember correctly, if no other OVERRIDES is involved for the same
> variable
>
> VALGRIND:libc-musl:powerpc64
> and
> VALGRIND:powerpc64:libc-musl
>
> result in the same outcome. Note that :append, :prepend and :remove are NOT
> typical OVERRIDES and replacing e.g. powerpc64 with append in the above,
> results in different behavior in some cases (you usually want
> FOO:append:machine and not FOO:machine:append). We'll omit that for now.
>
> The question is when OVERRIDES A is "weaker" than OVERRIDES B (that is, it
> appears on the left of B in the OVERRIDES variable), what happens for
>
> FOO1:A:B = "bar"
> FOO1:A = "foo"
>
> FOO2:A = "foo"
> FOO2:A:B = "bar"
>
> FOO3:A:B = "bar"
> FOO3:B = "foo"
>
> FOO4:B = "foo"
> FOO4:A:B = "bar"
>
> FOO5:B:A = "bar"
> FOO5:A = "foo"
>
> FOO6:A = "foo"
> FOO6:B:A = "bar"
>
> FOO7:B:A = "bar"
> FOO7:B = "foo"
>
> FOO8:B = "foo"
> FOO8:B:A = "bar"
>
> A simple bitbake check should help answering that question.

  as a simple (and realistic) example that follows the way i described
things in my last email, consider the following (where, again, jaguar
is more specific than rk3588 and should take precedence):

RDAY:jaguar:rk3588 = "jaguar:rk3588"
RDAY:rk3588:jaguar = "rk3588:jaguar"

don't ask what the final value of RDAY will be; instead understand
that there will be *five* variables related to this, all of which i
can display with "bitbake-getvar":

  RDAY:rk3588:jaguar="rk3588:jaguar"
  RDAY:jaguar:rk3588="jaguar:rk3588"

  RDAY:rk3588="rk3588:jaguar"
  RDAY:jaguar="jaguar:rk3588"

  RDAY="rk3588:jaguar"

i'm not sure if that has any more explanatory value, but it makes it
easier for me to understand that all those override assignments are
just assigning values to variables, and it's all processed finally at
the end of parsing to determine the eventual value.

rday





