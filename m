Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1752FCCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 11:19:34 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.29463.1761563965059451476
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 04:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=BNNzseL/;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=itR1MHM/R1CztNks44dpqPywVpWey5LxJQreWcD/pAQ=; b=BNNzseL/SZ4d1/O7CjeUsOwMck
	MeSLguO9K0U+DZxWgkmnqrTrPcriy7oavfxsRNI2BZeCl1dRoGyqhtqQ5E9ot9TBvqOGEu+6CULZs
	UMm9BypDq+QL4T316zcU5HVkfMhha+ZhkSkFnNJyfHDNDbyfwR5dQ1YV3aPZRMOUOvzKR1dAC6OW6
	KTRcJMriO+4nPU/kKgFNz0JpoiI3vs6WwFsQz7AbSUF4O0nr5pcqGLM090UJ6WxahfpF1yYM0+x0o
	QuEWSgPR8LQcd4KRwCCLYetTUVQxSw2Ra+IBel8GIy4Ldkp1kz9MzJ2dL5WvqZiPXObOfrMdu8/NX
	k9JyG1LA==;
Received: from [147.129.179.166] (port=37946 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vDLFx-00000008xdB-3WsT;
	Mon, 27 Oct 2025 07:19:23 -0400
Date: Mon, 27 Oct 2025 07:22:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] we *need* an earlier and better explanation for "container
 layers"
In-Reply-To: <CANNYZj8+a2VC+g97Y9qzJ+yNEBzf7V6Opp6Ez2WdZsQaaW0FKg@mail.gmail.com>
Message-ID: <133f710f-b13b-4445-39f5-6f51a0e57d9e@crashcourse.ca>
References: <fd973751-adb0-636f-a9f1-b22f63573e60@crashcourse.ca> <CANNYZj8+a2VC+g97Y9qzJ+yNEBzf7V6Opp6Ez2WdZsQaaW0FKg@mail.gmail.com>
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
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 11:19:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7848

On Mon, 27 Oct 2025, Alexander Kanavin wrote:

> On Fri, 24 Oct 2025 at 15:43, Robert P. J. Day via
> lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> wrote:
>
> > i realize all of this sounds trivially simple to denizens of this
> > list, but i recall those many years ago how i was confused as to how
> > these "layers" worked when there were these different combinations not
> > clearly explained.
> >
> >   thoughts?
>
> I do have some:
>
> - first, let's just drop the 'container layer' term altogether.
> There's no special handling for that, it's only a matter of arranging
> the file tree.
>
> - instead explain that a layer is defined by presence of
> conf/layer.conf and enabled by adding the directory containing that to
> BBLAYERS
>
> - and multiple layers in a repository can be arranged in broadly three ways:
>
> -- repo checkout with a single layer at the top level
> -- repo checkout with several layers in their own directories under
> the top level (meta-openembedded)
> -- tree-like directory structures where a layer is nested inside
> another layer, but neverthless they need to be enabled individually

  i agree that "container layer" is not a helpful descriptor. i also
agree that the emphasis should be on what constitutes a proper layer,
with a casual addendum of, "by the way, a single git checkout can
fetch not just a single layer, but several layers in a couple
different layouts, etc ... with references to real examples such as
meta-openembedded and meta-security to drive home the explanation.

rday

