Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4179ECCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 18:54:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.2682.1761159251139455997
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 11:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ZJBZWBqB;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q1f4wW7yC6OYK8qPQhQ98R0TeJ+qQcu0/jquO7ecE5U=; b=ZJBZWBqBzSfri4/AjyCVqfOwmn
	FTrUKhu/EjyO4UjpbIMTHopL3jA/KSJdMsd9CTjDzTRW8MDaW5c8wT9cQyUi2TQ0ph14q+jr7qsWI
	PCTLJJmQzt7CO5xvWi2O41AMb/5WRahmprOtXovYOFv8PE3PPut0cmwn7NA1Rfx0WyzD1tOeIPqaO
	5GWMGgcURyNUZQxA52zhRUs4YdIXOyDuD1Mke9GS/IV2RoZoQyYLpvAtaPqPSVfe6T62K4k33gq0x
	nJ0HycJQJAUpnsYPoMCyjLu1Mr03BfRkokfnkurG9GLwIqvjCSlVkhDnuhCbIadX1w2VOb0oXG+zO
	t+wddXLA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:60178 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vBdyI-00000009kah-2N43
	for docs@lists.yoctoproject.org;
	Wed, 22 Oct 2025 14:54:09 -0400
Date: Wed, 22 Oct 2025 14:56:28 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: i think some of the YP "reference" material is overly verbose
Message-ID: <cea30fa7-5446-c3ab-04c3-5e38761283ac@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 22 Oct 2025 18:54:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7774


  for a while, i've thought that there's too much "reference" or
"glossary" material that is overly verbose because it's trying to do
the job of *explaining* stuff, rather than simply summarizing it and
then redirecting the reader to where that concept is *fully*
discussed in the appropriate manual.

  here is one example i just ran across:

file:///home/rpjday/oe/layers/yocto-docs/documentation/_build/html/ref-manual/classes.html#cve-check

that section is in the reference manual, but it's far more than just
"reference"; rather, it's trying to provide a lengthy explanation of
the cve-check.bbclass file.

  there's quite a lot of that, and i think it's inappropriate since
reference material should (IMNSHO) be terse and to the point, then
hand the reader off to the full section of the appropriate manual that
gets into all the detail.

  it may sound extreme, but i think ideally all of those class
reference entries should be at most two paragraphs, with a link
elsewhere to the full explanation.

  thoughts?

rday

