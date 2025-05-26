Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5143CC54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 08:02:40 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.24458.1748246550835307910
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 01:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=gAx2x6pG;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8Pbdc7Zid9JuVFM6nd658OyIkndeCkC5lYzQpkAltoE=; b=gAx2x6pGuBI+wz2Oe1HU9q9xHr
	riJspq1ekmk5qi1XZw+0cHsnm0+4fyKETy5vH4x9jDx7fr2tqCJMVgIdGRG2N4j7h8cZpQjfvwbJE
	t1VZiIGNKH5XIZEShHiVAnMFq2q4FP5+U/tTat/8G/CpKyU0mSzAMC7DUWRLcURQAy5baEkXruvS/
	uEEJuiPtQazieI7RDxKCfPU6CCxpE6Fm39ktXyzTwyN81Hag9JUiSWa55XXsPo5W1g2udduutNxzl
	N7Tw/BBZUfijYi6qq9BqW4Y+d1tgY6wkkN9+Rg3ppIV2QqDactSVBLx+HeZRXla83eSKhqcehTnFx
	0wWoTaZg==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:43338 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uJSmv-00000009PJH-1HCw
	for docs@lists.yoctoproject.org;
	Mon, 26 May 2025 04:02:29 -0400
Date: Mon, 26 May 2025 04:02:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Is it worth adding a short section on "site.conf" to Quick Build
 page?
Message-ID: <e374fbf6-d472-2061-8a83-675cfc9fba30@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 08:02:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6917


  I think it would be useful in the Quick Build doc to add a short
(maybe two paragraph) section about using site.conf to cut down on
duplication.

  Say, just before this section:

https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#customizing-your-build-for-specific-hardware

a top-level section called:

  "How to minimize duplication with a site.conf file"

As that page discusses how the new developer needs to edit local.conf,
it would be useful to say something like "If you're going to do
multiple builds and find you're making the same changes in your
local.conf for each one, consider creating a central site.conf with
those common settings, and copy or symlink that file into each new
project."

  Or something like that. Not only would it speed things up, but it
would also make the new developer clarify what should be common across
all of their builds.

  Should maybe include a short list of the stuff that is typically
common, maybe ...

  - BB_NUMBER_THREADS
  - reference to local mirror
  - internal proxy settings

Thoughts?

rday

