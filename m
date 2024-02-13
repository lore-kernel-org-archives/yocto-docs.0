Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CC0C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 11:17:04 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.9160.1707823018693158091
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Feb 2024 03:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=oL79KCSK;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HVespi5W4Yga5rjstKbF0DLFEo4GC4TFKUQN+OJFMLY=; b=oL79KCSKeKrK3MsyktQp1jHmRP
	cHhxtac7ak2+9q9pmULuJsBmpn0u/ylKOQhu/WcxqrW3LhNDDDmycfNligHv8SoPcxnDyefttWUh7
	extNiZUlf41FYIF79wi9/925VF0nhFfRRfp7fJG6qCB42fEj/ak47WUTZXTAxWsPJxPB1qJlsAfUx
	TQ2Oxf98uefp+R7ytALo6MWndF8CogPkkJM76c70XlG/1Aah2cSpoTWNWAG0gtGwxeKLPpOCFgHjD
	3Ji1ytbyx0/z84knJErfSur8o/3viPOqsyF2ic0ULD06fkWh4AbRCDJj/qVq8pqeO/WHw77d4wcv9
	cImvbjFw==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:41538 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rZqmU-00EUSU-3C;
	Tue, 13 Feb 2024 06:16:56 -0500
Date: Tue, 13 Feb 2024 06:16:21 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: michael.opdenacker@bootlin.com
cc: Daniel Ammann <daniel.ammann@bytesatwork.ch>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: suppress excess use of "following"
 word
In-Reply-To: <ad02cb09-e65a-49e8-855a-3306958936b4@bootlin.com>
Message-ID: <525b1a52-8ed-5184-c77d-844d31be052@crashcourse.ca>
References: <20240209165251.2080708-1-michael.opdenacker@bootlin.com> <13d89168-f3ca-4b1e-a95d-9ab2e91c13c0@bytesatwork.ch> <ad02cb09-e65a-49e8-855a-3306958936b4@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1923531728-1707823016=:409321"
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
 <docs@lists.yoctoproject.org>; Tue, 13 Feb 2024 11:17:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4833

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1923531728-1707823016=:409321
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 13 Feb 2024, Michael Opdenacker via lists.yoctoproject.org wrote:

> Hi Daniel,
>
> Thanks for the review!

  regarding brevity, i'm always mindful of the words of Antoine de
Saint Exupéry:

"It seems that perfection is attained not when there is nothing more
to add, but when there is nothing more to remove."

rday
--8323328-1923531728-1707823016=:409321--

