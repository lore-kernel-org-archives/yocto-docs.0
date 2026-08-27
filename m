Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42B4C61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 11:48:44 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34226.1787831322547416787
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 04:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=RR1k+kvM;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8e3DzCzxDbb75F4eg43wx8HS+nP8FardTQI/U1mW9uU=; b=RR1k+kvMytFNu/v9OVT6X2zgFZ
	yrjDL+jdsnlhMeJWRN66e02Wja7VomDSvTvLxgj/HWawySHaaBnAuhzJgfk2uHa0/mqc50UdKeMRN
	Z4qQA1Hm+h9MVSxJCS0NwSoICOtRvfWemnhmtCo+Fokm9SyTx4NZsr0qBT9XDI7QOWpEW5jFGytPS
	xuLYIU7AU4Xpe5Upspm0YH/cj/vOfCvfkTMTCQGMFA8lglq6HqmBIUgKPLmlrq1vQATY0TY0IiW3I
	7R9LT0rmrVD3tZoZLGwK0+mE531XwR6uzRHW/k+fjLB0spgjRh6OUPWE3jAoUGeVsFDBSkz0xU+Xj
	3Gv+qOMg==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:45568 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wzYay-00000003qal-2bVV
	for docs@lists.yoctoproject.org;
	Thu, 27 Aug 2026 07:48:40 -0400
Date: Thu, 27 Aug 2026 07:46:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: standards.md suggests single quotes to render in italics
Message-ID: <7982abfb-7273-2df0-1aed-9709b4f26d57@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 11:48:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10380


i'm confused. here:

https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.md#n81

"Project names should be introduced with single quotes, to have them
rendered with an italic font ..."

  but aren't we using single asterisks to render in italics? or how is
one supposed to read this?

rday

