Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8587DE77188
	for <webhook@archiver.kernel.org>; Wed, 25 Dec 2024 01:04:11 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.899.1735088649346337990
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Dec 2024 17:04:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=paY59/aE;
 spf=pass (domain: linaro.org, ip: 209.85.222.172, mailfrom: javier.tia@linaro.org)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b70e78351aso442975385a.0
        for <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 17:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735088648; x=1735693448; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTmzGoNP0j052pC+71Q4osRtAwXhUWA+EqPLcLhFnKk=;
        b=paY59/aE/0LLJnajMUljcaEnOX6V9Mz7eup9DUsRNRJJi9Uqn854vnsmaXNnJ5Poct
         TgZ42Xjnnhrporsc8JyrL7UqnCpSi+5dV37oa2/12gvA9qb8qy7wa5boY/Yoieys5Oj1
         WCfvb5vy/iyHJlsH2EteyMpgK67AwaLjB30gHhddfrO1sN9agxyzlBzwzM4279ogwN8d
         tIserIUv/tjundqKoZCqAmqEEEKS1J411NGqPn8+ZiB95jWmCD4xN2VfsC/FTv3ZfWhY
         c9i3HTWtXhhvV7LxQ24B3K/OEEUbhBtIlmUuAX4wQYpqrs+A3atpPMbxZZtMAvrBnRRA
         qhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735088648; x=1735693448;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lTmzGoNP0j052pC+71Q4osRtAwXhUWA+EqPLcLhFnKk=;
        b=keGWfneGdXJ/aioBoeVPFVExSDkyNd+bks9BGPpBlVVNXD/8QG4Cw81ixU2frOVZPb
         ZKnTohUN3jJhH7XK4JQb60T9crN+ElXY53CTOx+hCzoYM3HELKrdBusix4hXBBu72ZMc
         EIl5S0gJf9quHfXdW5k7mk8JPcomAebaCqSh12uDZheQ7f4yyE1M4f1p+x+b/+TN5uMJ
         Dhu2y1LgiLBvtq17hQzdSeJ5Tb0wPeGHeiXqeAxTAsRtSHPPL3RtGWfNahP+COwQ+YH8
         hANS+LTg+HArJELnwzg9D9RB2nytO3+O+iYJmkyfTckr00xkvBvGnaig/lZiX4PDvvPq
         17dg==
X-Forwarded-Encrypted: i=1; AJvYcCWqoV+vJndQoxz/cPwk3VDGy2qeKvXWJxisbpxLBKOEM1yahWEpbDhU5EeIEtCfnDuThoi/@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxNhduz0zJjcuvdXh64K7TXUrMwdj4Fn5+M6W1+WhxMDwTp1f0/
	GEUCoD1E7YVmjC77KMUEsMqdFN6Wu3aJSiZIBtQMi+rJT00fw/H/5eKeWqEH0yo=
X-Gm-Gg: ASbGncv2pKLZVOUB+0YGhDUbPBszVtBTuROl3gJWC9gDQYyffK8fBl/U0IdMA1fvuoe
	NhZi1IeDBwuzWutBvC8foDRmXLDnJR5js6E7UEIcfOX7JHsv65hL5/VKcqlX4QIRrpV20Z2719F
	nv4YkyvGK9cvj+S77Z4P64av41vT5c7vQ8gPWeME2/8Dt88hBlKg3mGbC8ZjVwcKAwEQOHoUL/K
	M0qj45PLvw9mdgIfXjuk8I6vTm+/UgoZKRHvX+c3JVRdQO8OxLLeHu+0ZzStuEs8/UfbuC643RQ
	cgpeqMGhHAHsYzZQx0a0qNrHFaNEmlvmowdH0x8B8u32O/s8
X-Google-Smtp-Source: AGHT+IH717Bua7FSQ9t551JHNCd8PrcP+gRLInczW9vqmZNR/IDevd3vNclvH/ksJo58seaU/ZLJsg==
X-Received: by 2002:a05:620a:8006:b0:7b6:e9ba:2853 with SMTP id af79cd13be357-7b9ba7bc17amr3417639785a.35.1735088648409;
        Tue, 24 Dec 2024 17:04:08 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac4efd18sm508792185a.128.2024.12.24.17.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 17:04:07 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 643DB1200078;
	Tue, 24 Dec 2024 20:04:07 -0500 (EST)
Received: from phl-imap-09 ([10.202.2.99])
  by phl-compute-01.internal (MEProxy); Tue, 24 Dec 2024 20:04:07 -0500
X-ME-Sender: <xms:B1prZ0GEZd53M8391h5lRBC7E_yQnwPAAgSqYxuGI8eVcIwq_CvADg>
    <xme:B1prZ9XR7Xc-l6a6KiIBl_k5JgRwYCaQWq-0JHDMUvBa3fMLE5peMUaQNRoSYbgvt
    xNWx402JzARjlaeoAU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudduhedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfgrvhhivghrucfvihgrfdcuoehjrghvihgvrhdrthhirgeslhhinh
    grrhhordhorhhgqeenucggtffrrghtthgvrhhnpeefjedvtdetffekfefgudeukefgudeg
    udfggfetkeekheelieeuhefhkefgveevhfenucffohhmrghinhephihotghtohhprhhojh
    gvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepjhgrvhhivghrodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduhe
    dvkeekleehkeefqdefudefieegvdeliedqjhgrvhhivghrrdhtihgrpeeplhhinhgrrhho
    rdhorhhgsehjvghtmhdrmhgvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehilhhirghsrdgrphgrlhhoughimhgrsheslhhinhgrrhhordho
    rhhgpdhrtghpthhtohepmhhikhhkohdrrhgrphgvlhhisehlihhnrghrohdrohhrghdprh
    gtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihho
    nhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtg
    htrdhorhhg
X-ME-Proxy: <xmx:B1prZ-INhNhWnwtXmWe-ykDfvvyvo5ZEK3tSWC6BcBkMrMJlIFPB_A>
    <xmx:B1prZ2Fh7uEff_J7O6I_No0QhSRHoOzEaY0Uki1bIvb37ttIu8v34A>
    <xmx:B1prZ6VgrH34a0_HOSs1tYZF1_fZ0QBTi6qdeQEV36ez4MtGsTDJbA>
    <xmx:B1prZ5MAPBAECdDFhOu76_ozfhYqb_4v1djuVzTlBiduRT0PKzxhmQ>
    <xmx:B1prZx3iMUZW4uPJhMpFP1gG1CWOVlzUKMUPqQU2DGht66iJJpiW98Nl>
Feedback-ID: idd3648b2:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3C93D780068; Tue, 24 Dec 2024 20:04:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 24 Dec 2024 19:02:52 -0600
From: "Javier Tia" <javier.tia@linaro.org>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
Cc: "Mikko Rapeli" <mikko.rapeli@linaro.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>
Message-Id: <a3aa1b36-b11a-4fa7-a6bb-98ae64ab5f61@app.fastmail.com>
In-Reply-To: 
 <42f3567668e35a5398dbbeefc408d71e90292463.camel@linuxfoundation.org>
References: <20241224221625.4092917-1-javier.tia@linaro.org>
 <0fc165187afd965a79989a412d16bc77271248a3.camel@linuxfoundation.org>
 <d507bfc4-a4ab-45e8-adee-6503896fc045@app.fastmail.com>
 <42f3567668e35a5398dbbeefc408d71e90292463.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] Set max supported Python version
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Dec 2024 01:04:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6033

Hi Richard,

On Tue, Dec 24, 2024, at 5:22 PM, Richard Purdie wrote:
> On Tue, 2024-12-24 at 17:13 -0600, Javier Tia wrote:
>> On Tue, Dec 24, 2024, at 4:54 PM, Richard Purdie wrote:
>> > On Tue, 2024-12-24 at 16:16 -0600, Javier Tia via
>> > lists.yoctoproject.org wrote:
>> > > When Bitbake is used with Python 3.13, it generates numerous
>> > > build
>> > > issues that do not occur with Python 3.12. The documentation is
>> > > clear
>> > > for the supported Linux distributions, but not for the supported
>> > > Python
>> > > versions.
>> > >=20
>> > > Signed-off-by: Javier Tia <javier.tia@linaro.org>
>> >=20
>> > Can you be specific about which version of bitbake you saw the
>> > issues
>> > with? I was hoping we had resolved most of the issues with 3.13, at
>> > least in master. We do aim to work with new versions of python but
>> > it
>> > obviously takes time to catch up and for fixes to make older
>> > versions.
>>=20
>> With Bitbake from poky master (284a08b6e40761f) and BitBake from the
>> latest master (c9906bb289dcfd9). Python 3.13.1.=20
>>=20
>> Issues:
>>=20
>> - "ERROR: ParseError in None: Not all recipes parsed, parser thread
>> killed/died? Exciting." I noticed it was solved in Yocto Bugzilla,
>> but I reopened the bug because I believe it is still not fixed.
>>=20
>> - The problem mentioned on
>> https://wiki.yoctoproject.org/wiki/Pseudo_Abort=C2=A0with several poky
>> recipes (base-files, update-rc.d, qemu, and u-boot) and other recipes
>> from other layers.
>>=20
>> Please let me know if more information is needed.
>
> We have a fedora41 worker in the autobuilder cluster which has:
>
> fedora41-vk-1:~$ python3 --version
> Python 3.13.0
>
> As you can see here:
>
> https://valkyrie.yoctoproject.org/#/workers/54
>
> is it running builds successfully. There is therefore some difference
> in your environment and I'm not sure it is python 3.13 that is the
> cause of the problems you're seeing.
>
> Are there any tracebacks in bitbake-cookerdaemon.log? Which distro is
> this?=20

Distro is Arch Linux.

Understanding now that Python PGO was the underlying issue. And everythi=
ng is fine now. This patch can be skipped. I could submit another docume=
ntation patch that warns against using PGO when building Python.

> The pseudo aborts are likely a different problem with a missing libc
> intercept or similar issue and secondary to the other problem.
>
> Cheers,
>
> Richard

--=20
=C2=BB Javier Tia =E2=9C=8D

