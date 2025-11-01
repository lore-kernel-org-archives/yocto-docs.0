Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6476DCCFA00
	for <webhook@archiver.kernel.org>; Sat,  1 Nov 2025 18:46:05 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11746.1762022761427410552
 for <docs@lists.yoctoproject.org>;
 Sat, 01 Nov 2025 11:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=IE2mB1S/;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IDE1tirM+hmj1HAHkaEH3CQYz5mH93Gicdqd7UGXd6U=; b=IE2mB1S/xWLxT160kBJQh3g7pU
	zWFsKZgDL59PVI/40/ofHh2DgGOtzBDVdg9TsWgPNCjJHswXK4F6ySEMF4M8uYAut0kypeh9jlEDj
	AePTAvSW6sAle5nAI3YgQ2mEuNGWqMLvwg9xvE5nI+ZTctXc/a9HMFPPa0zK5kZPFGqPliijmLt+W
	N+/Zs0bf8XASKP06UeG4zojTw7/WjpEKVEmHtsEV4Ae3WGBKaMf4IddS/rRzZw1LlUxiSVa8De4ee
	Xed6g+8TJPqZW5iUT3TSVSuLPvLuB/GddpUyHVTsscKMm4UnU/8HEbMq7rw83flqYZkt7tAviqrOt
	6ao5aTMg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:46824 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vFGbr-0000000A9qZ-0iiR
	for docs@lists.yoctoproject.org;
	Sat, 01 Nov 2025 14:45:59 -0400
Date: Sat, 1 Nov 2025 14:45:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: out-of-date definition of WORKDIR in dev manual?
Message-ID: <9c98c5d1-a78f-7b03-cd5d-8481d26529e8@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sat, 01 Nov 2025 18:46:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7962


here:

https://docs.yoctoproject.org/dev-manual/temporary-source-code.html#finding-temporary-source-code

we read:

  The path to the work directory for the recipe (WORKDIR) is defined
  as follows:

  ${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}

actually, it is currently:

  BASE_WORKDIR ?= "${TMPDIR}/work"
  WORKDIR = "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"

i have no idea if/how that passage should be updated.

rday


