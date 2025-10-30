Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC9ACCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 10:09:15 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.22934.1761818954796675259
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 03:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=gW8RJRP8;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KmNI4dlVCfuY2DWVqifm1bcrW0oEzeHenilP60Ltrx8=; b=gW8RJRP8GX+SJIKT62kNXOQHU3
	fHw9gKMpfIp/kjhwtKKperKh/N1yy0K8m2TBqiLuRS9bQ2Ac89iHUrhZ4iNRFORzsNkjhQUAwMHyd
	iQvWNO81JXGO+/qHA75Aqv26zS3oWsFJ1ysqpkjxmp5olRwLJ4zXWVw958gLj8PbYRvympW9Gwhs/
	n+s2YJBUaQYM0WaRt2LXDEDpoqhzdCJAkEJ70EF8srI/CZwMKeeUmiHL0uvLBaEcPvhKI/08xjYQq
	vrT+I9+TP+Ww2Um90KbpgJ9QghEpeIjpnA0NVMB5jlP2QaErcC8xunsfK6j8UeAthkvwEa7Yt/akH
	QFds6bPw==;
Received: from [147.129.179.166] (port=60580 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vEPag-00000001iwr-0YZr
	for docs@lists.yoctoproject.org;
	Thu, 30 Oct 2025 06:09:12 -0400
Date: Thu, 30 Oct 2025 06:12:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should YP docs somewhere explain EXPORT_FUNCTIONS?
Message-ID: <511ac4db-ae57-9a2b-0b6e-e94ca29003c9@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 10:09:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7912


  still reviewing docs and noticed that there is only a single
reference in the whole set (4.0.4 release notes) mentioning
EXPORT_FUNCTIONS, which takes us back to the issue of trying to keep
the YP and BB docs separate, since that feature *is* documented in the
bitbake user manual.

  so even if something is properly documented in the BB manual, should
it still be addressed somewhere in the YP manuals, even if only to
introduce it and provide a link? or is it the position that, once it's
covered in the BB manual, there is no further need of coverage in the
YP manuals?

rday

