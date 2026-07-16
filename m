Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E567CC44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 13:05:33 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12448.1784207127230334223
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 06:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=m42TTFJJ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XlEgFZ+7kPjAwulYJaIrNvSrUJD75JlxF/CUK/9FXzE=; b=m42TTFJJsy1mTXa6xAHLerMX8Z
	szQJZ9VTirPsab2G4+7BA/Evo77uqAtTf7kmNwxptlJJTyAa7QEr0Z6dIyzfz5wNPevPTi4YSpplg
	l75r/OXbcEpSI3b+cD5HluDKrMr92cu28jT7jcWbz0zZY5OL1rua9ZqYbr6XrUc4r4P2nvxFzYypy
	beSuxSBCG/2iJ3cfh893zlG+3jHLKXzuHvIk9+e5hOgrwEc3/t/UIsZcTX4JvEutVHpwPT+iW3acd
	K8apzncR7anZeylUyfps0zycTucMuw1Ufyd3VMIL2Zg+6H4aYwpw/AgMDYaz/HvAs1Ico244CULRN
	wFY2sT0A==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:57978 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wkLmH-00000000CLF-0O8e;
	Thu, 16 Jul 2026 09:05:26 -0400
Date: Thu, 16 Jul 2026 09:04:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] should "DISTRO_FEATURES_OVERRIDES" be in the variables
 glossary?
In-Reply-To: <DK00JUVWMZL6.BUFWJ5L3GVR8@bootlin.com>
Message-ID: <e23cc8fc-1e7a-bbb0-1751-1e9eef48b0a7@crashcourse.ca>
References: <4ed778f3-596c-11aa-d1f7-de8ee6370b52@crashcourse.ca> <DK00JUVWMZL6.BUFWJ5L3GVR8@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 13:05:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10091

On Thu, 16 Jul 2026, Antonin Godard wrote:

> Hi,
>
> On Mon Jul 13, 2026 at 4:27 PM CEST, Robert P. J. Day wrote:
> >
> > https://git.openembedded.org/openembedded-core/tree/meta/classes/distrooverrides.bbclass
> >
> > or is that too niche? i'd never even *seen* that variable before all
> > this poking around i've been doing.
>
> Not only DISTRO_FEATURES_OVERRIDES, but the class is also missing documentation
> in ref-manual/classes.rst. Patches welcome!

  ok, give me a couple days to make sure i understand it since it's
the first i recall ever running across it.

rday

