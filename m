Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6204DC5B549
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 07:58:04 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.44206.1748851075903696248
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 00:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=tmCuHtWJ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2BRKNx5QCZying4PKQIdl5EXMNHDNxAOCGEAYPy+GPo=; b=tmCuHtWJ8OoNrTJ7Xk1vsWnxHR
	3sn6BAV0TfcPbVHF/qD/W0M1p8s2KV2UixxCu5yrx2KeH4b5lAcAUk6zz3X5qecWln21ICwKsonGL
	V8QGNZr+Ex8TyjD/ght+ql7Kt9o38n7Pp0BaEC0M78XGJY2xtgr3QnmAyPBzuP/gnSCqXEMsXk3XD
	9AtpyCumeAeHhjZEzmMpHenWFE4kpVcEDj81jLNVax/U8Ydy1L3mfByTSpVTeVIAwAwYMttsxmQ1D
	6ihQdGLY77PO0zlCDQsTdiDfkhsoRiXmZHe9ZMO0licpterNODH3nmIiFkXKgHwpT4Kgy2LxcZx4r
	g9aGn2JA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:44410 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uM03L-0000000GUE7-1EFc
	for docs@lists.yoctoproject.org;
	Mon, 02 Jun 2025 03:57:53 -0400
Date: Mon, 2 Jun 2025 03:57:48 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: I think BB_NUMBER_THREADS explanation in bitbake manual is
 "backwards"
Message-ID: <c7121488-35ba-93c9-7734-d7e80165eba4@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 07:58:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6955


If you read the early note about BB_NUMBER_THREADS here:

https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-user-manual-execution.html

it advises the reader how to *maximize" execution parallelization by
cranking up that variable to match the number of processors. Except
that in the OE and poky layers, that's *already* maximized with the
use of (from bitbake.conf):

  # Default to setting automatically based on cpu count
  BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"

So that note is advising the reader to do what is already the default.
What is missing is the rationale for *decreasing* the value of
BB_NUMBER_THREADS, to dial back the load on the build system, which is
pretty much the only reason I ever use it.

In short, I think that note would be more useful if it simply
explained the purpose of BB_NUMBER_THREADS, that it is already
maximized by default, and suggest why you might want to *decrease* it.

Thoughts?

rday

