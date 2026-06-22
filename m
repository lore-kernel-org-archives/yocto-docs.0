Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B67CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 09:11:01 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39062.1782119455353642545
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 02:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Vn9Saf4h;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Zi5jp+MKups9qkTt2THTniaYZN/IsBMrlYpBb2RcIx4=; b=Vn9Saf4huSkT46dO46ooMN52C+
	mjFUy5rK0VoPufHPgXyuWnt/T0F8/r9XU4PeiHmdOfY7Vg4Ni7mt/teCKBBYb/PrjttMtcysy4o+/
	0e92uaBNgRsTyHEvqJp5EmWm5pywEJzA/yDhjzzQWIZqDsnSJ7IxrfD0VZkUhhYhB5gkMAsgQusTd
	02kqAmD/6q7z7oHtA3vXX1y+wHeVV3buQu5tdzuN89dmnczN/c2xVnplJ9pePGkItZPglSj+MoTmV
	X0IAjwMBJBni8wGVA64D+qn6kRZ7z2QJi8CWh8Ssi70DndUBUPWRt5ydkz4J0vCsgVXhPqILKpenZ
	oujSabug==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:34950 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wbag8-0000000A1TR-1fc2;
	Mon, 22 Jun 2026 05:10:53 -0400
Date: Mon, 22 Jun 2026 05:10:43 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: small number of grammar/punctuation
 changes
In-Reply-To: <DJFFM3EIMKID.1C8YEFR1DJ2VD@bootlin.com>
Message-ID: <b30698f7-6859-e811-01d9-11bb7fdf0f9d@crashcourse.ca>
References: <1f016852-03ef-1792-c8ae-54d04f1c59ab@crashcourse.ca> <DJFFM3EIMKID.1C8YEFR1DJ2VD@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 09:11:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9827

On Mon, 22 Jun 2026, Antonin Godard via lists.yoctoproject.org wrote:

> Hi,
>
> I can't apply the patch, it seems broken:
>
>   Applying: ref-manual: small number of grammar/punctuation changes
>   Using index info to reconstruct a base tree...
>   error: patch failed: documentation/ref-manual/yocto-project-supported-features.rst:158
>   error: documentation/ref-manual/yocto-project-supported-features.rst: patch does not apply
>   error: Did you hand edit your patch?
>   It does not apply to blobs recorded in its index.
>   Patch failed at 0001 ref-manual: small number of grammar/punctuation changes
>
> Can you look into it?

  hmmmmm ... will check, sorry about that.

rday

