Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105FCCD6E7D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 13:41:43 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8362.1780666894999233538
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 06:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=u2PmXfV2;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rf0S9tI2m9+VdVOXUzIhiU62TqaEj+BzyM+y2zimN1Y=; b=u2PmXfV2FrG/9bs23AioeT1ILv
	IR+BtsqMY3b7Hi4mfYb/ZTtmb6pxTNKv3BbjF7LMcbBFGRpkQLJpzwtU25vnqznL0vTGM3TRxIvNw
	RXkBpHJ0br8dwqw/MlHCDeuiNlBwuXYfg7prqRyT47esp6g/tLifQJOZAPcw23H38j2ocHJz3JrKe
	4SlmjZEtbfqYZOeCFfMyVPUn8PpE7FHlYjcCQiMbyYAMdnMlNpYzda039zhLvNGfZChBnW/ZdCjB7
	fSCairZz4lpAePyjhHc5/E2BtowpLnJU2dWhV8I9Th6H5zcj+Dad68riKarjqByDRerdMO2TXY2z/
	9vThkaew==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:40698 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wVUnj-0000000DmQT-3j5E;
	Fri, 05 Jun 2026 09:41:33 -0400
Date: Fri, 5 Jun 2026 09:41:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] overview-manual: mention idea of dynamic layers
In-Reply-To: <DJ15NY3K55MY.2P350GP2Y0R34@bootlin.com>
Message-ID: <33efd782-b0b6-acb3-b1bf-d00c9197dcd8@crashcourse.ca>
References: <6032efe1-86e9-a83f-6247-939b7d3a36b8@crashcourse.ca> <DJ15NY3K55MY.2P350GP2Y0R34@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 13:41:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9603

On Fri, 5 Jun 2026, Antonin Godard wrote:

> Hi,
>
> On Thu Jun 4, 2026 at 5:59 PM CEST, Robert P. J. Day wrote:
> >
> > Warn the reader that simply adding extra layer names to their
> > bblayers.conf file might have unintended consequences, and refer them
> > to the BBFILES_DYNAMIC variable for an explanation.
>
> I don't understand how this related to dynamic layers directly. Including a
> normal layer that contains bbappends already has consequences.

  Point taken, so drop it.

rday

