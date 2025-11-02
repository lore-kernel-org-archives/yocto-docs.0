Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A27CCF9E3
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 08:42:03 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6926.1762072918192363162
 for <docs@lists.yoctoproject.org>;
 Sun, 02 Nov 2025 01:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=T0tlbwKm;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ooOhDn0+yF0ZiYW67BxVyMqbZ1Ma2h6Rq6Ficla+8Yc=; b=T0tlbwKmXrGpSNL+GBjraiX3lH
	mTxMsoQJlHtDKFtIRxcr2tYnWvl8X3yUIiyfuceYgFvJhsAgBT8WV6QeUtRsjpieosyA7CjPqLyz0
	qVBcl+ZLYKWfaropIfHtRBBCIuPyprvwHmLjqh9kcVtAMF9x8GkT++BoUEMcNDUmL3e93/Dcoyitl
	JF6z7G7QPkuiuD8voI4vnAyjCMJTpnmfWz8e5RBvFDu+dC94nKDkAYDUEt0AOSilN61C7bIMg8w2t
	NzHqumKAcXLxUWGqD8e8nk5DXBmXDcHmdpK8kEHzBZBKFguuOIv716l74vWfSYCtZex/bhMTB77zn
	qEHO609g==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:59150 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vFTek-0000000C6Ec-3hge
	for docs@lists.yoctoproject.org;
	Sun, 02 Nov 2025 03:41:55 -0500
Date: Sun, 2 Nov 2025 03:40:56 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: can we list more modern links for "Making Images More Secure"?
Message-ID: <2c6f5f89-1a62-4ccb-e220-322a6c54fcf9@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 02 Nov 2025 08:42:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7963


here:

https://docs.yoctoproject.org/dev-manual/securing-images.html

the three links in the opening paragraph are seriously old -- 2014,
2012 and 2009. surely we can update that list.

rday


