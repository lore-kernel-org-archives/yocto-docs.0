Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5163CC55171
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:30:38 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21356.1785666630714579266
 for <docs@lists.yoctoproject.org>;
 Sun, 02 Aug 2026 03:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GDGVKBWN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954dff6536so7870565e9.0
        for <docs@lists.yoctoproject.org>; Sun, 02 Aug 2026 03:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666629; x=1786271429; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-type:references:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tpr/U8ame4z7ACBN37hM2IM1buviYkPRPozRvMKgGsA=;
        b=GDGVKBWNgvXWhF/3+DFNbcQ0eN3ETMmX8Ip4J2+PYUfFocX8w7nv+x4wbZqVVN7iwI
         VL4zx4BVvk/enouPeiVwLlRiKnqnfAJfv/eX42i9NGHr/TrZ/cyVA4SgDBA4oY3szYWA
         ffhZ9kRSblkZPsmWyBY6xgPHUhwO9LXYfMNpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666629; x=1786271429;
        h=mime-version:user-agent:content-type:references:date:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tpr/U8ame4z7ACBN37hM2IM1buviYkPRPozRvMKgGsA=;
        b=PRe0SrQ7cLxL60d0CwCAISmOAekUzWCelsf1AeAVqUF4lc3IedrQTxf1NpvAXlfjcY
         uZPdkU9IQsOvYRDh+nEasAwzbKqbj/KHEjoO6j91iBeHqBMW4crqJRpCfEYBwp4kM5KR
         wgiAyHhrkG4l27/9EtJTkmH35+T82AxHXLmNrycpY3xslSQoWX/4UvnHB/ugWKkP/9f0
         ig0rHZWNNVJejyA4i4Oo2QBMNERvNGlic7Yxhr3WXCa1tMtmTPGsqCGmTPQjWP8ruyun
         HF/UgZBnPlCeYKIxnEgqREs6NahF9ro6fSnsvQQm5VFdKx9UdnjCs7KkyDBOhxcRlc2x
         MrXQ==
X-Gm-Message-State: AOJu0YznHnH+1vMl7epmpa/dXAI7PRxqbsta3Oi8irCYpU7ZaGUF1cRl
	H9z5ntditDXfHQcJAN0miV1j+oYTQ4jeRYFz8vbtjVQ0Ss+s8azhZsiNWLVqNl+LVWEilf3/bEw
	kPScr8mc=
X-Gm-Gg: AR+sD12H6DBDtPb6Maj7AefWmFrlxR6TCwvXDCSuGBHVYh+PK5sW0klvBUEIviLwQ4W
	2Hf0qnd4I3aOCy61tgYl+3/F3zfyQQMGSkQv2bHkdHoOSjkiLOd2zuovxZ+vWE1AVdNgXWDW7I0
	lJXZA9nwgW7DxZmOAoVavf3JNpLUhGQrTpz5OKx/IOkwlACcrePHu7RfuiwzIma5dsCKrx9otYA
	8qccf0egxX4ZU3Q8Hca42cIgrS2Dro2831JLXgoKqprxfIaOxeW+DPsflAeX9jeN/G0SaKaXipN
	iem1Kf/e/eFtY+2Rx0fvlqmbn36Fu2gp1nVIBUC5VY0TniAgmkIt6OrpJJyyJY14g09osAN13zg
	Am8r1G6h+/mgJoRgsHOUHRmTk1ltzWcebG5Nl1aWst1eA+TDBi6xMC/JrgPeEFP72oUw7alF1JR
	tvs1b3bCWGs/xH/XXA/AU/zwgRs/AjY1pntK/TO9NqOhU3rowPbTSSY5b9oZlc2GFuAn1zAbNTa
	d0sBKo+zPgz/0cDKro2alYbVDFQ+CSnerLAaSsKV47YNxBXZXEckQ==
X-Received: by 2002:a05:600c:524a:b0:498:28b:1025 with SMTP id 5b1f17b1804b1-4980c66c838mr110807225e9.5.1785666628770;
        Sun, 02 Aug 2026 03:30:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64? ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b59aefsm107355645e9.2.2026.08.02.03.30.27
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:30:28 -0700 (PDT)
Message-ID: <4e962542767f0d9f4fa29e6621ce93936be989d2.camel@linuxfoundation.org>
Subject: Fwd: [OE-core] [PATCH 00/25] Class file improvements
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs <docs@lists.yoctoproject.org>
Date: Sun, 02 Aug 2026 11:30:27 +0100
References: <18C7F641A8EDB50A.3252690@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="=-Qxpvo+1wlCFO4m7JTsEi"
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 02 Aug 2026 10:30:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10224

--=-Qxpvo+1wlCFO4m7JTsEi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hopefully the notes here can be the basis for migration notes for 6.1
for these changes.

Cheers,

Richard

--=-Qxpvo+1wlCFO4m7JTsEi
Content-Description: Forwarded message =?UTF-8?Q?=E2=80=94?= [OE-core]
 [PATCH 00/25] Class file improvements
Content-Disposition: inline;
	filename*0*=UTF-8''Forwarded%20message%20%E2%80%94%20%5BOE-core%5D%20%5BP;
	filename*1*=ATCH%2000%2F25%5D%20Class%20file%20improvements.eml
Content-Type: message/rfc822

Return-Path: <richard.purdie+caf_=rpurdie=rpsys.net@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on tim.rpsys.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0
 tests=ARC_SIGNED,ARC_VALID,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DMARC_PASS,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
Authentication-Results: tim.rpsys.net; dmarc=pass (p=none dis=none)
 header.from=lists.openembedded.org
Authentication-Results: tim.rpsys.net;	dkim=pass (2048-bit key;
 unprotected) header.d=lists.openembedded.org
 header.i=@lists.openembedded.org header.a=rsa-sha256 header.s=groups1
 header.b=N7KsLVFr;	dkim-atps=neutral
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])	by tim.rpsys.net (8.18.1/8.18.1/Debian-6~bpo12+1) with
 ESMTPS id 672AT81p3397370	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256
 bits=128 verify=NOT)	for <rpurdie@rpsys.net>; Sun, 2 Aug 2026 11:29:10 +0100
Resent-Message-Id: <202608021029.672AT81p3397370@tim.rpsys.net>
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-3811f512167so2472387a91.3        for <rpurdie@rpsys.net>;
 Sun, 02 Aug 2026 03:29:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1785666543; cv=pass;        d=google.com;
 s=arc-20260327;       
 b=WwHXk35YLaM1fVUzj6wr4NI0bQs0/sfapA6uzKJMtlsp5E8cnF1oRvYNMk//P/QdKR       
  l1Kz6uCj4U2BwsaZ9vLBEByoJSQGYWMqHX/3hyUBYIl79MImfldfej8hV0O0CWQWdszJ      
   DA9RWzXCacZFbwy/w6JD8JQ1idIgXbxqi4+0PZrDgWgtURMJPu3A1FtjGDCzGgMSNP3N     
    4h34l/pxgAc0s8vX4tyS36MyxcBUIGslr/PVos3Ydr5B8mzGkfg+rJRALqWHtj3xDBIi    
     cWmC2zSqmDyRNB4tF6VTWfswHG6l5vHQL2LiBqRM6bEE6Q2DFWDravVbIpdmWgUzfVI5   
      E+/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;       
 h=list-unsubscribe:list-unsubscribe-post:list-post:reply-to        
 :resent-from:resent-date:delivered-to:mailing-list:list-id:sender        
 :list-help:list-subscribe:precedence:mime-version:message-id:date        
 :subject:to:from:dkim-signature:delivered-to;       
 bh=YeAikIrgy82bmvII+C8LO9eVezj579NRsHoo3SwucFA=;       
 fh=zHJPk+CKF7pqHuqHkoGE3TBNTo2ON+sDznZCHdoOQm8=;       
 b=hMJkKLaIjrl1nUDFFZXXl7eBV0JnxHwUZNGzanahR9HS+Q/g74lxo0gCg8CiNoYk0F       
  Zxxzn3qzM7oin3cPWxwLFj0Qx688LmBxl+f9eL5u4j+AWOhNaIlTr+fhitf+1p1yEgQ0      
   0Gr3LDHsY/1+UjzWKo42RfxpCvLozUfGwYP1E1+9U2NTZiUotOiXnk+Fekqw8hgQ79/B     
    TxdvStelbBiaNJ/Is+7454CN8UzAJokDG+9Tt42ezrI6ZtX3qppztckC2o6HiyOmz5GU    
     l1+hzOo/VcIb+B0TbAdlYFaItUsWporXNcljl1pTxyp6jDjAV5MY9i6iKtL4aR1c8FGt   
      v9HQ==;        darn=rpsys.net
ARC-Authentication-Results: i=2; mx.google.com;       dkim=pass
 header.i=@lists.openembedded.org header.s=groups1 header.b=N7KsLVFr;      
 spf=pass (google.com: domain of
 bounce+67612+242525+1686473+8023802@lists.openembedded.org designates
 66.175.222.12 as permitted sender)
 smtp.mailfrom=bounce+67612+242525+1686473+8023802@lists.openembedded.org;  
     dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=lists.openembedded.org
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;       
 d=1e100.net; s=20251104; t=1785666543; x=1786271343;       
 h=content-type:list-unsubscribe:list-unsubscribe-post:list-post        
 :reply-to:resent-from:resent-date:delivered-to:mailing-list:list-id        
 :sender:list-help:list-subscribe:precedence:mime-version:message-id        
 :date:subject:to:from:x-gm-gg:dkim-signature:delivered-to        
 :x-forwarded-for:x-forwarded-to:x-gm-message-state:from:to:cc        
 :subject:date:message-id:reply-to:content-type;       
 bh=YeAikIrgy82bmvII+C8LO9eVezj579NRsHoo3SwucFA=;       
 b=UPBQu9jh3MVi/7TgDEUq9/EEI1Wm1Oowo/HptfXXiNOPJ4Um1qf0ewJsC1pJIOjpL7       
  tby9PU4SYH1+VGzTTDh4Tnth+X3t3kLkk7D62WAcRxxoTuU1ozFa1lZPRO1CNjjIMImj      
   WGf86zYrgO29YtIE6tHS5ve3XTDRxafc5Y44gL3OvfyXVZhos9LrEL0WAkeTxG9q49XR     
    iZkzoeRYZPkyCTZeujRxtKtnIvBjMfgR+lQc8XpyqK2mYDvU5I47fTHHImuSir0PBpUQ    
     k/g16PKhmls0uVN3aIUt9ffCA5AJ5oxFVkz3K28F3kazYtQxTKe4Bvnz2G1Y4g4mNr1r   
      KQ0A==
X-Forwarded-Encrypted: i=2;
 AHgh+RpBsflJJ5a3XjPCDlSI7je1YIEn2//wDVXQATl1yCkG3wJNoDD1mNFeCHT2Tgt2duEniXn3HtNL@rpsys.net
X-Gm-Message-State: 
 AOJu0YzveWssSluLgCdZ4wEQ5VQIEnXYyINCwmrtvvdm7NQ84kt2x44B
	elvhIzWWPD5gBFYAbdBt5n4TdymvMkv4OYpCC8UH8UyVw+AHbnMOniDMztTJx0wX8wButg66d07
	0HAFmHvni/bMspXcndvea8EnvonzlpC+s6BCBVDI5EIPSz0ptnGWaQr+8sOw4E7OeM8kCEApOgK
	E8dGya
X-Received: by 2002:a17:90b:4b87:b0:37f:ed7e:7e42 with SMTP id
 98e67ed59e1d1-38fbc48de22mr5274699a91.14.1785666543259;        Sun, 02 Aug
 2026 03:29:03 -0700 (PDT)
X-Forwarded-To: rpurdie@rpsys.net
X-Forwarded-For: richard.purdie@linuxfoundation.org rpurdie@rpsys.net
Delivered-To: richard.purdie@linuxfoundation.org
Received: by 2002:a05:7300:8b22:b0:315:579:9fd5 with SMTP id
 b34csp2253216dys;        Sun, 2 Aug 2026 03:29:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2;
 AHgh+Rp2ibaXwCCgCLDoV69JL0/QQKWgGdNvjFaT+r/1vFwHfd7/GpL7nfS9RLDWqaG0hKpZrkgtUzAgwb22FlYcew==@linuxfoundation.org
X-Received: by 2002:a05:6a00:2283:b0:845:c0db:3924 with SMTP id
 d2e1a72fcca58-84ee480a035mr4964427b3a.24.1785666540563;        Sun, 02 Aug
 2026 03:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785666540; cv=none;        d=google.com;
 s=arc-20260327;       
 b=T3y7rUmL0h5t5jYIbZ/kK8L4hVnB9/ZMQWbtwgCaL9xsjAj5uCEZymwgBbWatcnrnL       
  iRFVnN6ekYrkp9hTLizuiHO7AQLTkX9EkB8MVB0kLycA/kwQpeBGuvF8r4YugKkh/DnM      
   MAto0gYRfHfipC96Tu7Y4CKdv8jborT3yBgszRYaili7QKtzZ9p2FcwuKLh82AaXpKVI     
    /TqrNHFkoFUTxShRTVKFMX7M6SIM4mB3DFqoW1zHTIs69TP7K13rEIvnx45CjiMx4f2K    
     RhbbD83CpYXG9aOm1s/wZoBw5lsIOaLULLX60J4oFbwop0jLEFxfoJc8/wxQ87T9asjx   
      1uMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;       
 h=list-unsubscribe:list-unsubscribe-post:list-post:reply-to        
 :resent-from:resent-date:delivered-to:mailing-list:list-id:sender        
 :list-help:list-subscribe:precedence:mime-version:message-id:date        
 :subject:to:from:dkim-signature;       
 bh=YeAikIrgy82bmvII+C8LO9eVezj579NRsHoo3SwucFA=;       
 fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;       
 b=l7kAJ/liJ2dvRwzvDY2umvaj6ce7Wa2BEe8c/edY8HM6rLpHwmgomJZqhqQBDlTiPr       
  V3RI70DhHde+RSx6Fn4Eu2aSwiwTxO7MGWS0EXaXfKB8whqqYuSBzA7lgfyJqBewvZIj      
   KLiWBfurvk4uTxkfBxjJsYi9YJGVLj0QrUCFAhBLdRWbr4aTMXSDXHHkLESNpC9GyIh6     
    SDyyaBqmuVdWYUi+Defu+z5MHNjkc1TgmSL41uLA4QWz0LAp5ssYf9XQIHqfOUDB9W/5    
     GXsIdJD12Y6RhEByWr/ls3B1iRVd4I0I4c9tRfoN/JP/XieA1q3YxvzWjlYS0O/jgNi8   
      eing==;        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;       dkim=pass
 header.i=@lists.openembedded.org header.s=groups1 header.b=N7KsLVFr;      
 spf=pass (google.com: domain of
 bounce+67612+242525+1686473+8023802@lists.openembedded.org designates
 66.175.222.12 as permitted sender)
 smtp.mailfrom=bounce+67612+242525+1686473+8023802@lists.openembedded.org;  
     dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=lists.openembedded.org
Received: from web01.groups.io (web01.groups.io. [66.175.222.12])        by
 mx.google.com with ESMTPS id
 d2e1a72fcca58-84edbf360cdsi11222038b3a.23.2026.08.02.03.29.00        for
 <richard.purdie@linuxfoundation.org>        (version=TLS1_2
 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);        Sun, 02 Aug 2026
 03:29:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of
 bounce+67612+242525+1686473+8023802@lists.openembedded.org designates
 66.175.222.12 as permitted sender) client-ip=66.175.222.12;
Authentication-Results: mx.google.com;       dkim=pass
 header.i=@lists.openembedded.org header.s=groups1 header.b=N7KsLVFr;      
 spf=pass (google.com: domain of
 bounce+67612+242525+1686473+8023802@lists.openembedded.org designates
 66.175.222.12 as permitted sender)
 smtp.mailfrom=bounce+67612+242525+1686473+8023802@lists.openembedded.org;  
     dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=lists.openembedded.org
DKIM-Signature: a=rsa-sha256;
 bh=YeAikIrgy82bmvII+C8LO9eVezj579NRsHoo3SwucFA=; c=relaxed/relaxed;
 d=lists.openembedded.org;
 h=From:Subject:Date:Message-ID:To:Cc:In-Reply-To:References:Reply-To:Sender:List-Id:List-Post:List-Subscribe:List-Unsubscribe:List-Help:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=groups1; t=1785666539; v=1; x=1785925739;
 b=N7KsLVFrmyhaWHTHsAHqHNUBPdDoldRDs1b1u5N1T3a3l7svuOaJwdwqEq9DdpDjdE6oaEkn
 jErGNAAqp6j+bd1CAKPS3rgt4+YYO/gpMgxDhpsQXFTRyfDbOxT+OllU8y3/EqdEiNTtY16qxJ1
 oanZ9SDMKykgnee+vxJQdAFZWyOY8c6KMU/LzVOHE27LYqFEv+I9mKoX9/wIZfBpk5/FR4dg0Vk
 /AUW0i6vQIbkT3BkW5UYfirInq7TsieAfZPnQ6KhUsT0pe2SwfeA+lOSRPwU8DoJluzGo0BqzFi
 aMJHOInOdRkqOkykpFzhfdt3KYwPrZGXXQxmY7hR8w+6g==
X-Received: by 127.0.0.2 with SMTP id yhCWYY1687808x64WA1kdeWf; Sun, 02 Aug
 2026 03:28:59 -0700
X-Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51]) by mx.groups.io with SMTP id
 smtpd.msgproc01-g2.21173.1785666538475556201 for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:28:59 -0700
X-Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47362928f65so2430181f8f.2        for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:28:58 -0700
 (PDT)
X-Gm-Gg: 
 AR+sD10q3v2Qk0DZgh4FjeGvJApHBnRNrv+r+aKR470t5WQBBfmr+ekW6DawwB6y2BT
	nq4pJIlPgvAfctsCz9GvFVKyH/z85C9Jo4SCU77I1s2hCqOY4GsBlzd9dGqd1Z7ZNiabfPLhWQV
	rBynLPqwWplAMHdIN/Cbf+4VdJMBuyl4sTRBr2AG0YP0PvCgiIzRf3UVK3yxYN13Bw/gyQGPSeX
	uY+77c/8qtmNb2X/oe3RLIbI+amkYLKLPeSfVKPs07tFex1kVSO7vcFolXs1bA5Z28Mjlgm9fx+
	CRqZl+ymtQbiszTu3sQEci1OyJZxGBL++PcHVwSgbjV4RL2e6iS6VC9rXMlwcx0Rg2a+2JrWJ8r
	48M4Ryi+xXMWet0ELSFn0se1u0dHTeIWw+GAqhi3+IK+jPYPvdP4q7nfT64TLO/Xa7hea9fzeRe
	RKLOW9JuO4AvQDft/t6TRsCW2xx7qlzXXw2jCMyKYkvDa1IFeTrtPFNsMgfeGVd0eOxu3MHOwrG
	TWUJRdQLXXUO9SF8Q==
X-Received: by 2002:a05:600c:3148:b0:498:11b5:3ff7 with SMTP id
 5b1f17b1804b1-49811b54490mr57964055e9.18.1785666536370;        Sun, 02 Aug
 2026 03:28:56 -0700 (PDT)
X-Received: from max.int.rpsys.net
 ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])        by smtp.gmail.com with
 ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.28.55    
    for <openembedded-core@lists.openembedded.org>        (version=TLS1_3
 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);        Sun, 02 Aug 2026
 03:28:55 -0700 (PDT)
From: "Richard Purdie via lists.openembedded.org" <richard.purdie=linuxfoundation.org@lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 00/25] Class file improvements
Date: Sun,  2 Aug 2026 11:28:29 +0100
Message-Id: <18C7F641A8EDB50A.3252690@lists.openembedded.org>
MIME-Version: 1.0
Precedence: Bulk
List-Subscribe: <mailto:openembedded-core+subscribe@lists.openembedded.org>
List-Help: <mailto:openembedded-core+help@lists.openembedded.org>
Sender: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
Mailing-List: list openembedded-core@lists.openembedded.org; contact
 openembedded-core+owner@lists.openembedded.org
Delivered-To: mailing list openembedded-core@lists.openembedded.org
Resent-Date: Sun, 02 Aug 2026 03:28:59 -0700
Resent-From: richard.purdie@linuxfoundation.org
Reply-To: richard.purdie@linuxfoundation.org
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-Orig-Message-Id: 
 <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
List-Unsubscribe: 
 <https://lists.openembedded.org/g/openembedded-core/leave/8023802/1686473/1172469861/plugh>
Content-Type: multipart/mixed; boundary="y1OSL9U6lb4DnX5MUpCv"
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-Virus-Scanned: clamav-milter 1.4.3 at tim
X-Virus-Status: Clean

--y1OSL9U6lb4DnX5MUpCv
Content-Transfer-Encoding: 8bit

This series starts to clean up a few class file issues. The general theme is
to move python functions into lib/oe and out of the class files.

It does separate out "kernel" from barebox and u-boot which removes certain
headaches.

The series does break some things, notably:

* the get_kernel*() functions are now oe.kernel.get*()
* kernel-arch no longer exports or sets ARCH and UBOOT_ARCH, there are
  functions you can use to get the values instead
* ARCH and UBOOT_ARCH are not exported into the environment in most cases
* the default kernel build make commands now sets ARCH
* various utils.bbclass python functions are now oe.utils.XXX()
* most sanity.bbclass functions are now oe.sanity.XXX()
* the 'valid_arches' variable is no longer available to change ARCH
* the linux-kernel-base class was removed
* lsb_distro_identifier is now always oe.lsb.distro_identifier()

The changes to adapt should hopefully not be too onerous and should
give us a cleaner code base which is easier to follow with a better data 
store memory usage profile.

There is more work to be done along these lines but this is a start...

Richard Purdie (25):
  sstatesig: Use kernel.bbclass instead of linux-kernel-base.bbclass
  linux-kernel-base: Delete unused function
  lib/oe/kernel: Move python functions from linux-kernel-base to library
    code
  kernel-yocto: Simplify code for cleanliness and slight performance
  kernel-arch: Move kernel and uboot arch functions to lib/oe/kernel.py
  kernel-arch: Simplify KERNEL_ARCH variable usage
  kernel-arch: Don't export UBOOT_ARCH
  u-boot: Separate out from kernel-arch.bbclass
  barebox: Separate out from kernel-arch.bbclass
  lib/oe/kernel: Simplify map_uboot_arch
  image_types/kernel-uimage: Swap UBOOT_ARCH for
    oe.kernel.map_uboot_arch call
  kernel-fit-image: Swap UBOOT_ARCH for oe.kernel.map_uboot_arch call
  linux-yocto-fitimage: Set UBOOT_ARCH
  kernel-arch: Drop UBOOT_ARCH
  linux-libc-headers: Drop kernel-arch and set ARCH directly
  toolchain-scripts: Drop usage of kernel-arch
  kernel-arch: Move ARCH usage into target classes
  linux-yocto-fitimage: Drop obsolete dependency on linux-kernel-base
  linux-kernel-base: Fold remainder into kernel-arch and drop
  kernel-devicetree: Add missing function prefixes
  utils: Drop explode_deps function
  utils: Move functions from utils.bbclass to utils.py
  lib/oe/lsb: Merge distro_identifier functions
  sanity: Move code to lib/oe
  sanity: Drop unreachable code

 meta/classes-global/base.bbclass              |   14 +-
 meta/classes-global/package.bbclass           |    2 +-
 meta/classes-global/sanity.bbclass            | 1050 +----------------
 meta/classes-global/utils.bbclass             |   93 --
 meta/classes-recipe/barebox.bbclass           |    4 +-
 meta/classes-recipe/cross-canadian.bbclass    |    2 +-
 meta/classes-recipe/devicetree.bbclass        |    4 +-
 meta/classes-recipe/image.bbclass             |    4 +-
 meta/classes-recipe/image_types.bbclass       |    4 +-
 meta/classes-recipe/kernel-arch.bbclass       |   80 +-
 meta/classes-recipe/kernel-devicetree.bbclass |    8 +-
 meta/classes-recipe/kernel-fit-image.bbclass  |    4 +-
 meta/classes-recipe/kernel-uimage.bbclass     |    2 +-
 meta/classes-recipe/kernel-yocto.bbclass      |   10 +-
 meta/classes-recipe/kernel.bbclass            |   19 +-
 meta/classes-recipe/kernelsrc.bbclass         |    6 +-
 meta/classes-recipe/linux-kernel-base.bbclass |   62 -
 meta/classes-recipe/module-base.bbclass       |    1 +
 meta/classes-recipe/populate_sdk_base.bbclass |   10 +-
 meta/classes-recipe/populate_sdk_ext.bbclass  |    2 +-
 meta/classes-recipe/testimage.bbclass         |    2 +-
 meta/classes-recipe/toolchain-scripts.bbclass |    4 +-
 meta/classes/multilib.bbclass                 |    2 +-
 meta/classes/report-error.bbclass             |    2 +-
 meta/classes/sign_ipk.bbclass                 |    4 +-
 meta/classes/sign_package_feed.bbclass        |    4 +-
 meta/classes/sign_rpm.bbclass                 |    6 +-
 meta/conf/multilib.conf                       |    2 +-
 meta/lib/oe/__init__.py                       |    2 +-
 meta/lib/oe/kernel.py                         |   88 ++
 meta/lib/oe/lsb.py                            |   10 +-
 meta/lib/oe/sanity.py                         | 1032 ++++++++++++++++
 meta/lib/oe/sstatesig.py                      |    2 +-
 meta/lib/oe/utils.py                          |   85 ++
 meta/lib/oeqa/sdk/testsdk.py                  |    2 +-
 meta/recipes-bsp/u-boot/u-boot.inc            |    7 +-
 meta/recipes-core/glibc/glibc-ld.inc          |    2 +-
 meta/recipes-core/meta/dummy-sdk-package.inc  |    2 +-
 meta/recipes-core/meta/meta-environment.bb    |    2 +-
 meta/recipes-core/meta/meta-go-toolchain.bb   |    2 +-
 .../packagegroups/packagegroup-core-sdk.bb    |    4 +-
 .../packagegroup-cross-canadian.bb            |    6 +-
 .../packagegroup-go-cross-canadian.bb         |    2 +-
 .../packagegroup-rust-cross-canadian.bb       |    2 +-
 .../linux-libc-headers/linux-libc-headers.inc |    4 +-
 .../linux/linux-yocto-fitimage.bb             |    6 +-
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |    8 +-
 meta/recipes-kernel/perf/perf.bb              |    4 +-
 48 files changed, 1323 insertions(+), 1356 deletions(-)
 delete mode 100644 meta/classes-recipe/linux-kernel-base.bbclass
 create mode 100644 meta/lib/oe/kernel.py
 create mode 100644 meta/lib/oe/sanity.py


--y1OSL9U6lb4DnX5MUpCv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#242525): https://lists.openembedded.org/g/openembedded-=
core/message/242525
Mute This Topic: https://lists.openembedded.org/mt/120561012/1686473
Group Owner: openembedded-core+owner@lists.openembedded.org
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [rich=
ard.purdie@linuxfoundation.org]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--y1OSL9U6lb4DnX5MUpCv--


--=-Qxpvo+1wlCFO4m7JTsEi--

