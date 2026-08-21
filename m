Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FD5C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 18:55:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1725.1787338519498216270
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Aug 2026 11:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=DHcNwvQr;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hDJAoR3N84aRho8KZub0hV1+J/rKpeKMtSvL7EBoJJA=; b=DHcNwvQrEoF4IiXIHjBIr9b0Qq
	TIRjXlZT+Pftwb5ANuvh3WlmHhvP1G6YmtxroEqDaRjWc24M6qYmyZtH4W2HWZGxKSHDIZ6TgFj6A
	C7TkqNPZ7H2k7wNsRCWUZHZogKL2b+OJif5S/DYjAzV1w7IWaue7nZPbmkJgTYaqfC/PTvg1usqsN
	yEkDo+qnyMSP/S0uTc2n1xMFzDeeUWJ02eEc3nG4SxnZjj+8WagqTg3aih51gdsMzbO3OlAA5SLJX
	YUp/lWauYLRVVMthU/xfyjxO6GcDgDeDjNUgEcLZj7G8jurfhq8+QG2xafXqUdmw2o6Zrjqwdjgsx
	GwCGfdUA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:37556 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wxUOa-00000003WH8-0KN6;
	Fri, 21 Aug 2026 14:55:17 -0400
Date: Fri, 21 Aug 2026 14:53:43 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] should yoctoproject URLs use consistent protocols?
In-Reply-To: <b88a17fb-95f5-47e0-bebf-6fc22da64ced@cherry.de>
Message-ID: <b4e9ba6b-8b4c-527a-669f-7223fbf13ba5@crashcourse.ca>
References: <dfa91d03-3aa0-bf09-75e2-a5ed2825a937@crashcourse.ca> <b88a17fb-95f5-47e0-bebf-6fc22da64ced@cherry.de>
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
 <docs@lists.yoctoproject.org>; Fri, 21 Aug 2026 18:55:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10319

On Fri, 21 Aug 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 8/21/26 6:22 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    just noticed that the docs files bounce around between:
> >
> >    - https://git.yoctoproject.org/...
> >    - git://git.yoctoproject.org/...
> >
>
> We don't support the git protocol anymore as far as I remember, so
> we should definitely update those to use https instead. Please check
> before sending patches, I cannot do it right now myself as I'm
> traveling.

  i'll submit a first pass and handle feedback. my assumption is that
it will be a pretty straightforward textual substitution.

rday

