Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544ECC83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 11:14:53 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.9985.1753355686700384077
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Jul 2025 04:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=lYrk5n6q;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a3cvYSZV68t7QsHS/PgaL/SqwWGIHLTajeanMx0fMaQ=; b=lYrk5n6qGaxPLDaJ+nX2hc/X91
	p7+Qo2rnS57Aj5O4NP0E8CpzzvBbaHUCoWX4acbY83ZXOKwHlQ99d9C7fUKWF0n2mUsiRIsvTeL5e
	SSFUMO2IqkOBGasU3Uo2oBZo2GV0pKi4liLb+d+Vxci2BQJr5tHW8PaNsCDExdFuDqsAKRgaa6USi
	QGozcm9BPM/rxVtnSoy08WhXt1bbhL5fRovu/9SrkG2AAi1ZX08IreFrNWsYnkgGulHx/mBNqi0cq
	FyHu5xaPHBfhUhO6PJsdM/o51donwcfYsi9ss4FwLlyZOBDz6LgMm/bUlnCZnrU1z8HOi3BVzhrOJ
	HENnDhPw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:44722 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uetuL-0000000Daz8-422U;
	Thu, 24 Jul 2025 07:14:45 -0400
Date: Thu, 24 Jul 2025 07:14:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] feature "EXPORT_FUNCTIONS" doesn't seem to be
 documented
In-Reply-To: <DBK8946R23RD.37VXXEBFMPA69@bootlin.com>
Message-ID: <3207f6c9-3cd1-0803-82ff-d8a39eb4ce6f@crashcourse.ca>
References: <2a3b6210-3c12-a83a-8dee-a82ab8ea970e@crashcourse.ca> <DBK8946R23RD.37VXXEBFMPA69@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Thu, 24 Jul 2025 11:14:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7375

On Thu, 24 Jul 2025, Antonin Godard via lists.yoctoproject.org wrote:

> On Thu Jul 24, 2025 at 12:40 PM CEST, Robert P. J. Day wrote:
> >
> >   seems important, where should it be covered?
>
> Hi,
>
> Take a look at:
>
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#flexible-inheritance-for-class-functions
>
> Creating a entry in the variable glossary and linking to this section above from
> the glossary would be great though. Would you like to send a patch?

  ah, i forgot to check the bitbake manual. i'll take a look and see
if a patch would be appropriate.

rday

