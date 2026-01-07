Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DE4CFD642
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 14:12:46 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6677.1767795164272687881
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 06:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=C8Cm1Sjf;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zj/TwVl/avqzQFvXnvFmX8yclPVYsx+OvBNGrR7mtR8=; b=C8Cm1SjfyBPvvs47Ka7xR1fMgW
	9pTo8GOIphh6Hg5H20sjpGsWUv15Tu+TsWKXRyNs9G/WtJKE9u1CmbRODQk8OiOMF0TNolg5uRDSk
	fI8h/QtODBIQKVlMSxAcnH0CPgRvQe30VLBPOT7lAF3VTooMAfSq7nXrht61K02olfhg18sWWSJcp
	x2+J2c25F/C2zSo4UpvxXy4N8tA12Kej2n7GZNzU/Q/x/MNmIhcqXzoq1JiDT4gu2ITZN9cp2+nDe
	10/d7dLFmqUqDzYXuZE8wMs1n9ndQpYL6lOo82RsdXoPWzNaiSlFgOUmZSoESFXEAkLb+X84kcjDq
	3VQhHRmw==;
Received: from [147.129.179.166] (port=56164 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vdUHC-0000000FUuW-15Ht
	for docs@lists.yoctoproject.org;
	Wed, 07 Jan 2026 09:12:42 -0500
Date: Wed, 7 Jan 2026 09:15:36 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: BB manual: improving the explanation of BB_NUMBER_THREADS?
Message-ID: <73a7be8f-a940-fc40-6a46-77d76cdf582c@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 14:12:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8408


  (i'm just killing some time this morning reviewing docs.)

here:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html

i think the explanation of BB_NUMBER_THREADS could use a couple
improvements.

  first, the way it's explained, a new reader might think that they
must run off and set that variable to get that parallelism, when we
all know that OE's bitbake.conf file already handles that for them:

  BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"

so a more useful explanation might be that the reader might want to
set that *if* it's not already being done for them somewhere.

  more importantly, from experience, i think it's useful to suggest
that the developer might want to *reduce* parallelism to prevent a
build from overwhelming their build system. that is, sometimes, maxing
out your parallelism is exactly what you *don't* want to do.

  thoughts?

rday

