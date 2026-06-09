Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D896CD8CB2
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 17:19:46 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.932.1781025576538688405
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 10:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=YTIc2dQx;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XhsRsP8X+ySDWCJygHqsRSlIJr2mZ8iq0eJKJVAqVNo=; b=YTIc2dQx8gTxfVfYCNooDk8LJy
	SaHDxtGxKBiSx+YQYLz7rccxeoVALeNg5SXIJp4eh4yHU6xKlHQHwW/gP6TmNVFXZ1zP2wCdrdtc7
	O/KKDo+S72B4d6lK7XwYxORkqBTKSiYgMR1NXkdp4Kn9QFp9mQgOEzshU6uE9KGaa30Zgg9/WOocm
	4ibnt/KtAb3A6xBrUjR0cHLQNngK28nWSROVWFp2YVYduTeVsw4xw2h9WYiHANQAv406tWP0G/pxr
	2+zKg/94XdSSRmc1TaNqwICyQUyP1gc7FtHIwhnXZK1P9e+sh4QTrI6VIsJeNOej3PIb06CWFTKM2
	dGfJHcOA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:38228 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wX06v-00000006g3t-43ct
	for docs@lists.yoctoproject.org;
	Tue, 09 Jun 2026 13:19:35 -0400
Date: Tue, 9 Jun 2026 13:19:29 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: would anyone object to my updating "Adding a New Machine"?
Message-ID: <f9054c50-f201-80c3-3338-3003a5748d06@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 17:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9667


this section:

https://docs.yoctoproject.org/dev-manual/new-machine.html

is pretty out of date, using the "crownbay" as an example. any
interest in me updating it to refer to something current, perhaps
something rockchip like the orangepi-5-plus, which would show how a
top-level machine definition file recursively includes more and more
low-level files to fully define a machine?

  or is there some other modern machine definition that would be
a better example? or is it not worth the trouble?

rday

