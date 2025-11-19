Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DCBCF31AB
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 11:25:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4424.1763551517628856387
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 03:25:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=HC31rko3;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qtC/eac7Y8Dnbi5zwgLj2kMh6WpDE5f5amQvtCK/g44=; b=HC31rko3Sve3Vx75XBYNk8wdfS
	P1OlQgwT5+XrGRNu1BjeRFNTvxUn+HtOTyyP/hpNLCr+B0874ppFC0PIF/N2Z2Zge+s1Ifqsb2n67
	fAn0bJoTYhJHZW4Ri3/EebzunVKcKaT0A+4o8UYRt5RAj8vt3MmC4YOucVrkwYEz43tMSbpsvWFG5
	wT6u5LTsH1OJpsBA0h0n1wRAGKw8708nTe4oUR0bZOhQEQI86JlTIy5mLpYV8NOs/G8kXORrcqTyv
	vPNyzEEQD573aWmpHN7A34WQwjyIqcfi5Icqd4vbMm8yCetUBUBGXAwcSG0ABT8ziQHck4PsGTmxC
	KUDDtWxg==;
Received: from [147.129.179.166] (port=59276 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vLgJC-00000002raf-2eo6
	for docs@lists.yoctoproject.org;
	Wed, 19 Nov 2025 06:25:16 -0500
Date: Wed, 19 Nov 2025 06:25:50 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: can the assumption of building on ubuntu be relaxed to debian?
Message-ID: <24bb11b9-85c3-9dc8-e655-b630dbbcbe9d@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 11:25:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8076


  i ask this only because i recently moved off of ubuntu and onto
generic debian 13 ("trixie").

here:

  https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/

one reads in that initial note:

"The examples in this paper assume you are using a native Linux system
running a recent Ubuntu Linux distribution."

  would it be unreasonable to expand that to include debian and
debian-derived distributions, rather than restrict it to ubuntu?
implying that one should be running ubuntu seems to be giving an
unfair advantage to canonical.

rday


