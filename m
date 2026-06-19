Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBEBCD98F6
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 21:27:44 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52221.1781904454191102730
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=r+UO1UIA;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o/TbRvSMqKf7duHBvjkXsCyHC/9qaEk5/AEbXvWw8l8=; b=r+UO1UIA3no2lcLKh1P2yUUuxc
	gh1IjdfcScQ5azRbqGRmxl60+EZsGX/moGGkqlhh9HUIVSyaMs6+bekcu8UlFUHnJ1+9IQFG79SEe
	V7OT5BerWF+nbBGBxzY3wmayXtS9xwGB3+Ga9kUYnkXVA/IUJidIGQa4fDTW2ieeCHs0/1D9j6RDV
	slsRZYNufLLUuiaCtkK6rnK+N75r+rOHSR3Vbu9G7+mx5PJ1SH8hyUD/oiAzps8NPH0J5REw8AENC
	bmyQRLum6AoKdDr7+okdCXMizqCBAw5aWW+KkiVRs8jfS7GYICaReDsNcJIrOmwf0bw79paCESRYA
	93Ti6YaQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:46968 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wagkN-00000003jLI-2Wh0
	for docs@lists.yoctoproject.org;
	Fri, 19 Jun 2026 17:27:32 -0400
Date: Fri, 19 Jun 2026 17:27:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: ubuntu/debian alleged doc-building packages seems inaccurate
Message-ID: <6a61c400-8774-ac15-4018-90bbd725cfe7@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 21:27:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9812


here:

https://docs.yoctoproject.org/ref-manual/system-requirements.html#ubuntu-and-debian

we are told:

  Here are the packages needed to build Project documentation manuals:

  sudo apt install git librsvg2-bin locales make python3-saneyaml
    python3-pip python3-venv

i've been building HTML docs all this time on my debian 13 system,
without:

  - python3-pip
  - python3-saneyaml
  - python3-venv

also (as should be obvious), i refuse to install python3 packages via
"pip", choosing instead to install then as debian python3-* packages.
so far, it's working out fine.

rday

