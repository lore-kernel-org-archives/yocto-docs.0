Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86127CDB464
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 16:24:42 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.21087.1697041478663185773
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 09:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=a8BUdAvy;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/fFlCj7OKxJ02lmrXYE+9Xoh0LdCHRmQgILpaupVvxQ=; b=a8BUdAvymo7f1ardMMEVssL/h5
	cFKy1w0aRY6YyYz4/WJShmHpUkldp3Hex0c5PFYcD9nOJEJQj1zRlsrTmlSwOJqlaA78TMjE7SG7m
	7uYXq2+3GKOlV1399Nv6GjTzSWv/lMRwXYoE4GR+49sQ7SihTnjxwNlUJt4GtpUXUigHjo9HZcvF7
	UihYp5w/voChA369Ezf/P4KVj6grXOzPXDypZSqGH1EUFwR2nga5s8TbdxtXkQOgl5nuvWvHf8l07
	E6kTN0bKP2g3cNlUc+PAlr/TIYFHP3loHc8yybe9tof9TwY0IU6OrC9zxDCsQ6HCkSVVFbIMqEJ7+
	DqRICXNQ==;
Received: from [::1] (port=60400 helo=cpanel10.indieserve.net)
	by cpanel10.indieserve.net with esmtpa (Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qqc0h-007Mwr-06
	for docs@lists.yoctoproject.org;
	Wed, 11 Oct 2023 12:24:36 -0400
MIME-Version: 1.0
Date: Wed, 11 Oct 2023 12:24:35 -0400
From: rpjday@crashcourse.ca
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: confused about distinction between "BSP" and "BSP layer"
User-Agent: Roundcube Webmail/1.6.0
Message-ID: <bf75ec3734c0a4e0e88e69b06cd6514b@crashcourse.ca>
X-Sender: rpjday@crashcourse.ca
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 16:24:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4354

currently reading the BSP Guide, and here's the opening sentence:

"A Board Support Package (BSP) is a collection of information that
defines how to support a particular hardware device, set of devices,
or hardware platform."

so ... "set of devices", as in, a BSP can define the support for more
than one board? i ask since, here:

file:///home/rpjday/oe/dist/layers/yocto-docs/documentation/_build/html/bsp-guide/bsp.html#developing-a-board-support-package-bsp

one reads:

"Although not required for BSP creation, the meta-intel repository,
which contains many BSPs ..."

whoa ... the meta-intel repository "contains many BSPs"?? so a BSP
layer contains many BSPs? that just seems confusing.

oh, and the meta-intel layer defines all of three "machines", not
precisely the list in the Note in that section.

rday

