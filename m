Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F80CCD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 19:05:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3872.1778180692874073642
 for <docs@lists.yoctoproject.org>;
 Thu, 07 May 2026 12:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hJMD0KWD;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso9402205e9.1
        for <docs@lists.yoctoproject.org>; Thu, 07 May 2026 12:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778180691; x=1778785491; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cl31MYDM1ghaWvN2Qq7/lr1sh45UclUSKLWd7kjFUWc=;
        b=hJMD0KWDMdKrgu1/EknokuqKDdM0G7b9zymFuJBdkXgPHfni9W1AotQqpIZM6dnqCF
         KC+FOKjNxS5ibGalth6FOxx4sE9HKKx4IMi/Dek1SHpmYBqmGDURgLphn3QlNS7HeAUO
         AiYMB/iTxDPZItT4LZ1B3xBfC0vycWbK3RmAXY9R4tbQDogDNGkNWuN1EWhSQ+ZP4+ia
         ThNncNge2i2W9/UPUzi2stcwEMFsXR84HK/CC+UbPFomlM6Po5O1D674oBNLIDJptHqp
         szqHiIPBv34gdR6RfbHH8f/yZ9PCU+RdOtESfgoysezl9NTs1SWGP0NLp/B/jzOmlt8S
         7BYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778180691; x=1778785491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cl31MYDM1ghaWvN2Qq7/lr1sh45UclUSKLWd7kjFUWc=;
        b=bMO3tfYTot1yO4oJxK40MhknVEk0z3ryyoDb7hTa0g/SB/dHVwDKA/MtF6AT7XEmFz
         remJ2D6vmCzpz/IZx5pm+yjmBX1kKEK7e1U2YvQssK0akG52o2a/0Vmz6y4OJNdogrQT
         hL+r7cE+rcIyss7TLJ6GlBiUS2n/ZoBn9QS3qWs9jb8W5jzzpoWfBj7p4h1SHkGyUojT
         2pC7uH04DhzAEMBXnsLjehy7JduEpv4rV8HjTgo7S3tRAu+HlhDBo6pnBcXikLMEJQ1+
         jBhQQxvqshCauV8r78S5eYWD3VhR5kXK3XtB//LRJDI4uD6+RYX7vHrWJfqfSFgFqSGC
         V4JQ==
X-Forwarded-Encrypted: i=1; AFNElJ+n7U8WocoDeuE2q8jxTQoYVIe69rx00xlp7TqgoGn23biGUFQvm3zgy0hGFSr8KBbxAb9z@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yxdw7yZBepQGGuGWVOXj+a7Sf2SimnizdrAobuR29RglOhOBUjz
	5g06Awm2p1gDDSccd2+Ghvc7wypm2uh1jDQkkalFMb53P563MPYBuU+I
X-Gm-Gg: AeBDieuA1StlJ1DOPReAKsBm9oiYoUdefJfg2r5AliYHaEvCAsEfhmo43BRk9CjRagl
	ICwfJmtrn8bGjUCglqVHJwiIJ4c+o7n6R6jQ/AaGAcLJCvgnZlCq7pLe1FZ68QwgUG71aTe6E5h
	/jO8SHUhinQB6tlpHF59ZHdYcBB3oSK/R2pvloHGnpu/ErifSan7xHBx62vI+RkHj8qoYhlQhoX
	ieCWfOC0hHJufMcxtkDZRMrPbFX9cuIheodf69hNsBuPBHvzG2lEmIlv/mn744UERghW0CUGVg5
	SSdNFc7l8sZyHkx1VAteQfTCzZIMP6UlzbZWeUexRr04OQRNVIWOj4YIUTAyEVr875JZks1dtzv
	EgMuVMdkLNEKnRdQxmESUqHL5qDkkSafih2RVb7I2qPXvWtsTovAzR8DurjRTfIoVeEPnvnTrkF
	1F//dFNRuHP9vxnIRbbb4r0YFE4hYxpSS+6b6sRFx0v+60hQTLlYyxxkRx31BDz+/ZQDbz5PlOr
	H4oHRzyW4ckCI3YmbwTJtVxS08Hz85dyMMB/3nM
X-Received: by 2002:a05:600c:c094:b0:48a:592c:e63d with SMTP id 5b1f17b1804b1-48e51f3fab1mr107775555e9.14.1778180691062;
        Thu, 07 May 2026 12:04:51 -0700 (PDT)
Received: from thinkpad ([2a02:8070:d188:380:9ad9:81ed:5ada:862d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538fad5fsm157112855e9.10.2026.05.07.12.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 12:04:50 -0700 (PDT)
Date: Thu, 7 May 2026 21:04:42 +0200
From: Dawid Bijak <bijak.dawid@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org
Subject: Re: [PATCH v2 1/4] doc: bitbake-user-manual-metadata: remove
 incorrect claim
Message-ID: <ug27mu4jc54bkzrnkizmctu5bireuf3vov74gi75rsqf2ynxib@omnzdr4feoa3>
References: <20260501091418.76994-1-bijak.dawid@gmail.com>
 <20260501091418.76994-2-bijak.dawid@gmail.com>
 <aff89f3f-7bc6-4634-b834-1872d559c8e0@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aff89f3f-7bc6-4634-b834-1872d559c8e0@cherry.de>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 May 2026 19:05:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9403

Hi Quentin,

On Thu, May 07, 2026 at 03:48:19PM +0200, Quentin Schulz wrote:
> Hi Dawid,
> 
> On 5/1/26 11:14 AM, Dawid Bijak wrote:
> > The documentation for inherit_defer contained the claim
> > "If VARNAME is going to be set, it needs to be set before the
> > inherit_defer statement is parsed"
> > which is incorrect and contradicts the purpose of inherit_defer.
> > 
> > Drop the incorrect statement.
> > 
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Thanks!
> Quentin


Thank you for the thorough review of the series. I'll  send v3
incorporating your remarks. It will however take around a week since I'm
tied up at the moment.

Greets,
Dawid

