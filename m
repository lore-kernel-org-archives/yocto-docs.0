Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02803CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 12:00:31 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18800.1762171225200402176
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 04:00:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=urNFs8BV;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Sl3E10Qj3nyAs8ebV53ULjYLbFJLBaMBik3wQ05mdsA=; b=urNFs8BVChbTXVe5lO5d0sk3h+
	i4fpeLv7HaUhB/oBnvci+kK1C9NOvQNPfZfl8ye3Uuk5G/UfrynZHh8NrqgvuunIOnLOtJ1tAVchU
	q5PiTsEo17NLQ7mnENIGSQy+VnhGrSHhpGLdCKxGObltD09YGQR5dcpD4uQyVv89OkO7ma+WvTHKU
	XLF8mtc8OtNO8XFOzhqfkLn7Wui9yaquNAeScL2ir9RkU8NbDOImUYKSxt3Ek5HbKinKSUl5dETpo
	52BQROx9ws2RCXFn0VwDog5UrVeBc6MoVxaT8/aROkVWtRuYW4oz+yHNnUeG+x27dL/v8gdPmTevE
	3CYqFKWA==;
Received: from [147.129.179.166] (port=39726 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vFtES-0000000FtqP-30d2
	for docs@lists.yoctoproject.org;
	Mon, 03 Nov 2025 07:00:23 -0500
Date: Mon, 3 Nov 2025 06:59:21 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: does variable glossary identify wrong default for NVD_DB_VERSION?
Message-ID: <de0afb59-cac2-2267-6d91-33c1eecb053d@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 03 Nov 2025 12:00:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7969


here:

https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-NVD_DB_VERSION

we read:

    The NVD_DB_VERSION variable allows choosing the CVE feed when
    using the cve-check class. It can be one of:

        NVD2 (default): the NVD feed with API version 2

        FKIE: the FKIE-CAD feed reconstruction

        NVD1: the NVD JSON feed (deprecated)

but cve-check.bbclass suggests FKIE (not NVD2) is the default:

  # Possible database sources: NVD1, NVD2, FKIE
  NVD_DB_VERSION ?= "FKIE"

i don't know what might be happening behind the scenes so i am
*definitely* not submitting a patch. :-)

rday

