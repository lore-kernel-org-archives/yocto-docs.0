Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771ACD44C70
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 15:55:34 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39234.1768492528028157198
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 07:55:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=jPi2fYtH;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dbiJXAH3521cBRGUu/mF+pRlcpG/G2+W37y/7s4JYgI=; b=jPi2fYtHKNeIKOansohDPg2bBU
	NF1S3hSEtJzVcr6gKF5WyisiDDZmD/tzTGIwPo5U8bHtL23JrmJBSWuBJ3H6zVeHfYcMyht7Z+HTi
	XKJa55BHriwGTkFg1WLhXolTcuAsSJYVNfRbewZAtkU0P+a06yVZRPAg2p1+t8VpljVFHX4yxFsqq
	BOVv22r0wM0tEmyn+JmHOlEI0YyroCDOh4d9oq0pKUiXtvh3sb3qm85G8I3vt5qP0qFwsMZfYlOEj
	Lo6+qAfPzDDuSSeSuVI4zHFkykQdAIA9s2lc849cMLHtEy2SQe6vQqHetCPl1Dn7S7NDSFZpnn6Ha
	UsALjCbg==;
Received: from [147.129.179.166] (port=49924 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vgPh0-00000009om3-3uFn;
	Thu, 15 Jan 2026 10:55:26 -0500
Date: Thu, 15 Jan 2026 10:58:56 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] is there any way to render content in italics in a code
 block?
In-Reply-To: <78dfab73-8d58-4cbd-b452-d34c1cc14ae4@cherry.de>
Message-ID: <38b9c8b4-84d7-ad15-5bcd-ca16d06b5c20@crashcourse.ca>
References: <5eef4c2b-95ae-cc22-b44c-a03e29982c79@crashcourse.ca> <78dfab73-8d58-4cbd-b452-d34c1cc14ae4@cherry.de>
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
 <docs@lists.yoctoproject.org>; Thu, 15 Jan 2026 15:55:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8575

On Thu, 15 Jan 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 1/8/26 10:33 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    one aspect of sphinx that gripes my wagger is that there does not
> > seem to be any easy way to tag something in italics in a code block.
> >
> > here:
> >
> > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html
> >
> > the code line:
> >
> >   $ bitbake target
> >
> > really needs the word "target" in italics to show that it's meant to
> > be replaced. and, no, this isn't minor nitpicking -- the whole section
> > on overrides desperately needs to be able to show what things a
> > developer is meant to replace.
> >
> >    is there any way to do this?
> >
>
> Not that I know of.
>
> Another option is to follow conventions from manpages for example or something
> people are most familiar with.
>
> bitbake [target]...
>
> maybe? I'm not versed in manpages.
>
> Also, you can simply specify after the code-block what must be changed by the
> user. It doesn't *have* to be a technical solution.
>
> code-blocks have :emphasize-lines: maybe there's room for adding
> emphasize-columns or something like that such that we can specify what to
> highlight in a line.

  there is (sort of) a way to do this, it's with a "parsed-literal"
block, not a "code-block"

.. parsed-literal::
   ... stuff ...

- for italics, surround text with one asterisk
- for bold, surround text with two asterisks

my only nitpick is that what is rendered in italics also looks bolded.
anyway, probably not worth agonizing over this.

rday

