Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF8BCAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 09:49:48 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.7332.1758793777786787134
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 02:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=N420ArAX;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hw83OUI9cphY7UPnHsxSMuDOFfx7LwM+V2pjZmb2dsc=; b=N420ArAXq1amhgqrCkze4/UKE6
	fchu7tBouzICUjl5Qgs1zfUIhpA2NPMCN+3I9u1MPOWU+MOqCinA3xynAeNE73c06LrG719WUoqrG
	6g3uzutnqGSiA6SylWpX6SlPOhMDL+THC2ZFoOMnI5Yb1DPf2oiY9rGypk/gA6eRLTnFE7UO0zI5V
	UuT0Sm+vPn35BdfP/EcTn/bnl6AEBkDnfzKYqIZl0le1VuZihurMSKvbS2PfCW7tc8U2v9Xun4w51
	Tqlkd007EXRRODlMmvYAttcAJcTQ8OSZGNnyJE5zia6LyWnbXQPHyfhs/81+d4a7weK4X3nD6ZgLm
	555q/2Cg==;
Received: from [147.129.179.166] (port=55126 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1v1ibW-0000000Eylm-1c2U;
	Thu, 25 Sep 2025 05:49:36 -0400
Date: Thu, 25 Sep 2025 05:50:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: adam.blank.g@gmail.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/2] kernel-dev/common.rst: fix the in-tree
 defconfig description
In-Reply-To: <DD1R4OC249CA.3QCJ0Q1LI5ELE@bootlin.com>
Message-ID: <cb1c11a2-ab24-b070-385b-9d3445da507f@crashcourse.ca>
References: <20250923121422.24593-1-adam.blank.g@gmail.com> <20250923121422.24593-2-adam.blank.g@gmail.com> <DD1R4OC249CA.3QCJ0Q1LI5ELE@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 09:49:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7596

On Thu, 25 Sep 2025, Antonin Godard via lists.yoctoproject.org wrote:

... snip ...

> And instead only have one:
>
>   If the build system detects a statement that identifies an
>   "out-of-tree" ``defconfig`` file, that statement will be overriden
>   by your :term:`KBUILD_DEFCONFIG` variable.

I dislike the order of this information -- rather than saying A "will
be overridden" by B, I prefer the more direct "B will take precedence
over A". But that's just me.

rday

