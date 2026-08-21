Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63281C5DF94
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 15:38:35 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10118.1787326712301385931
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Aug 2026 08:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=baWBjKVa;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZNHnMXUHv6VyR9wiKLr23fp6UuRS/FHbo9WFmyRQqTA=; b=baWBjKVaWeGj2YDv8zUkdlUU0d
	wtn9esOoeU5G+H/2LDIp/NkdURhgkxysvNgPWBOiyequ+Z7HQn6X7qfyZh5JhPav9Z5D/1TQTB6Rq
	6NA66OGg+5XGMfrkz7YdVFHpnvEDSihg1Wl3c9q8wykPHPY3VybLAqjwDVV1sJerhoBrnhpyvVtjx
	gD1IQqihTl+4KC45XUyEWTuKqScuwMzsATUboFLqOKSrpy9rTPXKCXcF4wUocc2IwN6HANnKctGcT
	UunAQlK2Mm6GSN1nkkoTDKMvJ6JdSGZO2NDbyYCjXFBAcuxEIi1G7xiXN9BmP6MkCYNkWOz51bU30
	df1NXzjA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:54804 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wxRK9-000000037WI-1alU
	for docs@lists.yoctoproject.org;
	Fri, 21 Aug 2026 11:38:30 -0400
Date: Fri, 21 Aug 2026 11:36:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: "pipenv check" fails with latest build instructions
Message-ID: <92d39d57-bd4a-96f1-5304-e309f8378f30@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 21 Aug 2026 15:38:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10313


  playing with quentin's latest pipenv instructions, and noticed:

$ pipenv check
Checking PEP 508 requirements...
Specifier python_version does not match 3 (3.13).
Failed!
$

since, as i read it, "python_version" in Pipfile cannot just be "3",
but needs to be at least a major release like "3.13". other than that,
sphinx-lint and stylecheck seem to work fine, so do we even care?

rday

