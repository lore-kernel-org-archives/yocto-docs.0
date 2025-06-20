Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52020C71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 09:05:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.3649.1750410318110782971
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 02:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=dvTCTfL/;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XoVcujmNdVyfSacLek3zxbmXY8Fg5N2wT7PwkkhODXw=; b=dvTCTfL/5+scuVO4pNia2j9sa/
	zt9nZzncxTOTVX6IRqhSD9CqSTh2AICNOv/2weAMeS+bPVdI1l72mLjpsMglGUp1iLXmTjEw1zOKJ
	b9GvVnoET+6TrP9E28PWwSoGVLSoti8cjEjfktc3C+mMg6+9xzIFGvUM1RwxNQofr/qLc7Wf0Broa
	lY0n73PhkVW0vO9ncqccAoZn+MNWkeDz5rWDREFSpZQSCCGzY6tW8YqYgwOTVoV3fte+6KJ4MLPYn
	MQR8ndSNxQKd9NPRptAXO6V2sZSosVEQ3sr6WgtnwQkF4MF+0wV8k8lOSSuu/jj0QGK9JkcWGwMOf
	ELMQ9xzg==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:44864 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uSXgQ-0000000GBma-2INt
	for docs@lists.yoctoproject.org;
	Fri, 20 Jun 2025 05:05:16 -0400
Date: Fri, 20 Jun 2025 05:05:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: dev manual inconsistently encourages changing "poky" checkout
 locally
Message-ID: <7da04e7f-11c4-819e-cd9b-7aaea55bd91d@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 20 Jun 2025 09:05:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7118


  while at least one of the other YP docs stresses to never, ever,
ever mess with your checkout of poky, the dev manual here:

https://docs.yoctoproject.org/dev-manual/start.html#cloning-the-poky-repository

  reads: "Your local repository of poky is identical to the upstream
  poky repository at the time from which it was cloned. As you work
  with the local branch, you can periodically use the git pull --rebase
  command to be sure you are up-to-date with the upstream branch."

that seems inconsistent. does that merit rewording?

rday


