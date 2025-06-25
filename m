Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B489C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 18:34:32 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.23539.1750876462047931068
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 11:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=YiSFv5UT;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F27xOgO6Ya24b0/+JvjS6g5Br+OpUg3dcepfw8ogqd0=; b=YiSFv5UTmD9YFHBSYPJAlai8VH
	MdOYOF7ZqRaNk/XPt54tp5xZUlAU0tp/HGAB9JzfcG8uRZwGRYAtJdbvlju/gLbVZomldtjK5L8cN
	uGtzjcgtF3FxfUP6ntQCqf+ZjHxaAenpZSJvWFbDiXErAU2np4KX8FVyuYkx8e3uIR1V/H4tuSqIs
	ABUPsGas0mIjgXT+8TCXdNKj8iyN4mrVZPvoGd+5uk2MQwEkn80hcubE0vhZcdQCw5Bmt73/kll52
	Ng/fs7Dk4IhpjJv5419T/fIuALH0JXtBnkMPgiyRxHsu58oFNBhSjFO86CS/hF2anPHpqBpD1OHre
	KRc4zUXQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:52836 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uUUwr-00000001wRO-1ifv
	for docs@lists.yoctoproject.org;
	Wed, 25 Jun 2025 14:34:20 -0400
Date: Wed, 25 Jun 2025 14:34:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [OT] trying to build kas docs, "No module named 'sphinxarg'"
Message-ID: <edad802f-c9fb-a11a-e729-bc505ac97112@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 25 Jun 2025 18:34:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7225


Given the abudance of Sphinx expertise here, I'm hoping people will
forgive me for a little off-topic querying ... I checked out kas:

  https://github.com/siemens/kas.git

and tried to build the Sphinx docs with:

  $ make html

and got:

Generate kas-container usage documentation
sphinx-build -b html -d _build/doctrees   . _build/html
Running Sphinx v7.4.7
loading translations [en]... done

Extension error:
Could not import extension sphinxarg.ext (exception: No module named
'sphinxarg')
make: *** [Makefile:53: html] Error 2


I've installed python3-configargparse, but no change. Can anyone
suggest what I need to fetch and install? Thank you kindly.

rday

