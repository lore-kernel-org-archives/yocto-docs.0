Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8310BCA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 10:16:08 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16929.1791195361978869282
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2026 03:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=vy66xQBV;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hLNcQ9YpRXDpaGbsH039Yp8gibb+Cg5i7nIB48V3VZA=; b=vy66xQBV1rEryv3HoseKziLWOi
	GLXApM5uHXeHw5pGBr9m/xU4fivc518Ffn3qUdVDSySr4cjw9Q0d8IbeUXr42DoFjI2pV+X7AkJXD
	LQ5PwOPNCoFP2apmPQj/F3E6kQVSCxhF+9GKiBU9awWlOAzxkjl8IWrrOJ4ikJqFUflsgwxiVP6I9
	J82ERlBNMo3kMTlWsFm2qQUslzmjRyu6ik+Hp8CBG4nEheUwi1rVy0WdDD9TPOW8GzaMy4MK9ZoKp
	T74uUkRkFH8lACTeKy+Pt2F2/0z5n2cZKvU5cbwEgFmIqZggF5dEVoGqVdm3AndY8XKnxVoK/SjpE
	/zYKw+wA==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:57612 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1xDfjj-0000000BvqD-00JZ
	for docs@lists.yoctoproject.org;
	Mon, 05 Oct 2026 06:15:59 -0400
Date: Mon, 5 Oct 2026 06:13:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: how comprehensive should docs explain IMAGE_FSTYPES w.r.t. "wic"?
Message-ID: <c27b6533-65f1-4a43-650f-374b25794466@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1706873747-1791195216=:4185973"
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
 <docs@lists.yoctoproject.org>; Mon, 05 Oct 2026 10:16:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10654

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1706873747-1791195216=:4185973
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


  here:

https://docs.yoctoproject.org/dev-manual/wic.html#requirements

the second last bullet point explains only adding "wic" to the
IMAGE_FSTYPES" variable:

"Include “wic” as part of the IMAGE_FSTYPES variable (from a
configuration file or in the image recipe)."

  obviously, though, there's lots of other possibilities, such as
"wic.bmap", "wic.zst", the various compressed file possibilities (xz,
bz2), "wic.qcow2", etc.

  should the docs cover at least some of those possible choices? i can
see having a new, short subsection (24.3) just covering this.
thoughts?

rday
--8323329-1706873747-1791195216=:4185973--

