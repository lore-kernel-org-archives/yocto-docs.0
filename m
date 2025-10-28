Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3D1CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 10:34:07 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.5105.1761647646442497145
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 03:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=NN9h1C5e;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IaJ5W2+GhqW5qLSoGV6urckk6qd78f9VlG/JB2xiGxw=; b=NN9h1C5e2JCK2u13ZDkqSlGxko
	+1+lJJT48fih/afq+tHX8mgTFP2HxHjyY+WT8lYAWqoV9sN4Fp3I6P7olzzpyhmi5n18kHxxAc1dq
	C8subN4Q2YlmlKnGS2xPbSi8CKXlC90OFutjb46+dQf4MmtEyTLgkriwxJl5baRyMM9TcJvwiJd0y
	aIKLjBnT/KwJqlnUVaDXQCT6FEorluqPWfZ556JyPPx61eUzFjS3VeEAye+WjlkXO2XUoTdODZrG5
	nam4ZYvrFQ8BHRAEnwJ5gUrvLdR6dj6LcQlg190By6BjE0Zw4MSZtdHo6JKK2Rs5Q975LOtjWfWwW
	xfX2kECw==;
Received: from [147.129.179.166] (port=38024 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vDh1e-0000000CPWO-2Ddu
	for docs@lists.yoctoproject.org;
	Tue, 28 Oct 2025 06:34:05 -0400
Date: Tue, 28 Oct 2025 06:36:52 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: whatever happened with the notion of documenting dynamic layers?
Message-ID: <ec497032-eb7d-3aaf-ad59-7316b3bd6921@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 28 Oct 2025 10:34:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7878


  i recall someone mentioned that dynamic layers are currently not
documented in the YP docs.

