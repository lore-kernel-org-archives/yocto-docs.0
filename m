Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1C6D0E6F1
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 14:36:00 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18374.1764081350221526041
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 06:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=QzQVW6kd;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HRzTEgKUuKNqP+HLojqlguN4Wepqt6M/yrDT1iypz54=; b=QzQVW6kdB5Jv3mdVa4miyVLQa6
	P+ePz41FU16Tb1ebiSdH1klDvCpGh9V2gq2kmUnxdvkg/ZdgdW6Ax+Mh6nmndlCA/m08jt7/oLn7D
	t0UJD8RIPyWfoDjUI+sIsa/U5CI+K74dg4iScjEP2HeyZiHLUbGoeoS8cE9OoPwzg0mzPJ5bUJbDz
	ouWQAbDo11+FITnkbpJg4Dtb5awsuXHtr3uP+LetpowJ505fF84e03Cq+Vszzs8FSINfBf+ULDkEc
	Y2y2/If4XfddjKHDqpbUAyMUync5Cj6VhP40WFz80TKgKDlnTUdezZhQyCI/kmwmvg8LIM/3vmmvB
	mRLz3/Ig==;
Received: from [147.129.179.166] (port=47986 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vNu8s-00000008DnH-2E74
	for docs@lists.yoctoproject.org;
	Tue, 25 Nov 2025 09:35:44 -0500
Date: Tue, 25 Nov 2025 09:36:41 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: is there any value in a short section somewhere on H/W bringup
 tools?
Message-ID: <8f9e9bb5-e84e-c9a2-bd27-105ffae5c2e8@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 25 Nov 2025 14:36:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8118


  Is there any value in adding a short section on useful OE-available
hardware bringup utilities? i just added this to an image to help me
poke around a new board:

  IMAGE_INSTALL:append = " \
        devmem2 \
        dtc \
        ethtool \
        i2c-tools \
        libgpiod \
        libubootenv-bin \
        lshw \
        mdio-tools \
        phytool \
        spitools \
        usbutils \
  "

might this be something that would be appropriate for the BSP guide,
or as a section in the dev tasks manual? (i'm sure there are other
packages that would belong here as well.)

rday

