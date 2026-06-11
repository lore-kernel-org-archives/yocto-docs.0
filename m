Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A76CD98CE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 15:11:29 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48337.1781190679026556994
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 08:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=nt/CmjNU;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JEV5Xf04SZUWX3ceFuz4D9tbD6keaK0vDIGwBeWXYik=; b=nt/CmjNUqY6fFIut2oJrrozyHj
	77SkaI5meKvEW34rCBiuK5CtTbyS67maF0u2Q0sthjEACvI3Y663/8j9MVsuK7rM83SWv1MjwCEsJ
	wPMD4yNf27PZjjLjePYLIJL2tUkH0MLaEdUdviAN73mNdpP+xdyim008RabC1jADC8jsNQLq39182
	dA8UojHUiqdohm1og3guAEG19hLGigOOgst9axKNqkbBcZq8X2P/ILzKtjV7aLJ2zySDn63YjWITF
	UFn5C4gUmturtZjNf6oXv6P2rkskzQZbu1bV/1x/AXlhjf1yZHoVlicQUoRFRpykyRZvK52lnS+KX
	cFdVILVA==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:47696 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXh3s-0000000Btid-08Sq
	for docs@lists.yoctoproject.org;
	Thu, 11 Jun 2026 11:11:16 -0400
Date: Thu, 11 Jun 2026 11:11:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: is it appropriate for some content to be *only* in the reference
 guides?
Message-ID: <7b336a32-086c-75ac-9d23-e01f869954f0@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 11 Jun 2026 15:11:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9696


  i was continuing my perusal of the docs and was going over the
sections related to creating a custom distro and distro features and,
in following a link to the reference manual variables glossary, i was
surprised to see a couple distro-related variables i had never seen
before (this one and the one immediately following):

https://docs.yoctoproject.org/ref-manual/variables.html#term-DISTRO_FEATURES_FILTER_NATIVE

i had never heard of these two variables, and i confirmed that they
are not mentioned *anywhere* in the regular docs (except in the
migration-2.3 guide). so how is a developer supposed to know about
these variables if they're not mentioned anywhere other than in the
reference manual?

rday

