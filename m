Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C25CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 19:28:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.1966.1761334094304639356
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 12:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=RgQq8qNq;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TmGiQovEfrioM67HUQnwd9i4Vr4hgIRy7EVZmSmoyy4=; b=RgQq8qNqHM7rr6ZfTxr/z2r9HW
	sDeVYgtNIyDkSIZ8Azrb6kgVEUj5ynci2oRGtV1Ug8amlvdT06GoVaRbv1wKB/MJiyOJRb1fCk8H2
	uGbamt2p0F66SWCKK18J0Zy5Ps6l8n+x0vLtk9Pv5aL5UGlPPlNogqH3fEQBQ39MvvDhzh/SXWG2z
	niCEa/hl8QV5qXXcqXfcAHMQBo+Ue5jCvNWrH5IrnTragb5/XjD3Dz0k9pjlye1TRm80PBHzqmDNj
	HOX6ConYcs4Rl4TDucOO+HdCJ1rceCIKwP83hc+10KMAtHDXhmPmh3AVjAvwnC1xqHQfG+erNqKSc
	IKP8ZMKQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:46626 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vCNSK-0000000HKmc-2h7s
	for docs@lists.yoctoproject.org;
	Fri, 24 Oct 2025 15:28:12 -0400
Date: Fri, 24 Oct 2025 15:30:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] "https://git.yoctoproject.org/" versus
 "git://git.yoctoproject.org/"
In-Reply-To: <1871833A13E9D135.18865@lists.yoctoproject.org>
Message-ID: <5edc243b-6a95-a484-d5c8-00bdc45e40da@crashcourse.ca>
References: <1871833A13E9D135.18865@lists.yoctoproject.org>
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
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 19:28:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7839

On Fri, 24 Oct 2025, Robert P. J. Day wrote:

>
>   it seems that the docs bounce around between those two URLs for
> git cloning YP source ... should the docs standardize on one versus
> the other?

  i should have mentioned that the git:// protocol URL simply
redirects to the https:// protocol URL.

rday

