Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FF7C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 12:16:24 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.14351.1752063378105951701
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 05:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=0fVufLqv;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jWYajgwKbjPV5t6/CahogsL5Aea9uQfuMtn5pDTZL6U=; b=0fVufLqvOJiuzPgRaLRTvu3sFr
	d699BtrqsDx3SJUJ2Y2xRvGkBtcMwOcvmxic5QWbVnlYpH5isJjRp/2h2T3B/ix5fp7UoaCXXGwna
	uU5uci0B11YmBFHn0oUetRd6+aUjVUMG8sKcmgDEs27WgdbZuTIpG3Idgbh0EmH8erz97cfd6RWMI
	hma0Yr+Jiihm9iu3XfU/K+OJwVb7COqnoN3ECzSFmc/bo3xcvk3rneIwrQMwHx436iU6wkTg1+0ig
	OQeykd0QMM5DYm1GwhBHCGN/cFdIqSElIlHrEV6LIa13+Afq2SBZIC1JeQuelllWJkiv9CofvDPzi
	dYDhvtrQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:40548 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uZTig-0000000Ac3Z-1j4H
	for docs@lists.yoctoproject.org;
	Wed, 09 Jul 2025 08:16:17 -0400
Date: Wed, 9 Jul 2025 08:16:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: OVERRIDES explanation in BB reference is confusing
Message-ID: <1725d309-893c-d825-2d29-90353e3dff28@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2116871399-1752063376=:763633"
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
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 12:16:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7293

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2116871399-1752063376=:763633
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


here:

https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-OVERRIDES

the example saetting for OVERRIDES does not resemble anything i've
ever seen:

  OVERRIDES = “arm:x86:mips:powerpc”

what is that supposed to represent?

rday
--8323329-2116871399-1752063376=:763633--

