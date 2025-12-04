Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DF8D2A537
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 20:34:40 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54176.1764880472586124489
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 12:34:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=z735vTrA;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EJNc8jlRXtc25imTq3o7UjpEsSalCR33edFwShEoWCc=; b=z735vTrAiWMLv49hu2Xiv0fnaY
	TKe4o4iTQGv30NXdw7T4D9xxALrfKX/oWVyEi1chQacxjnn5hpxpf71CBLA0p+7RN2jTVUx5IFcgk
	VdQjHPN1vELOcDxS1CJpsXczehQPZAScqGjAx2E/Ci++DJ8yx3/paJEkEB1vVBMOBricISYf2vSPB
	wePtXMDDmwl2cATZ0dltK73XjM7psuwznOg/b0hG0XKQr9+TMjkXjFY27yV/kpZOV1ZtAW1XSJ51W
	wc8EvVF/Z4C1rMHU5XTmTpoiEsDWoCOBvzXhrzHjeULP7wyYy4OGmmfVXIZZcq4iBoXoxuLEk06Ck
	ONNDwDuA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:57098 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vRG23-0000000HRe3-04DK
	for docs@lists.yoctoproject.org;
	Thu, 04 Dec 2025 15:34:31 -0500
Date: Thu, 4 Dec 2025 15:35:53 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: can we standardize on the spelling of "artifacts"?
Message-ID: <44d6bee4-c609-3f8c-e5e6-338fce4c2719@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 04 Dec 2025 20:34:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8223


  is it "artifacts" or "artefacts"?

rday

