Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23519C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 07:55:12 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.3253.1750492510091452094
 for <docs@lists.yoctoproject.org>;
 Sat, 21 Jun 2025 00:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=h/MRjPu5;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hwfM9Kf77/d+nSByldYWn3LVDGJh1+lp923pDzHvEq0=; b=h/MRjPu5JbyspkAgemYuE/okMe
	yZZKiUhCrFe5sZz3r/14F0cCAABE9b7we+wOvCXgudKJdyv+qiaQTSLEdZkn76eRWX3Ew5mtWisYH
	EC35sNoMLuWBema73QlJGU3mvpWWxRWO+ppH8DPC8hISqHWJYhLB5+MC1G1KObxUG0tvVeWgAP0wZ
	OPBkUfuIUNz52CQPSayJd4t/fjAWhEpirBSHaC+TCyV/q6dVMl5dJuYQZ6RMT3R8B3uFCKV2qDKNN
	YKmkIInNVPcUerWazp5PLQq9333lgjzUa6q+TEc4calSW9NgZcuoPj1ClB9OA8lI2Ppao+4120r57
	HmgDbkiQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:51570 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uSt43-00000002Za3-2KXy
	for docs@lists.yoctoproject.org;
	Sat, 21 Jun 2025 03:55:08 -0400
Date: Sat, 21 Jun 2025 03:54:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: some better examples for virtual providers?
Message-ID: <3889f496-4084-4685-4456-181aaa30499a@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sat, 21 Jun 2025 07:55:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7130


  perusing dev manual here:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#using-virtual-providers

and was thinking of updating the list of virtual provider examples
that would make more sense to casual readers, perhaps along with some
of the current examples:

  virtual/libx11
  virtual/dtb
  virtual/xserver

but a couple questions.

  first, just to absolutely clarify, there is nothing about a prefix
of "virtual/" that alters its basic processing as a provider, correct?
that is, it is purely a visual aid to denote that something represents
a generic class of ... something, nothing more than that.

  also (and i think richard purdie mentioned this recently), there are
cases where adding the "virtual/" prefix would have made sense; both
eudev and systemd state:

  PROVIDES = "udev"

but that might have been better expressed as:

  PROVIDES = "virtual/udev"

thoughts?

rday


