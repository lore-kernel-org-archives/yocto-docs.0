Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E60CF318D
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 10:49:35 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3909.1763549374517488234
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 02:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=AAvjXSd9;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=t4Yg2b2v6KBiFO1j+CAqnMqQyV/NlmofFGjgW8gZ5wE=; b=AAvjXSd9Y6cOQL0NVFZSOaIXEX
	MaA7sUl8xlW/K51TDatNUqtmprLnOUz+wGhh8mlXDGwoeRqZH0x7/b1BVz63Nb/oJWYXjIrizO6fR
	i/yWtlBPwYTo7lOOTL1AlaJRaGkR0JWp7CBLfbf/tJurR4uW0A4meEPoeIRVnTFFf/F6Vnv9rKBpw
	A9oYqdBZNXoB787QL9xRc6bTzKXqtWwHD9NOLIUwhDYlaGZzKZ5aZjiHrzFN/76w79CxEg3pEwluZ
	NwW63T9/msvMTbEXnujlI5vTVxHqvyXSX8wPiICaLScA9tNobpn2JhnwbbKEl/QwSLyAQ4QerQxIZ
	AHB1QSWQ==;
Received: from [147.129.179.166] (port=41216 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vLfkd-00000002mc4-0m4x
	for docs@lists.yoctoproject.org;
	Wed, 19 Nov 2025 05:49:30 -0500
Date: Wed, 19 Nov 2025 05:49:56 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: first observations on YP quick build, bitbake-setup section
Message-ID: <9e6f88de-bd43-49ff-bcf1-aa2d912b9fb4@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 10:49:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8074


  (i don't know if the YP docs related to bitbake-setup are meant to
be kept in sync with the development code, or whether it's all just
going to be left until the end and updated all at once. so some of
these observations might already be on a "TO DO" list somewhere.)

  here:

https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/index.html#use-git-to-clone-bitbake-setup

one reads:

    Setup a build environment with the following command:

    $ ./bitbake/bin/bitbake-setup init

    By default, this will setup a top directory in $HOME/bitbake-builds.

that's not what happened with my test; the bitbake-builds directory
was instead created in my current working directory.

  is that one of the issues currently being addressed?

rday

