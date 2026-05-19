Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E280FCD4F54
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 19:45:44 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7490.1779219940527922726
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2026 12:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=hNFxpFHh;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gImqFFctpGuFJb3fmF2B+ogIr5FuHE3yEamyCFXUJC0=; b=hNFxpFHhwLAE3ynWdgsigtjm/k
	qsRBeQhfg8Lk7A5PMc80iOJ9rNShhsOx+5VJj43QFc3fPswxL+CdXQ0HUAeuCHhlnUHXcO/TQ9oQc
	YFX05J39dnY7O7UY5v/266ItrGrY4KQT9+qKMlmDykAEK3/wX95dh7koj5szCEjzLHO+Zala1Cq1e
	UYmBliGwiJXCLnAYoFNGFTRtOvbHLX2wCRnO4Y88Q9PPwvhMyOGz7rVFO3bJLLLmy9nM0dEAJXb07
	YMeyOWHE39Bf/IEmSYVRi877ohUKvbd0jd+MM4dKgGG24tjy8d/3FBIupuTF2q7IJBGxV3XpAEibz
	VrKx94pw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:33232 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wPQNg-00000009kt5-3Y6s
	for docs@lists.yoctoproject.org;
	Tue, 19 May 2026 15:45:38 -0400
Date: Tue, 19 May 2026 15:48:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Should references to a layer's "README" file be to "README.md"?
Message-ID: <90f0753b-b678-fdf9-1d05-4c6604c751ee@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 19:45:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9497


Here in the BSP guide:

https://docs.yoctoproject.org/bsp-guide/bsp.html#readme-file

the reference is to a top-level README file, but it seems that pretty
much everyone has moved to README.md. Should that be updated? Should
it include references to both files?

rday

