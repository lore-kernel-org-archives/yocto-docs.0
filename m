Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17129.1794307547347877671
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Nov 2026 02:45:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=NnrudSdh;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ch9cT3neIWpb8dsKOreOBpik9kWGJXD3e6iRaPhzVNk=; b=NnrudSdh0YDnJWkkO1MBaqiigV
	48GanWqaKfCrBV/Lj9cxjv8B2SjynaDKA0hY5ADQWKMNVGtT5WzXCKpUmUuRlRA8jnaGftFgZVMnq
	jMeN2kbM79fIvHZmESaGFzgSdysuq5VdPiWi2RPO32q7lyfUv9F8lZhOAx1RfKFfCpRfaAniwhitx
	OTBM609cMmO0aDuDkEUpL2kPU5EGZYtsk+6uIc0laEW1q69EvcLrytJ96+jqtHcj463NBE5AWZJ61
	N+8BZtFMYs/KLjgM/bigQJT8tUgOdjrGTREOj1fYh5dMVNkadDDVbLMyhwmcRyh9mgNSWbBAn8X3w
	A0mKbt2g==;
Received: from pool-174-114-108-188.cpe.net.cable.rogers.com ([174.114.108.188]:50408 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1xQjMG-0000000DOoy-3p8B
	for docs@lists.yoctoproject.org;
	Tue, 10 Nov 2026 05:45:45 -0500
Date: Tue, 10 Nov 2026 05:44:30 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: i don't see my Oct 1 patch to add Wic as a term
Message-ID: <84f94b21-5909-704a-b3c6-52b474ff3ff7@crashcourse.ca>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 10 Nov 2026 10:45:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10785


  several weeks ago, i submitted a patch to add the "Wic" term to the
ref manual list of terms, and it was signed off:

  commit 05c97b48227f0e50d008d078b224aa537c06aada
  Author: Robert P. J. Day <rpjday@crashcourse.ca>
  Date:   Thu Oct 1 06:51:58 2026 -0400

    ref-manual: add a terms entry for Wic

    Add a short entry for Wic to the reference manual in order to later
    refer to it from other places in the docs.

    Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
    Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

but i just checked and don't see it in the official docs (should be
right after "Upstream")

https://docs.yoctoproject.org/ref-manual/terms.html#term-Upstream

  i can see that commit in the master branch. am i missing something?

rday


