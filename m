Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17554CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 21:38:37 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.6364.1761169115725406420
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 14:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Ud1f7Mlo;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C/BUdpAohRqI5Mobx/ANcKNEuo++YXkVNNxH7Hc/Jo4=; b=Ud1f7MloZfX4W7Z+zPV93NQ13W
	o/+uqxR+rH80cvLi56hy0+uJ6SJ9nD+yIfH+RDxhS4/EXRYAwZQkNn/uQXIwTjRB8VeO0gIVJBf7z
	YSXGVURXjs3sRLZ/3T3zWCMizvIpridU7yTZrFSNBVcN9PmVht8c7R81749agPtKYB1Vzn3DeRHpV
	PuqUQJCl7vAFuaoQa2mGTeQymlZXQEgw+6ZBTcZ173L+h6Kf1JLo0CEFdmHQifqeUc5A7AmMK49Ym
	1nA45X/9XQa4xbbFoZ6Iy1eCp/OZIINL2U9zBo/uTxCgPekc+vlpUoxPrdgK20Y9gMXrG84PN/ydE
	hMnwtqAA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:45150 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vBgXO-0000000A9Rf-0Rp5
	for docs@lists.yoctoproject.org;
	Wed, 22 Oct 2025 17:38:33 -0400
Date: Wed, 22 Oct 2025 17:41:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: "YP-Comptible" typo in overview manual diagram
Message-ID: <0a2abe51-a522-77dc-4da8-12a4978647fd@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 22 Oct 2025 21:38:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7780


https://docs.yoctoproject.org/overview-manual/yp-intro.html

  first diagram, "YP-Comptible Metadata"

rday

