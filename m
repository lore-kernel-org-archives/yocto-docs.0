Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B96DCCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 12:17:18 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.6928.1761653834738344862
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 05:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=uNNDxfoM;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=THzA6jSYViiMZTXn9usJIv/XuUQ2DWlmKZ5PHO2KQRs=; b=uNNDxfoMIcQYYpnSGIFL8NgkYL
	HiFyS5YcWoL4cPAdRzLJL2YrteFY+bTAInaHtiyg0J/tWPpOwwJmRKUeVqNlUg1ql6Tw1Oo8u3ljk
	ExVtPLfebpEXit5cmNCPuKo3HRppd7fRQ4aJ8JQ/CJSwttku0RwA0nitUaJL1X4aybc88Cg3tc52T
	Ph6DblfeiMfB8AGu05unE13j0usjCQzFB60/IjCDNDB0jWLYxDlvE4wPFGE24ccoxdAA2/Ljppb7+
	s5P1Ek38QY+Rm+4KxH9kKdtIX786ny2BslN6nVth0O/O+vTJR5cyHVWnO58WKt6T+xdU1HBephCwg
	HMiF+eNQ==;
Received: from [147.129.179.166] (port=40142 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vDidS-0000000CeNg-3r18
	for docs@lists.yoctoproject.org;
	Tue, 28 Oct 2025 08:17:13 -0400
Date: Tue, 28 Oct 2025 08:19:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: "bitbake-layers create-layer" section in dev manual is out of date
Message-ID: <fe1a3850-256c-824e-2c22-5f52d1a78dc0@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 28 Oct 2025 12:17:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7882


  not sure i'll have time to fire off a patch for this today, so if
anyone else wants to handle it, go wild.

  here:

https://docs.yoctoproject.org/dev/dev-manual/layers.html#creating-a-general-layer-using-the-bitbake-layers-script

there is no mention of the newer(?) options:

  --layerid
  --example-recipe-version
  --add-layer

rday

