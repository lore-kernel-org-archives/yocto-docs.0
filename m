Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C444CC3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 11:49:39 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.8644.1721821775526382112
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jul 2024 04:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=IBte2baa;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bXMuhsp0CAK9rP1/LRWFl2Y2FiMbwtYrpZQiTz9NE0o=; b=IBte2baalqTfz2XqeDhgYzf16t
	n5e5iCS0ZPAtcWcNP9zU8iUFCzm47Guwsq7XzzfE67VC4lI23sUYlbCxjFIUsS1dhg4dp6yj+BllI
	QSZS+NDsx3VFsE1gWEB4alLiim8pPKPRiH5Wj22zSU1/gBAF8JPisfF9AFw4zJMuU/PXoS4Fqdzzj
	2WSbrWjQam3hSWGJ50f1aShQ8HPv6Jj9cO6yZpnVj84o2LzL/VQG7gJE7E5lkIMCjHO3VWYA86MDN
	P2f45pbjL3wGxEKuIevX0h9DNEyrfE6qTxR6jY/HH6Fwsom9sUG10z83B8/XWu7zp6AHGCyjzd1EP
	deCFct5w==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:55328 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1sWaUv-00000000kpu-2nMk
	for docs@lists.yoctoproject.org;
	Wed, 24 Jul 2024 07:49:33 -0400
Date: Wed, 24 Jul 2024 07:49:27 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: which doc would explain how to generate .debug dir with symbol
 info?
Message-ID: <a9269ac0-aa3d-e961-a76e-dcfe65d2444c@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 24 Jul 2024 11:49:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5325


  sort of a docs question, but a colleague asked me how to configure a
debug build so that the binary files and associated gdb symbol files
ended up with the following corresponding pairs of content:

  symbols/dir/stripped_binary_file
  symbols/dir/.debug/same_filename_but_containing_only_symbols

i jumped over to the debugging manual but it's not clear from what is
there how i would do this. is there a convenient table somewhere that
maps:

  various debugging output structures -> options/settings to use?

rday

