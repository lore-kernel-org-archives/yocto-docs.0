Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBFACD6E49
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 08:58:20 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.12292.1697014691046155947
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 01:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=axsaZ9GR;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mRdrprhZeRGr6Ch32kCSg+fqiqz2j62/ATk9PNOjnUY=; b=axsaZ9GRZzoZWeA6f5RjoNovDP
	N+hAbhDs8H7BA1EwtUt6fiia/ujQOR0J3e/WvYxfMgQ1TWF/IrwTDpt+UDPhYWXThACQSHzpwIJFH
	7dYM9HybORZpDJJp840rYbp6J33yt+WREMcG/FCTgzIx5lxxvNlo+lgiGY7GCNikhxQIxgbuL4p6h
	qx9e50opsMzegCYm8rSj/9b6fEBF/eNhDKvnKhIkG3K71jZjPxTlebw3KE+BQOxKUvqIp29aRBFd9
	Fj7efit4lUQIThcKo/tifFpuHaJcmvUqPCv8/FrGoT5E1tZHcERyA4diznd7a1u2Us20a/BYL6nhO
	kpO1bkpA==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:53418 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qqV2d-006hMi-2v;
	Wed, 11 Oct 2023 04:58:09 -0400
Date: Wed, 11 Oct 2023 04:58:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] does bbappend wildcarding cover when there is no version
 string?
In-Reply-To: <3f9eaa19ebb74df218439d6ac03f8f837a7a41f6.camel@linuxfoundation.org>
Message-ID: <bd3d869-a6ed-491-f839-9f68c374c3e4@crashcourse.ca>
References: <b69076ea-5ef4-6c5a-9aff-9a99ff19ce@crashcourse.ca> <3f9eaa19ebb74df218439d6ac03f8f837a7a41f6.camel@linuxfoundation.org>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 08:58:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4340

On Wed, 11 Oct 2023, Richard Purdie wrote:

> On Wed, 2023-10-11 at 04:51 -0400, Robert P. J. Day wrote:
> >   can't remember where this is properly covered, but we all know how
> > version wildcarding works with bbappend files, as discussed here:
> >
> > https://docs.yoctoproject.org/ref-manual/terms.html#term-Append-Files
> >
> > but do the docs explain what happens when there is no version number,
> > such as with the perf.bb file?
> >
> > https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/perf
> >
> > in cases like that, AIUI, the only bbappend format that will work will
> > be perf.bbappend.
> >
> >   this might be worth clarifying in case readers get the impression
> > that the most general and all-encompassing wildcard pattern would be
> >
> >   perf_%.bbappend
>
> FWIW I suspect
>
> perf%.bbappend
>
> would work but would also match
>
> performance_1.0.bb
>
> which is why we suggest perf_%.bbappend

  wait, that would *work*? even though the base recipe file is simply
"perf.bb"? i need to test this, i was sure i tried that once and it
didn't match.

rday

