Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE660CCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 14:54:57 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web01.23616.1761836096591870664
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 07:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=SkIbgVMH;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CqLt1+16ig1SbdXgFZlFd/CTb1VpA5abH8kPTv2PbqU=; b=SkIbgVMH3xuCUcFmqCw6+ccYTw
	ELHRLyGeKBCwQQX6fPu1rPeJ6eExi4tohYbNTgXfkfEoFTtqJHK1AZJclF+Id8Yd5gF0fbYEkmGLt
	HpVBHxILIYM2M65dYVQsJ+sLsYMt5JZQf7rMsh+HKgdn4gmNZTveh34ERfCc7HFb6voA3SVbbXlVw
	sMBvxv9jNopFP0UrKbCWJvm3zi1oIlrF7umECNavKN+K1nUJ9oGJhSLQPMpBrTui1d3UYpCVa5LZG
	pLMjnLm587T29COyLGczgQtuVik44YB0n2ymAb8nm7djPGWuhGoYJfhtb70ha+RLp36EL+ULaY1Gx
	oLX1kINw==;
Received: from [147.129.179.166] (port=52260 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vEU37-00000002YMK-23GD
	for docs@lists.yoctoproject.org;
	Thu, 30 Oct 2025 10:54:54 -0400
Date: Thu, 30 Oct 2025 10:57:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: is there any point covering versioning of pre-release packages?
Message-ID: <e68572a2-7c31-403d-caeb-a5a4abc9d9cb@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 14:54:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7920


  here:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#properly-versioning-pre-release-recipes

there's a discussion of using that "~rc1" approach to versioning
pre-release packages, but the one example shown there:

  irssi_0.8.16-rc1.bb

doesn't even use that anymore, and in all the layers i have checked
out, i can see a single example in the rpi layer:

  linux-firmware-rpidistro_git.bb:PV = "20240709-2~bpo12+1+rpt3"

that same irssi example is mentioned here as well:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#storing-and-naming-the-recipe

but that technique seems incredibly infrequent. is it still worth
covering? it just seems to break up the flow of that chapter to
discuss something the average developer may never, ever see.

rday



