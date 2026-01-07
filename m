Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61141CFD628
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 13:05:45 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5229.1767791137188402962
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 05:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=GkSufRiW;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vvBonmJPjeu6PCY+BbfUpgoXvMLxOhpbLB7etSLxis0=; b=GkSufRiW5amUOWv+WrcqlucRMh
	wGET32yF3gug4jXAAX8tRYEzbgmyzcneiePQREaJn9TaGF+GVyfLoKDtsONAt9j3WvuNnpzw4qEGE
	3JX2fKgv+LGDmsQohOGUM1QrNwZDtqD0J8/QHvvkViqlBJU5/rHaIhHHaeRRzQ1U1k2YD5v/1hzUh
	aXLgJp4/Wqth17Ddqc/31ykxjNv1PEdFCwUTlHnUDL4d/3x8JHogXhoMNgGm+S04Dhiu0yzBxfB0O
	FrqPzDw5fNmQwmX5Al9uVm7fLDlNfswkpAtq4UuDXTiLXeUlbkX347HUe/Gnr9aYTjB81V1OhVa5w
	TuKf/bXg==;
Received: from [147.129.179.166] (port=46258 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vdTED-0000000FKxW-1sXn
	for docs@lists.yoctoproject.org;
	Wed, 07 Jan 2026 08:05:35 -0500
Date: Wed, 7 Jan 2026 08:08:36 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should docs explain unversioned recipe files and unversioned append
 files?
Message-ID: <fbd1c18a-ea92-1a7b-14bb-2ccbf0400828@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 13:05:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8403


  one more pedantic observation about append files and corresponding
recipe files. occasionally, one runs across an unversioned recipe file
for which some other layer has an unversioned bbappend file, one
example being the "mesa" recipe:

$ find . -name "mesa.bb*"
./meta-raspberrypi/recipes-graphics/mesa/mesa.bbappend
./meta-freescale/recipes-graphics/mesa/mesa.bbappend
./openembedded-core/meta/recipes-graphics/mesa/mesa.bb
$

  so what is the rule here? if a recipe file is unversioned, then the
append file for it must also be unversioned to match? what if the mesa
recipe were suddenly to become versioned? would that append file still
be applied? the docs don't seem to cover this possibility.

rday

