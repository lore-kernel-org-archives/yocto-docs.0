Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49696C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 10:15:26 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.7326.1648030516348488924
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 03:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DskS56rh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id d7so1371694wrb.7
        for <docs@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 03:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=emAe+rSQ9ORTN+iM67jvBERA8yVHM5fx1LOAfpYcsdI=;
        b=DskS56rhb8WQIDURcojntyD6Yq3dByk8r/LIKDJFK+r+g1oJHJgtJDKC6Qnpk9LK+M
         3hD5NUpHBUCI1dmffkRjNK06TvgbAHuqk2h7TrCUOacXE9K1bXgOmD5pXBaGu+G1GAyV
         qbik8gFAzON4qsYzbH3pii1uGHawCV0hzK6P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=emAe+rSQ9ORTN+iM67jvBERA8yVHM5fx1LOAfpYcsdI=;
        b=ARifL1jui8BDKl6bQA0L/fu/2+ZoFVGs/LdcrThfxA0+erBHf0SOdxrdobuhMuXMSr
         5Vcw3/ji0hScy+81azGuJm4F/gU+P6fKr0GAHPmBmNo6oRLNSxQuNMko08IumjZe7eSj
         U4Bwky2Bc1XeAh5thMcCTmnkFvPHOgvKMfjkv9wN/tBAU3Rg2IGJXa6iDAtdkNKIhnw3
         KMWnAJw9mDYyn2metJguJfgvt3Fgdbrh3q8kyCKvgKG166gLo5do1vO8z0zjwSuJ4/EB
         RX0Risj7PTie8Ua/Vd7N/dcKJNfhjAPBFfS02k42kt3fClnf9EqGYaXEnN6SzCTA3cyP
         90jg==
X-Gm-Message-State: AOAM530hW2HbkQzTnbDw6inulvwJx3H7uN43dfRj6NRj3fVNoxMUV8b/
	gqQqYMlfHE3EDSfA0X1HrP8r8vYDcQi9UE3V
X-Google-Smtp-Source: 
 ABdhPJwTQmIXIDGFlvibM/vHssBZsv1zjGBQOzK6Znl3Xq6Ml/tRi2t/8L4De1LwDns5YaE4TgjOew==
X-Received: by 2002:a05:6000:186c:b0:205:3479:ad85 with SMTP id
 d12-20020a056000186c00b002053479ad85mr6589768wri.54.1648030515000;
        Wed, 23 Mar 2022 03:15:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aaba:716e:9c38:ad87?
 ([2001:8b0:aba:5f3c:aaba:716e:9c38:ad87])
        by smtp.gmail.com with ESMTPSA id
 y5-20020a1c4b05000000b0038cbf571334sm1885428wma.18.2022.03.23.03.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 03:15:14 -0700 (PDT)
Message-ID: 
 <e994ce1ce045d1fcf2da63646ef6ffe391ac9612.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 0/5 v2] Proposed docs version changes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>, Nicolas Dechesne
	 <nicolas.dechesne@linaro.org>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Wed, 23 Mar 2022 10:15:13 +0000
In-Reply-To: 
 <CADfgfoYfeR8D+PzJhefNZRhnD6tJZZd0c6WOkSLNgRwso16Brw@mail.gmail.com>
References: <20220321174455.1189669-1-richard.purdie@linuxfoundation.org>
	 <CAP71WjxAtVJO2YvM3p4UM1TEYuqmM7TLpDo5kRytp+G=kQhSgA@mail.gmail.com>
	 <ea41470f551f80509c947bf074eee5b29777953e.camel@linuxfoundation.org>
	 <bc6e6ce9-2287-cfd8-a3c7-6d9f54ecc1f9@theobroma-systems.com>
	 <9a19dcfedb95816a40a967bc87fa54f3da62fef3.camel@linuxfoundation.org>
	 <a7308598-4d69-ec6a-4edf-df198055ee93@theobroma-systems.com>
	 <16DEBBB55476AD52.11857@lists.yoctoproject.org>
	 <7b263ab8905bc5fe6d2fe6c8cf65bf2583f9ac49.camel@linuxfoundation.org>
	 <CADfgfoYfeR8D+PzJhefNZRhnD6tJZZd0c6WOkSLNgRwso16Brw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Mar 2022 10:15:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2695

On Tue, 2022-03-22 at 17:47 -0700, Michael Halstead wrote:
> These tags are in place. I back-dated them to the release day but I put them
> in my name since I've added these without a release engineer involved.
> > > > 

Thanks, this helps immensely!

Cheers,

Richard


