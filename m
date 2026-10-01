Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B78CA5FCC
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:04:58 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9555.1790856297207444112
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Oct 2026 05:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=snp3Mkq5;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GQZn6nWcsTElJ3gCetEq6oMox+G0u77QWzyoP1efXpY=; b=snp3Mkq5hXfpMJAHf6Dfv5OMod
	e6Xq1gbzPENqQ8ORkHJpZHQaxvmfXUg+8yyc6KQuDtMnnoXwV4155yjzs+8JwAFMwhaM0DwbOoxNR
	h/joAi7gcwKsW1xw1PpM2o6ls4fedCZKYE+amRfov94tb1AWKpvXRb6SlO2eyCRDzkghLnBUeUMio
	epDz1r1dhYT6L+FhBNHH9/I7OaIPlPguSy0HBdEcA1hciWmFDMTlHs/5v3MSGS9ur+i83q0BaE57y
	VXOjlik0juq0sEMNWSyLScedh3WzviBdu4t7fdXOYrrPHfHo+6m5Si2/x6aTN2aoUMOJdCwufnvPa
	yrSd7tVw==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:42512 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1xCFWu-00000002R8b-1XmG
	for docs@lists.yoctoproject.org;
	Thu, 01 Oct 2026 08:04:55 -0400
Date: Thu, 1 Oct 2026 08:02:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: where to explain difference between .wks and wks.in file?
Message-ID: <ca707b47-08aa-4cd4-97aa-070f0d515008@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 01 Oct 2026 12:04:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10645


  it seems there should be at least a paragraph or two explaining the
difference between .wks and .wks.in files, but should that go here?

https://docs.yoctoproject.org/dev-manual/wic.html

or here?

https://docs.yoctoproject.org/ref-manual/kickstart.html

rday

