Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC26C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 16:36:55 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.1665.1752079011159426037
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 09:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gkoCXUf2;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23636167afeso956155ad.3
        for <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 09:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752079010; x=1752683810; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xCFV3lFQDLPsAjqdjAf39RXTtFFPvIpFUMTgyQwClUk=;
        b=gkoCXUf232oWkgRm6hw1b8D2t9Zr9NFDJBnclDid4jzv5fmyJ9UtnI2enn/8SO+5cL
         bm86++N8GIwJjjQB0oPwo4bVbzqlcaJtu6Xhr/SeSTpu6RA3Ovu1P/U9+Z3sO0s1KEwZ
         P9ZXBBYAcCKHsyoB5TxY2pAguEoTUBTezW2ixBDBxZzPP1++wb60oqIOo+IDcCp17sVE
         KwYslMypzwRQPU/1UdnzIelQlumoQ62Ls2vkZHshGB3BJcMWyz0rci767HBzGcqmjQyP
         eLOMZomE2ncqfDt+KX2rlmnkV2EtNnMUzEdCVNHs7idzwaYbjeehmVLMc8BcPYeYap8l
         uT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752079010; x=1752683810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCFV3lFQDLPsAjqdjAf39RXTtFFPvIpFUMTgyQwClUk=;
        b=nRgbGEYFKGZOrhR2NK41/ZdrppvxZlnSzxHyPwcCTgneER/xhJ6nUgzJjTFKi7buf/
         XajRhJK+NScWK6fIImaN+/ORfhtmVMDE7YF+I2PwQnu+Uv/x8Lyjw9S7XeIpSgcX5Qmq
         enygX49zcu0g1IBKNFVvfbyE6yAI/rooKDSNFy2yV5yX3QfPONpsj6CqSJcLQSLdP0pR
         YDOEg/CJ5hFUTbmZrjzzOyhXMsD8MfVlFboInVRM38EZr9IRruFSVzSpLqowzbUdLecA
         BMasjpXs9QQJ8nFSiCLUuK0bNS8KFAE+kDO/LO8PZ2jgWio2UU/k0zus8zFE6PCvmZeX
         YNzg==
X-Forwarded-Encrypted: i=1; AJvYcCVukydwpT03qFOR43Nbd6rTmwLV9QCqGeXeVjbh4TlFa7Ta3lW54cPnVZZa5GPu2lA1z7je@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YziBVN5eZd9fysXd0bKMPdYi1n3NSjFbhMtlVd/sSzDoD5c5aZa
	Y5WUG3/ysMSS8PNmd0AxqrRcdtvfnThDcWaoemBGM8IRTxYegI4xK0e6z0slhNS+
X-Gm-Gg: ASbGncuibtt1N2fwxzFG9ehRxKJC1lQyVQuWbR320EP9fnMkKHzgeoJpVFSphNqqKcq
	0AKsWcaqSfDzXLhQXsVAf7+vYXQifovo5E8MHXOMb4aVNMTSVilnbDyyPqdTQksS1YngHhV/0+E
	4BQlRibwikHlwC2gHk6Loe/8xE8GDXo4XgpO5eH44gFUmCtdI32Zh88f1xO2x0TJ1VpWSY1XeiT
	TOMBjXk/rUnbMz3aYGQpp7KunoNqKKcnWibMGI1wfRRQKvdFy1uHXVlYbfzoFfEBynBdWkV14Gb
	tl+guit8e1FewVlr4gMSA4FhkkJbT6OOgf3x3UTVhypXWqk84a2wfwCh35jaYZsmPJggfL9ySGs
	467hyjg6VmahXOzErHrCijwxUj7CPkzRQaJ6HeBrehFJn6Ovhqa08DeQf44qB
X-Google-Smtp-Source: AGHT+IHVJ/QsVvjgbnHTB9/Z1sbACeII0BfYRdhPx/aWbyTda3lAfFtz6BDz6UEWeZQCGnvXAsrgig==
X-Received: by 2002:a17:902:f68b:b0:235:efbb:9539 with SMTP id d9443c01a7336-23ddb1a2b79mr51188545ad.17.1752079010516;
        Wed, 09 Jul 2025 09:36:50 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:d1b7:aad6:2c95:a1d8? ([2601:646:8201:fd20:d1b7:aad6:2c95:a1d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a1e5sm138612415ad.9.2025.07.09.09.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 09:36:50 -0700 (PDT)
Message-ID: <7d8d6444-7183-4149-986e-7a4ec8ddedf3@gmail.com>
Date: Wed, 9 Jul 2025 09:36:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] OVERRIDES explanation in BB reference is confusing
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <1725d309-893c-d825-2d29-90353e3dff28@crashcourse.ca>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1725d309-893c-d825-2d29-90353e3dff28@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 16:36:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7303



On 7/9/25 5:16 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> here:
> 
> https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-OVERRIDES
> 
> the example saetting for OVERRIDES does not resemble anything i've
> ever seen:
> 
>    OVERRIDES = “arm:x86:mips:powerpc”
> 
> what is that supposed to represent?
> 

Nothing, but learning by contrast I believe, but it can be made more serious

> rday
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7293): https://lists.yoctoproject.org/g/docs/message/7293
> Mute This Topic: https://lists.yoctoproject.org/mt/114063220/1997914
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


