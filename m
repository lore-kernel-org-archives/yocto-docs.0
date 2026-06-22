Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DF7CD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 19:34:49 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5194.1782156888888158030
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 12:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=hvJza6nQ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=S7vWyYfHgblEOzjJrcgS7VUjmDYsdp55bp5qV/qpGqQ=; b=hvJza6nQEWrvTacBD8pGahU64G
	ln5R39P2DDKQYx1vLdf9GrKHAgYU06sP+OCUW+YvtD7oDGXkgvDm2ZUPfy8gnH+yDOj0iAk9tr29s
	Bz5FeOxIWgqkpmC2SIm7dRQ2Owj/p5JdBoZ1wUTV3rO3c038kmL8n4Nng4mj/10Rc0HgTzIfIucmW
	ftxKd6OER4pJ9fZg+NJEZ3VhVFQKDgxqN50tLGsIAtePaHIF3nbJ1vwnkpXZ+r1Gza5QibV0J/wAk
	otBWR/SeeMWLLFf6QL5YSq+MX3I51c04ezHEtcWoFch9+fzKC78MTf7VsuiYa8H4hRkLjySgBOa7G
	HwXHdPXA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:40170 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wbkPt-0000000B917-2gKW
	for docs@lists.yoctoproject.org;
	Mon, 22 Jun 2026 15:34:47 -0400
Date: Mon, 22 Jun 2026 15:34:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should more entries be documented under meta/conf/?
Message-ID: <b5c0fc79-1ef3-48c2-885a-75c92402cea6@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 19:34:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9832


here:

https://docs.yoctoproject.org/ref-manual/structure.html#meta-conf

there are a few missing entries that might merit inclusion like:

  - fragments
  - templates
  - multiconfig

should any of those be added?

rday

