Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387CCD2A532
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 20:57:50 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54496.1764881861480881494
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 12:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Rgqu4FP5;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8crO1psAp40fQUP3bqrjVjvGwirtB42I4fixs6mjYkw=; b=Rgqu4FP5TnpF756qxIjD0omCud
	w3Q21ayGpf4nf4UrVUrEL8sw9AN6u6RizSvID6E31zISs0yOkE/pGfaw4nXIZEdvyFDEz0qc6e7cC
	EqOQsRcZqS6ZYnDdF69UZFJvkGsExHcDK/txFt7lg3ff2fWMDFNZaHZPM19TSLaaD13KzxSgYTaXA
	JfQE/mAAXl/RpavSgGtW+C8/YedGOu4nY1vA1Jj+vMS26obuDWQg9HEGvdTazvVyayOe7VQe8JCOA
	Pjw4TpBiqRNLR2VjwPC2uXHqk7rT1TRLZDz7eWGD1JagXI2wo7/MP/mIxPFVJp4t5dShC/COpxO96
	F6EYt0zQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:58160 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vRGOR-0000000HV9d-1NMh;
	Thu, 04 Dec 2025 15:57:40 -0500
Date: Thu, 4 Dec 2025 15:59:00 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] can we standardize on the spelling of "artifacts"?
In-Reply-To: <CANNYZj-vDD6i0hZFxnhszKYCMFofnwU8yRQoTJcz-6ohntoL6Q@mail.gmail.com>
Message-ID: <08b4e3c5-7fe3-4868-752e-3c2ced0e90b6@crashcourse.ca>
References: <44d6bee4-c609-3f8c-e5e6-338fce4c2719@crashcourse.ca> <CANNYZj-vDD6i0hZFxnhszKYCMFofnwU8yRQoTJcz-6ohntoL6Q@mail.gmail.com>
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
 <docs@lists.yoctoproject.org>; Thu, 04 Dec 2025 20:57:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8225

On Thu, 4 Dec 2025, Alexander Kanavin wrote:

> On Thu, 4 Dec 2025 at 21:34, Robert P. J. Day via
> lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> wrote:
> >   is it "artifacts" or "artefacts"?
>
> We can accept that either is ok? Why is there a need to standardize on
> one, and then waste energy correcting people and patches? I won't be
> able to remember the 'correct' option either, fwiw.

  fair enough.

rday

