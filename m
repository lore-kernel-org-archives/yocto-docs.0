Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB231CD4F24
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 14:55:53 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77406.1778597745956767995
 for <docs@lists.yoctoproject.org>;
 Tue, 12 May 2026 07:55:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=g933CWpw;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JVnQJ+6x3Quk9Y+LonRUvE1K11hMT8Ucvyko5KW9k+g=; b=g933CWpwPbN9r2iaGxv+CQDlxA
	TN8BZYizRTO8PV6CSwqIHb5WsfGkd5JmxYwXxiRhNzGqJGpTFGVcAfelhw5pfZP1RzeEFW/LYC1DI
	H+kW03QnEgE6z/1yvYeunfIXvaKFfEQ6E/Tp+nBzCbq2Jg04gSZecFgoTZP7/40tf8QMvWKNcnFRC
	H709tewLtVLTf6HcFtBJA4Epm99SBoBya03paT6Ydlb7DUd1/LTbmRLV3M31vtI3eIYJkgQC8GWeo
	WPk+zN2Zm6hmMwIHSFiogt5EM4Byd6RE7Vxr4e1DRO9ieH6TfyWXlF+iDlq0zHzT0+LHMdqEA3N5E
	31xYppSA==;
Received: from [147.129.179.166] (port=39766 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wMoWN-00000007vd0-0fWv;
	Tue, 12 May 2026 10:55:44 -0400
Date: Tue, 12 May 2026 10:58:44 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
cc: docs@lists.yoctoproject.org
Subject: Re: [docs] Should explanation of "github-releases" class cover
 private assets?
In-Reply-To: <6a31c698-d177-4073-8775-5090f510fc2e@kernel.crashing.org>
Message-ID: <4ff9f80f-df7a-3ca7-0664-4ce05345b74f@crashcourse.ca>
References: <f3b7de9b-a40c-5638-7d5b-d7004f987b02@crashcourse.ca> <75217d92-e0ba-44da-8447-b51c0edf0064@kernel.crashing.org> <6dd1b142-0f22-a231-9aae-8a2a70ec2de4@crashcourse.ca> <6a31c698-d177-4073-8775-5090f510fc2e@kernel.crashing.org>
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
 <docs@lists.yoctoproject.org>; Tue, 12 May 2026 14:55:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9465

On Tue, 12 May 2026, Mark Hatle wrote:

>
>
> On 5/12/26 9:14 AM, Robert P. J. Day wrote:
> > On Mon, 11 May 2026, Mark Hatle wrote:
> >
> > >
> > >
> > > On 5/11/26 12:04 PM, Robert P. J. Day wrote:
> > > >
> > > > Here:
> > > >
> > > >     https://docs.yoctoproject.org/ref-manual/classes.html#github-releases
> > > >
> > > > there's a short, sweet explanation of "github-releases." This morning,
> > > > for the first time, I created a recipe that tried to fetch assets from
> > > > a *private* GitHub repository, which failed in just the way you would
> > > > expect -- "Failed to fetch URL ...". (I had not been warned it was
> > > > private.)
> > > >
> > > >     So I went looking for the proper(?) way to define credentials or
> > > > authentication for that, and I ran across all sorts of suggestions. I
> > > > eventually ended up here:
> > > >
> > > > https://lists.yoctoproject.org/g/yocto/topic/bitbake_fetch_private_github/115408881
> > > >
> > > > so I thought I would just ask -- is there a YP-approved way to do
> > > > this, and should it be covered in the docs? Because as it stands, the
> > > > current explanation does not warn the reader of the extra complexity
> > > > when private repos are involved.
> > >
> > > I use private repositories on github for a bunch of things.  Using a PAT,
> > > you
> > > can simply tell the credentials for git.
> > >
> > > Specifically something like:
> > >
> > > .gitconfig:
> > >
> > > ...
> > >
> > > [credential]
> > >     helper = store
> > >
> > > [credential "https://github.com"]
> > >     username = <user>
> > >     helper = "!f() { echo \"username=$(git config user.name)\" ; echo
> > > \"password=<pat>\"; }; f"
> > >
> > >
> > >
> > > The above of course sets _ALL_ github.com connects to the same PAT, and
> > > also
> > > stores the PAT in plain text.  So be sure to set it user read-only.
> > >
> > > (There are additional settings you can make so this configuration only
> > > applies
> > > to a specific director.  See includeIf and gitdir.
> > >
> > > Doing it this way avoid ANY changes to bitbake/openembedded and/or layers.
> > > Git itself handles all of the credential issues.  (There are ways to use a
> > > more secret credential handler as well, but the above is what I do.)
> > >
> > > So IMHO, our recommended best practice is do not hardcode ANY credentials
> > > into
> > > URLs or bitbake, recipes, etc.  Instead (for git at least) use the
> > > credential
> > > system it already has to do the work behind bitbake/OE's back.
> >
> >    I don't think this answers my question, which was how one would use
> > the "github-releases" class to fetch release assets from a private GH
> > repository, given that that fetching is done using "wget", so it's
> > adding authentication to the wget command that would seem to be
> > necessary here, no? Everything you wrote above relates to Git.
>
> Sorry, I misunderstood the question.  I thought this was using git
> and github to fetch things.
>
> My answer would simply be "don't".  If you use private repositories,
> don't use the release feature of github unless you are manually
> pulling down the software.  I don't think it's appropriate for us to
> incorporate github specific credential management (the referenced
> patch in the earlier email) into OE. Hacking wget, curl or anything
> else for their private usage workflows seems like just signing
> ourselves up for additional maintenance burden.
>
> I know, probably not what you want.

  No, that's perfectly fine, it makes it easier for me to say, "We
really don't want to do it that way."

  Thanks for all that other info, though, I'm keeping a copy of all of
it.

rday

