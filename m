Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC3ACD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 12:52:58 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18865.1781787177635059999
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Jun 2026 05:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=joYUc6QE;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1D330d3skqYMLpa0yWDQ675QG2VTbiY/6koMYPWcWvA=; b=joYUc6QEATERXJ44pmoZFWicfz
	PZyn9nw/F99aRfqHUg3czUmDyZ3AFWyhMH1D/t5BVk7QHy4AGSMvKhYoz374Y2bY1N3HHyiTyipb4
	cM33iS+opWQgiJ+IVWfnR7/MEDtbdX02Ybz0mFPygMXBi8oo09KD8IenkKuFfWg407V50A8bMLCxB
	Ocasw8M/TQAAKJ9+95v3XLLXyPXD8rjTgv6C07MXvOWWCG9NOCPJqzP5inPjmm/CuFj02QU7uuQhV
	MOTeaBzHam5LVamlCy/xWMVHq1/dAX0cgc859u65v58gkwsc9K/4UyqjXZleutEBHIPhQ7vwl802U
	5Mr9PpvQ==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:41922 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1waCEp-00000000CaX-3449
	for docs@lists.yoctoproject.org;
	Thu, 18 Jun 2026 08:52:56 -0400
Date: Thu, 18 Jun 2026 08:52:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should the security manual mention the meta-exein layer?
Message-ID: <45d7a560-e62b-df1f-f206-33535234e974@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 18 Jun 2026 12:52:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9780


  looking at this section in the security manual:

https://docs.yoctoproject.org/security-manual/securing-images.html#tools-for-hardening-your-image

and it's awfully brief, simply referring the reader to the
comprehensive meta-security layer. but can/should that section be
extended to include other (possibly non-YP) layers?

  for example, here:

https://docs.yoctoproject.org/ref-manual/yocto-project-supported-features.html#primary-supported

the meta-exein layer is listed as "Primary Supported", so does that
mean it merits at least a mention? what about other YP-compatible
tools?

rday

