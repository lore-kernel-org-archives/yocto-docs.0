Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425F5C83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 11:41:14 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.13432.1752061268092359211
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 04:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=SKY7TP5J;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=d19J7u9kv5AqV50P/fimYJWygpe0ycdb1ObBhZHrIQY=; b=SKY7TP5JN79Aq+1NoTLbn/H59C
	s3H9iHa0WwFTuHKv3LHdgWEQm7LH+bgymyN2XK76QOhBXJwmm35LPSrJbSiXln05G1H3hqIBINeO8
	PGZm3deJh3V3M45tvQW5N5BwJe1SuUEfR5W+tPiVXww37v6gEgv0SA6IQPAqarHAirbVr+tzVcnQs
	rUlIrs9rcYTwP472TwdYUE8cj0kO4mHDYtcxD1ld86YNtD3RETm5iRAtjD+aeox5oZ2AruTNt2xQ7
	pS4ZBPa9tBxWxmQBqBqUUZMBtV1+Mr0jA+Fy1ByuAbRcxQTgYTbDDCUXj9MVVkwMmR6O9xJA+zAq4
	NVeGcdlw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:45652 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uZTAa-0000000AWI2-2sz2
	for docs@lists.yoctoproject.org;
	Wed, 09 Jul 2025 07:41:07 -0400
Date: Wed, 9 Jul 2025 07:40:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: perhaps "DEFAULT_PREFERENCE" in BB manual needs a newer
 explanation
Message-ID: <ebacaa46-9a35-2952-0857-3b9d75fd24e1@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-940108121-1752061262=:760949"
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
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 11:41:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7292

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-940108121-1752061262=:760949
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


here:

https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-execution.html#preferences

the closing note suggests that having an alternate "bleeding edge"
version of a recipe is "common":

"It is common for a recipe to provide two versions – a stable,
numbered (and preferred) version, and a version that is automatically
checked out from a source code repository that is considered more
“bleeding edge” but can be selected only explicitly."

then gives busybox as an example. not only does current busybox not
have that structure, but there are almost *no* examples of this
anymore throughout all of OE. i went looking for an example and the
first one i found was xen in the meta-virt layer:

https://git.yoctoproject.org/meta-virtualization/tree/recipes-extended/xen

so perhaps, first, this should be re-explained as something a
developer *might* run across in their travels (but only rarely). but
maybe a better approach is to leave this feature for later, and
explain it in the context of how a developer can support this sort of
thing for *their own* recipes in their own layer.

  in any event, that note is clearly in need of updating given the
almost total lack of such a thing in the current OE code base.

rday

--8323329-940108121-1752061262=:760949--

