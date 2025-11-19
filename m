Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C63CCF31B4
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 11:57:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4935.1763553436109167278
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 03:57:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=vybIXvBq;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NxVjp0ehBFJ/8nbMeSjEXyCRLCScn8+p63KxHUZ1N+8=; b=vybIXvBq54wc6IR6fgkf9SoER3
	AAkJ4sqYIWL45oz/CfWvMRMjYmHNHIhLp4jBnC6eeG7teT2PFlztz0ubGe2oGJpCO1i32DW+43ko4
	Vr7mLrTojkSrcIPBn1dtdaO7TrCJHvJExpn2qR0NGHVmb7f/SRQ9u5pSXTaVEarPbENu8ANY6Hy2g
	QN1OIIjN8Tp55SBZlGMY7DwJIaILO54Jb2qjxbfHywiATStjl+ENr0dSwDkZiEOxLx8F4hWlCrMDT
	CV17hoQmD3hTNjE8EdUhkxSttpdfGhWwjzoFBe5a410lQo8cx/J6i8IDbiphVXLnT0m9haxhjlf/j
	KeJlgwOA==;
Received: from [147.129.179.166] (port=46348 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vLgo8-00000002wBz-0mj7
	for docs@lists.yoctoproject.org;
	Wed, 19 Nov 2025 06:57:14 -0500
Date: Wed, 19 Nov 2025 06:57:44 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: super annoying pedantry: "setup" versus "set up"
Message-ID: <466761f6-d151-1638-ccca-714a3d23f209@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 11:57:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8079


  something that has always griped my wagger just a wee bit -- the
misuse of the word "setup" when it should be "set up".

  the word "setup" is defined invariably as a *noun*, while the verb
form should be to "set up" something:

  https://www.merriam-webster.com/dictionary/setup

i mention this only because there's a bunch of this in the quick start
guide. yes, it's picky, but that's what i do. :-)

rday

