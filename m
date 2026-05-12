Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13ABDCD4F24
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 14:14:43 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76486.1778595276801119944
 for <docs@lists.yoctoproject.org>;
 Tue, 12 May 2026 07:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=D9r5brv3;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=v6KYpS58q0S7u5h+Tb9XSXDvsQK3pTdw6DjEi/VZ040=; b=D9r5brv3eKdyWtaKB0oAJTAL1R
	/TBm8h6b52mhKCsfwLu0JzPvfRnUQbxzmr8Z/18EwBfqb08khXzeN8lhRfn17wLY4qndiEIbvSW/4
	nApyje5U9Gyq9hafMqznHp9Knc2Ms4EnU8DzepZKy71WqB162m1v5ucPxBSO8XYG7Oj6PW417cVbd
	Gz7i512CvWkH2X8O84M7RSemaagJen6ts7cs1DhCbeBSFmU2ZF/mIZI1DcDUYvZiweQFkxQrzcfWc
	HOd4TY5uNU/WJtlJLBt73mqaueGCYNzXo43DskLvcml+qlX0Wq77vRgx4Xd7TOgkIOBnu1gamCwyz
	jXD26j9Q==;
Received: from [147.129.179.166] (port=46030 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wMnsX-00000007qlX-3xE9;
	Tue, 12 May 2026 10:14:35 -0400
Date: Tue, 12 May 2026 10:17:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
cc: docs@lists.yoctoproject.org
Subject: Re: [docs] Should explanation of "github-releases" class cover
 private assets?
In-Reply-To: <75217d92-e0ba-44da-8447-b51c0edf0064@kernel.crashing.org>
Message-ID: <6dd1b142-0f22-a231-9aae-8a2a70ec2de4@crashcourse.ca>
References: <f3b7de9b-a40c-5638-7d5b-d7004f987b02@crashcourse.ca> <75217d92-e0ba-44da-8447-b51c0edf0064@kernel.crashing.org>
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
 <docs@lists.yoctoproject.org>; Tue, 12 May 2026 14:14:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9463

On Mon, 11 May 2026, Mark Hatle wrote:

>
>
> On 5/11/26 12:04 PM, Robert P. J. Day wrote:
> >
> > Here:
> >
> >    https://docs.yoctoproject.org/ref-manual/classes.html#github-releases
> >
> > there's a short, sweet explanation of "github-releases." This morning,
> > for the first time, I created a recipe that tried to fetch assets from
> > a *private* GitHub repository, which failed in just the way you would
> > expect -- "Failed to fetch URL ...". (I had not been warned it was
> > private.)
> >
> >    So I went looking for the proper(?) way to define credentials or
> > authentication for that, and I ran across all sorts of suggestions. I
> > eventually ended up here:
> >
> > https://lists.yoctoproject.org/g/yocto/topic/bitbake_fetch_private_github/115408881
> >
> > so I thought I would just ask -- is there a YP-approved way to do
> > this, and should it be covered in the docs? Because as it stands, the
> > current explanation does not warn the reader of the extra complexity
> > when private repos are involved.
>
> I use private repositories on github for a bunch of things.  Using a PAT, you
> can simply tell the credentials for git.
>
> Specifically something like:
>
> .gitconfig:
>
> ...
>
> [credential]
>    helper = store
>
> [credential "https://github.com"]
>    username = <user>
>    helper = "!f() { echo \"username=$(git config user.name)\" ; echo
> \"password=<pat>\"; }; f"
>
>
>
> The above of course sets _ALL_ github.com connects to the same PAT, and also
> stores the PAT in plain text.  So be sure to set it user read-only.
>
> (There are additional settings you can make so this configuration only applies
> to a specific director.  See includeIf and gitdir.
>
> Doing it this way avoid ANY changes to bitbake/openembedded and/or layers.
> Git itself handles all of the credential issues.  (There are ways to use a
> more secret credential handler as well, but the above is what I do.)
>
> So IMHO, our recommended best practice is do not hardcode ANY credentials into
> URLs or bitbake, recipes, etc.  Instead (for git at least) use the credential
> system it already has to do the work behind bitbake/OE's back.

  I don't think this answers my question, which was how one would use
the "github-releases" class to fetch release assets from a private GH
repository, given that that fetching is done using "wget", so it's
adding authentication to the wget command that would seem to be
necessary here, no? Everything you wrote above relates to Git.

  In my searches yesterday, a number of recommendations suggested the
need to define "FETCHCMD_wget" to do this: here's one I mentioned:

https://lists.yoctoproject.org/g/yocto/topic/bitbake_fetch_private_github/115408881

Or am I completely misunderstanding what you wrote?

rday

