Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEB8CCD1BE
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 21:42:47 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.6454.1761169358207763083
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 14:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=gMFNOZg0;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Bdj3X+9A+XXidhXlWJXh8FlbPVIJkCkaxOs6JMrkm8s=; b=gMFNOZg0ci85BDUyKQGO3N3UmB
	ZRAjpDLLVkaVP0DD9TQwEf6QZjO73uE1Ueb8rjYACcohk5vj4JNTCIIue2niHO7fSfWVwqxk+O420
	ahg1nzvhLgg2xL2KUn7miI4Sem7d6mDaPGRwx4FI67Lp3ToF65/RaO6iDr1t2hVMnF5ocGXeZmh07
	y7N+k2txjmCoiFaJ93SD81sbP19VVVEiqsJsDJzR+GqnmhHjDTw6mOHqI/P8kp8F0sfbSvhzoMl9L
	f66lRVBPysf/ktZJmqi7tdV3GCUl08LjwBNbLmvAbRgvx8cHYq47sOsQIAZkwOzdjD33aq3UiEz/f
	53eofnpg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:33042 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vBgbJ-0000000AA2V-2wHk
	for docs@lists.yoctoproject.org;
	Wed, 22 Oct 2025 17:42:36 -0400
Date: Wed, 22 Oct 2025 17:45:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: where is the "ECOSYSTEM" tab on the YP home page?
Message-ID: <3f870a18-887d-bc8d-6243-8c84a6e9af09@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-792431922-1761169509=:776817"
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
 <docs@lists.yoctoproject.org>; Wed, 22 Oct 2025 21:42:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7781

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-792431922-1761169509=:776817
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


  from:

https://docs.yoctoproject.org/overview-manual/yp-intro.html

"For a look at the Yocto Project community and the companies involved
with the Yocto Project, see the “COMMUNITY” and “ECOSYSTEM” tabs on
the Yocto Project home page."

  i don't see an "ECOSYSTEM" tab ... am i just missing it?

rday
--8323329-792431922-1761169509=:776817--

