Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E85CCF9FA
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 11:38:07 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.13364.1761910676927249416
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 04:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=lN5rCZZM;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HRigUpUbWChqtBXe+I9BJTgVY9ZTdG+yeNwyG0uiGS4=; b=lN5rCZZM/BJ9BN0FXh0IKCYmk2
	3WJXIuYKbUhP4m3sr+X4f4ivSE1uZKa+RSuwEziNpCmBMTULPV2wEmM8UDtw+GfE1Hy9nVnGzoqSH
	Jl8frmAn6rQN9wP4I8pEeSeSVuYsMS2rKVXF4Jb/FAmyHRj7M8YZQVmFe8OzOb2030GVdZanN20oz
	RWR/Atmyqci/6A6RLw+xsV+FfZZYxEFP5QaiamKddmizgjQWnqZXsSsLhSTpXwjJzHLDcdsTB09+B
	ggk43BXESwlVz2yYOfm67eqjHKtCSuZT1ZsAuX0T5OEincig9pAGFuoEtRlo0RqV4P84s3MIYZvTC
	L/HEJoHg==;
Received: from [147.129.179.166] (port=35526 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vEnS3-00000005ac9-0WMa;
	Fri, 31 Oct 2025 07:37:54 -0400
Date: Fri, 31 Oct 2025 07:40:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] why would you even use "FILESEXTRAPATHS:append ..."?
In-Reply-To: <29945dcb-cb44-4754-bd6f-02ee46cb4b90@cherry.de>
Message-ID: <524df88c-2d1c-ae3d-12ae-4234296217a2@crashcourse.ca>
References: <84dd014b-1c65-412a-ab7b-222add07fb63@crashcourse.ca> <29945dcb-cb44-4754-bd6f-02ee46cb4b90@cherry.de>
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
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 11:38:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7938

On Fri, 31 Oct 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 10/31/25 11:55 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    a followup to my earlier post pointing out improper usage with that
> > feature ... i'm still unclear as to why one would *append* to
> > FILESEXTRAPATHS. it seems like that might be something worth
> > explaining when that section comes up.
> >
>
> The only reason I can think of at the moment is for a smooth transition
> period.
>
> E.g. I absolutely need a file to be in SRC_URI so I'll have my bbappend add
> its path to FILESEXTRAPATHS (so far nothing different from a typical setup).
>
> But, I want to upstream this so I don't have to carry it forever. My patch
> eventually gets merged into e.g. OE-Core and it has the file in SRC_URI.
>
> If I were to use :prepend in my bbappend, my file would always take precedence
> even if there are patches made to the file in OE-Core.
>
> Instead, I could use an :append in which case whenever OE-Core has the file in
> SRC_URI, it'll use that one instead of the one from my bbappend.
>
> Now I can forget about it because it won't be used the moment OE-Core has the
> patch merged.
>
> This is actually quite useful if you have a layer that works with a release,
> say scarthgap. I patch in my layer until my patch gets merged into master and
> then backported to scarthgap, that may take a few months before a scarthgap
> release carries my patch. How do I make sure my layer is compatible with
> release 4 of scarthgap without the patch and release 8 with my patch, but
> still benefit from changes to the same file in e.g. release 15 of scarthgap?
>
> I think there could be a usecase for a bbappend for multiple versions of the
> same recipe but I cannot articulate it now, so maybe that is just something my
> mind is trying to make up.
>
> In short, I think it's more often a mistake than something intended. We have
> had the same kind of issue with the wrong operator (or line order) used with
> MACHINEOVERRIDES where its order got all messed up (admittedly years ago :) ).

  interesting ... it occurs that while it might not be worth this
corner case explanation to the docs, it might be worth adding a note
to this section:

https://docs.yoctoproject.org/ref-manual/variables.html#term-FILESEXTRAPATHS

advising that "prepend" is almost always what you want, and while it's
possible to "append", that is more than likely a mistake, and should
be done only by developers who understand the difference.

  or something like that.

rday

