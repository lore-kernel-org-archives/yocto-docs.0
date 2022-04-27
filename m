Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F64C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 07:51:36 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.5539.1651045892755125973
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 00:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q64GEr9n;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 1-20020a05600c248100b00393fbf11a05so1887426wms.3
        for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 00:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=daGmgebSj4Fj81GPS48tCn7IpXpO9FqZGjKSryCUBpc=;
        b=Q64GEr9nsfmDizE14gxCyDBl/T6WlJ3f6XuyBT7ze2GJ1NwfUvFR80TW5xDWPkYTqR
         kBxpt9bhi8hhPzl0AqlKhWxbSYlQeFHZt0kv+ALgeJzHb7ENWeRsxP40Czrglh+/wSbj
         colCslU3Chg0ciegtB9iXxxgCgjv4b/j3/DWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=daGmgebSj4Fj81GPS48tCn7IpXpO9FqZGjKSryCUBpc=;
        b=5CdjuSPenUUsKUx1cy+SxYMWZrAlopoMDQWjaLnvMInS1ZfLcTQVw/zXbtHf0QEDwJ
         jzyHMiM0xOMf09u2nEWBXuNvGSqC/bkfeR21rLkabjX+bIjapRSoS+Tpu5p5LcNgKzoR
         QGnmAe/paaH2hJdZCVhW6UG2yFY1ib5Ksc/lNhsDZunPP/HBWXaEoO+GUVZd6md2arVF
         ZUur/QTxbONcCcSZVJG7gEjpFn/h752PhXKyoJf/IqT2nhF9FDe/Y9GAJlAlgm9ldEwU
         k2u+r7jkTxiaAfkJJJsQHO8clUQX7+Gu0SCMNYdaWh05I/xVaUO5Cnq4hM5YxMufaJFv
         yT0g==
X-Gm-Message-State: AOAM530klZHui/MJTFDt137lZF1aajX7rACTWpOrUDEB3oFc1I3NzKSS
	0j4AfkrHpxng+Ldgd1m9UNNhog==
X-Google-Smtp-Source: 
 ABdhPJyjxj79hvsctjV7PjSAMtxGWXUKgye3HWMZFSrv0Im1nPE7LKG/y6JvWckCW35Aj43nibjCbg==
X-Received: by 2002:a05:600c:3391:b0:393:fbba:3789 with SMTP id
 o17-20020a05600c339100b00393fbba3789mr5272900wmp.206.1651045891221;
        Wed, 27 Apr 2022 00:51:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aee4:ace8:5bdc:9ee3?
 ([2001:8b0:aba:5f3c:aee4:ace8:5bdc:9ee3])
        by smtp.gmail.com with ESMTPSA id
 k11-20020adfc70b000000b0020ad82e3ec8sm8562546wrg.62.2022.04.27.00.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 00:51:30 -0700 (PDT)
Message-ID: 
 <02ba4e468b4f2438a8ed6d59e824a0ffcc8ab619.camel@linuxfoundation.org>
Subject: Re: [docs] [yocto] [ANNOUNCEMENT] Yocto Project 4.0 is Released
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, Lee Chee Yang <chee.yang.lee@intel.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Wed, 27 Apr 2022 08:51:27 +0100
In-Reply-To: <9d339a31-a732-3de3-53ee-45a1054d5c92@bootlin.com>
References: 
	<DM5PR1101MB236176E376BD554365050E72B9FA9@DM5PR1101MB2361.namprd11.prod.outlook.com>
	 <9d339a31-a732-3de3-53ee-45a1054d5c92@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 07:51:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2874

On Wed, 2022-04-27 at 09:41 +0200, Michael Opdenacker via lists.yoctoproject.org
wrote:
> 
> Thanks for the great news!
> Shouldn't we highlight in the documentation
> (https://docs.yoctoproject.org/migration-guides/migration-4.0.html#release-notes-for-4-0-kirkstone)
> that this is our new Long Term Support release?
> 
> This would help to spread the news.

Please. Perhaps you could help us there? :)

Cheers,

Richard


