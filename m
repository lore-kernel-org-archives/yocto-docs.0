Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3620E9B370
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 12:22:34 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.159096.1772454152186450420
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 04:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=HlC99uzw;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UN3/r/tQx8xUthZP5RDLniRgmuzduNNAnm9D4QLafQg=; b=HlC99uzwtXWjlXtztuig/vR1Kj
	ktfnHIkQ16H2cZbsweGgLSWwOzkEsrsuL/XwlwRnISYutZUhC9hwlUvqSbfidj909ch49UKM6/0pL
	xmQuf9r5urc+RQaOi6W2QA3wP42T+EktWNEX5cHf8LybuU0TiEftlFWEB8lFOYYf8ddJL4Xy1VM4d
	0pmo4TyEayOMoWFyvgzkm2b8whiOSLGSys//2f+b/La+PGaUL3fjkissSrrgeSqGpNASt5XKyJFJL
	GbupIhQDfFZNKBNMeRV4q0p+N2UAZruDXhSbS7CII67VufaNpteof9h1K5N75N7tnMgL/ccCKgDSF
	06JlHqPA==;
Received: from [147.129.179.166] (port=55394 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vx2I9-0000000EiYY-1uBM
	for docs@lists.yoctoproject.org;
	Mon, 02 Mar 2026 07:22:30 -0500
Date: Mon, 2 Mar 2026 07:21:55 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should dynamic layers be documented other than as BBFILES_DYNAMIC?
Message-ID: <16cf1ee4-14bc-061c-dac3-3d3ee539cd64@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 12:22:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9040


  colleague asked about dynamic layers, went to point him at the
relevant part of the docs only to notice that it is not documented
anywhere in the main body of the docs, only via the BBFILES_DYNAMIC
variable in the variables glossary:

https://docs.yoctoproject.org/ref-manual/variables.html#term-BBFILES_DYNAMIC

  i don't care for the idea of the documentation of some feature being
restricted to a short entry in the reference material; IMNSHO, any
"reference" content should be brief and refer the reader to the
"official" explanation somewhere else in the documentation.

  if there was a "proper" place in the YP docs to cover dynamic
layers, where theoretically would that be?

rday


