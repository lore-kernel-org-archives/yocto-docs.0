Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D18CD1284
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 12:27:06 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.16331.1712838423613388576
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 05:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mnh1J7XH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-34665dd7610so821615f8f.3
        for <docs@lists.yoctoproject.org>; Thu, 11 Apr 2024 05:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1712838422; x=1713443222; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:autocrypt:references:date:to:from:subject
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JRKeCuNw8wcmyH851SWsw9W/LJSbqOcdX+HEPEpQjYU=;
        b=Mnh1J7XHiEDZJLL6gvfETApQFBrUADnX5iaw2oBRPfhLJtiipQFCn7UeCnl0ypHSmz
         YVge+Tw+nBOjTBuvcUJaUkWFSm7AO60+MbbHHsNu4Mh0KoBFac++jYXqtb9+MemE4nGh
         JZU3+sOlBQDm52c880/zli4Zmu5bdTtz6PWmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712838422; x=1713443222;
        h=mime-version:user-agent:autocrypt:references:date:to:from:subject
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRKeCuNw8wcmyH851SWsw9W/LJSbqOcdX+HEPEpQjYU=;
        b=EreJh/kNwAVB6uyGUcmkYltpGNwx7c6PStwju5xi5xYt6xZzaVmBuhfersF1hpuRLT
         +JgmQ8U+ysJ9ytEvrGuUhteBwncNqefsJsObXT2qVxdDpr73jMHHrkPLRxNARiR3+WRm
         l38+vNoBixmCAi5ZNvW1t7o4U/6McHO9xAcVdFmFmF2AjOdTDhsfRfEU5fInjVUlBXAi
         ZL2kroPAp+79hUO+3PGoDkZfTSQAa2UyFr2JWxkdlTJUaOhMt8a4YqNKTgUz+BvMYhqs
         g/TnuObo2GLdJRzWPccnEishJMX3Mgys65wmZ04jn7fnC2e53BssWwjeKHvBBUc7Iw2R
         VlSg==
X-Gm-Message-State: AOJu0YyRJaCc0l806aZW6IS7JrolnzNBpN9AVDIWsVuK3q5s/0tO8KV2
	fA5JKmqYs0olK1FsBckSGQD7UyUdWHAFcJh6Fxn24SCQUm9lA/JwZsF+47v4vwC80vVtumvy2jL
	DBxY=
X-Google-Smtp-Source: AGHT+IH9itCd/fZ7OiL6z6KHYusRuTSrMeQPrr9BMS0pCjk3d2B4/Ts/6uz8TKv5wTMQtehA/ezjkQ==
X-Received: by 2002:a05:6000:4025:b0:346:c706:ae67 with SMTP id cp37-20020a056000402500b00346c706ae67mr943812wrb.55.1712838421570;
        Thu, 11 Apr 2024 05:27:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1824:5b7d:2973:625e? ([2001:8b0:aba:5f3c:1824:5b7d:2973:625e])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d4e05000000b0033b48190e5esm1657204wrt.67.2024.04.11.05.27.01
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 05:27:01 -0700 (PDT)
Message-ID: <ff0e2a74b5fa86ebd92c6dff32f4e97d972683d7.camel@linuxfoundation.org>
Subject: Fwd: [bitbake-devel] [PATCH] doc/user-manual: Add BB_LOADFACTOR_MAX
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs <docs@lists.yoctoproject.org>
Date: Thu, 11 Apr 2024 13:27:00 +0100
References: <17C5395EDB80122A.4467@lists.openembedded.org>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: multipart/mixed; boundary="=-fHz1lgEg8HtncuEgOQuV"
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Apr 2024 12:27:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5111

--=-fHz1lgEg8HtncuEgOQuV
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Sharing with the docs list too...

Cheers,

Richard

--=-fHz1lgEg8HtncuEgOQuV
Content-Disposition: inline
Content-Description: Forwarded message =?UTF-8?Q?=E2=80=94?= [bitbake-devel]
 [PATCH] doc/user-manual: Add BB_LOADFACTOR_MAX
Content-Type: message/rfc822

Return-Path: <richard.purdie+caf_=rpurdie=rpsys.net@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on dan.rpsys.net
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=6.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
Authentication-Results: dan.rpsys.net; dkim=pass (2048-bit key;
 unprotected) header.d=lists.openembedded.org
 header.i=@lists.openembedded.org header.a=rsa-sha256 header.s=20240206
 header.b=HGaqF1jj; dkim-atps=neutral
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182]) by dan.rpsys.net (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 43BCQL5A231640 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256
 bits=128 verify=NOT) for <rpurdie@rpsys.net>; Thu, 11 Apr 2024 13:26:23
 +0100
Resent-Message-Id: <202404111226.43BCQL5A231640@dan.rpsys.net>
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dcc84ae94c1so8141549276.1 for <rpurdie@rpsys.net>; Thu, 11 Apr
 2024 05:26:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1712838316; cv=pass; d=google.com;
 s=arc-20160816;
 b=kAButSdM+DOWVzlAN0kd1qV80y16nfKnWeiD1NAesqKaeAcaFELg/+TYsgHWNRVZXp
 CjtX6fY4iStlBgcjHAXnlvZI6f6TfebTsCsDIlhDEHOJ9X6mT1CJsbbpnu4jJlN04SEb
 3WSWUAHU8kvvu+p55fOjzaUaw40mQeOXadyEMlQUZhMd39m0fVT5/2eCBgDFPvhn0Ekg
 3Q/xgMhR7Mi3v07ZIMPwebih2Ml6WFqu6+xEqbnef9dUN8irHAan49ra9S00zMopN81E
 zKRKP/47owtJNJ2Ht1Bu9jqEid2tfFNtY9oXtWf/YtPDTS36xBpLy1J7gHnxThu39F+z A9HA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816; h=reply-to:list-unsubscribe:list-unsubscribe-post:list-post
 :resent-from:resent-date:delivered-to:mailing-list:list-id:sender
 :list-help:list-subscribe:precedence:mime-version:message-id:date
 :subject:to:from:dkim-signature:delivered-to;
 bh=lG2WfVp/Y9LJ7Bp4L/GbQkc7MyJko1OeAIXAe3eJojA=;
 fh=C33vMOZ5pLcha9+sCNCr8hhk9iKpOpLoDbkMGQ/+I20=;
 b=edlA7RYh12LHeSedj0b+cdB76foVeN9v+akbfEPYntGyac2y3zGXum9tRAFC/G6q47
 mOcQQgsUEyJcggf3R2tNCxX8TluIuVQzLCt0okC0Hm5cyfdXbHDKuQB6Uy7/DizFpt2T
 +jeigw3b2Rex9gVrpzr3ofkC/1WTsGTtnIVvrBE6UDLzbI6YHmHL9yntYU1aDk15V4Tx
 W33Hm1rP0CqGoeeMWDLQWIuH/noHKPUho3vXls+Gkv4zJgm0BR9cEtD6cY+w8ppHVVI+
 BNs8s9FzWpXLUXZhIynbSwqe6vou9O3P8Al299PtCeNnw7x7ZtXHr5jO3qPg0Devr2Bt
 MTiA==; darn=rpsys.net
ARC-Authentication-Results: i=2; mx.google.com; dkim=pass
 header.i=@lists.openembedded.org header.s=20240206 header.b=HGaqF1jj;
 spf=pass (google.com: domain of
 bounce+67608+16070+1686473+8021810@lists.openembedded.org designates
 66.175.222.12 as permitted sender)
 smtp.mailfrom=bounce+67608+16070+1686473+8021810@lists.openembedded.org;
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=lists.openembedded.org
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1e100.net;
 s=20230601; t=1712838316; x=1713443116;
 h=reply-to:list-unsubscribe:list-unsubscribe-post:list-post
 :resent-from:resent-date:delivered-to:mailing-list:list-id:sender
 :list-help:list-subscribe:precedence:mime-version:message-id:date
 :subject:to:from:dkim-signature:delivered-to:x-forwarded-for
 :x-forwarded-to:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to; bh=lG2WfVp/Y9LJ7Bp4L/GbQkc7MyJko1OeAIXAe3eJojA=;
 b=FFbkYZuO/i/EKstnwwAay31fxPU7X2fWAIVkNMWr3jXkDyWU70fONlQ/r4nZq+/4IW
 fHx0vfMFsnAUKWOTyHIGNlwLay67RIiDj4KJdkVKabxF6mFSu6+xEb+JrE6K7qWSQVZG
 +IkXM6fzHnr8B89CxmXB68tzeW2BAuKvMagU7xyNkyQjmNzMi+iGQVIkbf5xqgovOCDF
 +H1u0IIUMJ/PLRyK3oiJK3Xru08HL4fSPLQoRTnna74BIeoogjulCYgG1lNFYgVGnbf1
 KhXYv8AblhcavKEfRjfSHxB4lYt46GkVALETfN0tr26Vjw91wJndZ5zIsMwRLljdp6RB SLUg==
X-Forwarded-Encrypted: i=2;
 AJvYcCURcLa5X87dGNU2LEuhN0kBMJUCwzKpkeO/tgIVJtHimkU+vTCoP+z7zOWU3iHJRdvwsXK7pLDv/vp63VTpQUO3Jg==
X-Gm-Message-State: 
 AOJu0YzFk+/o5x+zGD0IngVQOuajy8hzyd+mMkqL/1MNUhMYlkuQtyRH
 SPPOlq+f41xdX2MqNxn3F5p9nKdR0TrWLVq+5gpxpSITF0cyJjrA2XUQe73vTCJ/F8KPFfjBleI
 5xrQVeBLdS1PbRICDBeIkMdCwy7jK5emUCURrjPHklt/UjgnvyNiKz5eT2JJlkjbX5oChxuQmlz
 ec
X-Received: by 2002:a25:a345:0:b0:dd1:398b:3f33 with SMTP id
 d63-20020a25a345000000b00dd1398b3f33mr5251966ybi.16.1712838316534; Thu, 11
 Apr 2024 05:25:16 -0700 (PDT)
X-Forwarded-To: rpurdie@rpsys.net
X-Forwarded-For: richard.purdie@linuxfoundation.org rpurdie@rpsys.net
Delivered-To: richard.purdie@linuxfoundation.org
Received: by 2002:a05:7010:2d29:b0:3bf:3404:6b2 with SMTP id
 fy41csp1118816mdb; Thu, 11 Apr 2024 05:25:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2;
 AJvYcCWHKVFuOoazgdqps7QbjsrEnTO3lssYdRNHqHVdJYTqbXrATU9nCcJazdodIhs/zIcan74gjoAOszMs1mII6VWuxx5bjcjx6u5Xp2YPnRiYOUTa
X-Google-Smtp-Source: 
 AGHT+IGp4V76lqa8wshLvPKO9GNXKwWeJnT6eWJ1oK/E8jI/51V8KZ3InIREpdLBvfg3H2xUghfT
X-Received: by 2002:a17:902:f705:b0:1e1:a54:1e44 with SMTP id
 h5-20020a170902f70500b001e10a541e44mr6632439plo.16.1712838314245; Thu, 11
 Apr 2024 05:25:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712838314; cv=none; d=google.com;
 s=arc-20160816;
 b=HgtT4yyms/G3Qng4Nj45BI37Jf//lnQl3y2VyuhwULkl3OQq/z+J5UKSgu+Dlg9/D+
 F7DuzF1LmumCmyEmKrHsveffKej7aGGwA/J4H+Q2dRq5bsjyy+xlfcuwtWpDzL3TejSO
 CdQ1tTGEXlIlF2IZdfnvDXMKbGKVKsFevssoWmEHANsJGCuT7hkDLqT95l1N3UJoC8O6
 mcPXcjXuggqVV9RCd1to2TYTlN1b1MPDzuXCaYn2ZwkKGYD5kUGUV2EVFdWeY3Xf0tH/
 jaeST3c3VUKBoKBpFd/Kg7QDHljR6PV2GxZHRFlFreBjKO2sT+OWIJmpCNratpawfv9E VKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816; h=reply-to:list-unsubscribe:list-unsubscribe-post:list-post
 :resent-from:resent-date:delivered-to:mailing-list:list-id:sender
 :list-help:list-subscribe:precedence:mime-version:message-id:date
 :subject:to:from:dkim-signature;
 bh=lG2WfVp/Y9LJ7Bp4L/GbQkc7MyJko1OeAIXAe3eJojA=;
 fh=4cv8OkrADdXrYqq9g0hWQIrZEgXUgKDcZ+KmKKbZ1O0=;
 b=E2ee6+Z/rDeKMg/vwMasbPw7NlBR3a6RgoCl67LCN/1UEcZHbUnGrBN7GnX+uxptU4
 FpDaFnPKAROlOLlLd4NZmABYBYHG9dNodJuj+DcKbMzIHwwR93HioIV/2BHpQ9sYEDJf
 Sh8ncxUhc0rduxzLrjJsUtc9OesB88GKa7GKITyi3JDaLlf+/osUzxhdLMxqBVx4LBaf
 o7SXmzG9Y8DWzBDmk6NswxpCkL4HwdmBAn1brE5f9kROzx3smngktdkeiGB6GWyhYlhj
 w0dB/zn5Wf+vOJ0/3E4reBiEeV6SlRrELBSYALGbbCVO0GiZdPiWhE1L8T9VKwPGT6j2
 e/gA==; dara=google.com
ARC-Authentication-Results: i=1; mx.google.com; dkim=pass
 header.i=@lists.openembedded.org header.s=20240206 header.b=HGaqF1jj;
 spf=pass (google.com: domain of
 bounce+67608+16070+1686473+8021810@lists.openembedded.org designates
 66.175.222.12 as permitted sender)
 smtp.mailfrom=bounce+67608+16070+1686473+8021810@lists.openembedded.org;
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=lists.openembedded.org
Received: from web01.groups.io (web01.groups.io. [66.175.222.12]) by
 mx.google.com with ESMTPS id
 ma7-20020a170903094700b001e23c715c14si1228555plb.297.2024.04.11.05.25.13
 for <richard.purdie@linuxfoundation.org> (version=TLS1_3
 cipher=TLS_AES_128_GCM_SHA256 bits=128/128); Thu, 11 Apr 2024 05:25:14
 -0700 (PDT)
Received-SPF: pass (google.com: domain of
 bounce+67608+16070+1686473+8021810@lists.openembedded.org designates
 66.175.222.12 as permitted sender) client-ip=66.175.222.12;
Authentication-Results: mx.google.com; dkim=pass
 header.i=@lists.openembedded.org header.s=20240206 header.b=HGaqF1jj;
 spf=pass (google.com: domain of
 bounce+67608+16070+1686473+8021810@lists.openembedded.org designates
 66.175.222.12 as permitted sender)
 smtp.mailfrom=bounce+67608+16070+1686473+8021810@lists.openembedded.org;
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=lists.openembedded.org
DKIM-Signature: a=rsa-sha256;
 bh=rq1LC9fH5ukl7DJaOAoCTPEmVZEDSL3oUrt3stJa0q4=; c=relaxed/simple;
 d=lists.openembedded.org;
 h=From:To:Subject:Date:Message-Id:MIME-Version:Precedence:List-Subscribe:List-Help:Sender:List-Id:Mailing-List:Delivered-To:Resent-Date:Resent-From:List-Post:List-Unsubscribe-Post:List-Unsubscribe:Reply-To:Content-Type;
 s=20240206; t=1712838313; v=1;
 b=HGaqF1jjmQIW3uqJyq/cwNhIxCt/TfqhzFvj2oyQyI8vsA3gYxOdLaId3YfQrXNLQzbBVKCc
 HfKjxroVVRKMftLVWr3/Q/aAUvlCQ4YMtfUsx2N0195GO2AT3dWIiD2maV297/oBPxJXPlL0SNX
 pn4WhzweBVmIdTv6DNTigj9eue8M/l5+7APLRQUzH+rrKWc8UAL37So5dBsruTGxBSyRr+5S4IC
 tDIkLxVp1T9qzHP+nxR8mRMrfNPIOCK/PwetI3x0Zt61U52EyTi58CTwQmoSiw5FvkSIBoiuL3g
 +xlSkhGuAxp8cWUz4XeU6xiTGNhxakneCMEuA9bAdMjFA==
X-Received: by 127.0.0.2 with SMTP id xNYPYY1687808x428gOaPo4M; Thu, 11 Apr
 2024 05:25:13 -0700
X-Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52]) by mx.groups.io with SMTP id
 smtpd.web10.16497.1712838311905826692 for
 <bitbake-devel@lists.openembedded.org>; Thu, 11 Apr 2024 05:25:12 -0700
X-Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4155819f710so60867165e9.2 for
 <bitbake-devel@lists.openembedded.org>; Thu, 11 Apr 2024 05:25:11 -0700
 (PDT)
X-Received: by 2002:a05:600c:a4b:b0:414:726:87d9 with SMTP id
 c11-20020a05600c0a4b00b00414072687d9mr5209542wmq.12.1712838309999; Thu, 11
 Apr 2024 05:25:09 -0700 (PDT)
X-Received: from max.int.rpsys.net
 ([2001:8b0:aba:5f3c:1824:5b7d:2973:625e]) by smtp.gmail.com with ESMTPSA id
 d4-20020adfc084000000b00343c1cd5aedsm1665889wrf.52.2024.04.11.05.25.09 for
 <bitbake-devel@lists.openembedded.org> (version=TLS1_3
 cipher=TLS_AES_256_GCM_SHA384 bits=256/256); Thu, 11 Apr 2024 05:25:09
 -0700 (PDT)
From: "Richard Purdie via lists.openembedded.org" <richard.purdie=linuxfoundation.org@lists.openembedded.org>
To: bitbake-devel@lists.openembedded.org
Subject: [bitbake-devel] [PATCH] doc/user-manual: Add BB_LOADFACTOR_MAX
Date: Thu, 11 Apr 2024 13:25:08 +0100
Message-Id: <17C5395EDB80122A.4467@lists.openembedded.org>
MIME-Version: 1.0
Precedence: Bulk
List-Subscribe: <mailto:bitbake-devel+subscribe@lists.openembedded.org>
List-Help: <mailto:bitbake-devel+help@lists.openembedded.org>
Sender: bitbake-devel@lists.openembedded.org
List-Id: <bitbake-devel.lists.openembedded.org>
Mailing-List: list bitbake-devel@lists.openembedded.org; contact
 bitbake-devel+owner@lists.openembedded.org
Delivered-To: mailing list bitbake-devel@lists.openembedded.org
Resent-Date: Thu, 11 Apr 2024 05:25:12 -0700
Resent-From: richard.purdie@linuxfoundation.org
List-Post: <mailto:bitbake-devel@lists.openembedded.org>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-Orig-Message-Id: 
 <20240411122508.2149106-1-richard.purdie@linuxfoundation.org>
List-Unsubscribe: 
 <https://lists.openembedded.org/g/bitbake-devel/leave/8021810/1686473/288854118/plugh>
Reply-To: richard.purdie@linuxfoundation.org
Content-Type: multipart/mixed; boundary="9eFl7Nm9RgeLSi4uZX5H"
X-Virus-Scanned: clamav-milter 0.103.11 at dan
X-Virus-Status: Clean

--9eFl7Nm9RgeLSi4uZX5H
Content-Transfer-Encoding: 8bit

Document BB_LOADFACTOR_MAX which was recently added.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../bitbake-user-manual-ref-variables.rst                | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
index d3936935cd..00faeea686 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
@@ -432,6 +432,15 @@ overview of their function and contents.
       ``ConfigParsed`` event can set the variable to trigger the re-parse.
       You must be careful to avoid recursive loops with this functionality.
 
+   :term:`BB_LOADFACTOR_MAX`
+      Setting this to a value will cause bitbake to check the system load
+      average before executing new tasks. If the load average is above the
+      the number of CPUs multipled by this factor, no new task will be started
+      unless there is no task executing. A value of "1.5" has been found to
+      work reasonably. This is helpful for systems which don't have pressure
+      regulation enabled, which is more granular. Pressure values take
+      precedence over loadfactor.
+
    :term:`BB_LOGCONFIG`
       Specifies the name of a config file that contains the user logging
       configuration. See
-- 
2.40.1


--9eFl7Nm9RgeLSi4uZX5H
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#16070): https://lists.openembedded.org/g/bitbake-devel/=
message/16070
Mute This Topic: https://lists.openembedded.org/mt/105461244/1686473
Group Owner: bitbake-devel+owner@lists.openembedded.org
Unsubscribe: https://lists.openembedded.org/g/bitbake-devel/unsub [richard.=
purdie@linuxfoundation.org]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--9eFl7Nm9RgeLSi4uZX5H--


--=-fHz1lgEg8HtncuEgOQuV--

