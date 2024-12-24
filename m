Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15528E77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 23:13:57 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.42999.1735082034280515109
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Dec 2024 15:13:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=x/JuB1nu;
 spf=pass (domain: linaro.org, ip: 209.85.219.44, mailfrom: javier.tia@linaro.org)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d88cb85987so45425606d6.1
        for <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 15:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735082033; x=1735686833; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgA7MumFUfVGvk1D4QDSk/2imsM9AVF86tbHYPViUQ8=;
        b=x/JuB1nuvEQN1jvJXxrwNIuBuMpPaF7Qd65aZzjxL2ZCnZ/O+Pd45fzcBA2EXfzJmh
         kmlEL95PW04Jqfpo26inTsMVodpBvQWy3ERJO2IXhymwur4oh364CjUS3mh1YBtuddAs
         WchMnZdBckLd+as00uO4uXaZ8vB6IYZWaimm9YQy5eV1CVwyCmXPuIjb/XPHK/Sn8z8k
         qpZwhhe0k7Lt0SEHjowtxog7UdCPNBReD7SU5q0ILn+17BXhb8NisO4lb8wYGbWhn3i0
         f4x9bXgbpkPrwGvLsI62xMX5pGh1WHwQx3Y6s7hV3qfxaHFTFemHfZ9T0DbUO9G4Fd+m
         NpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735082033; x=1735686833;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EgA7MumFUfVGvk1D4QDSk/2imsM9AVF86tbHYPViUQ8=;
        b=oZHcHWnWlUiDtk/zwQUwEZJvOXD3JDsa5i0HB4xuqsg29vZeJDqAnniso0rObRDTPH
         qVnAeZb8twi2DMwYb8QAygu3MmZgAfoLzAjSIry0b/GsIvDHldr6X08jycmOQ5Ip4swD
         aZ0it/mhd957eKwcSYwqAUPezgw8kir2ThohcYQePc0HiV5tOBaCacYFR2MVqKwhZIHq
         C08O3Lt0htXurLxbj6ZVrmGpchgvR1aIpuZsbadIdVLSqVVklhVRTkJdCk/kwz4o0Vl5
         hCYXewNCiFCN/gJmxL2ruQX6B0trKIfjOQlryz6dOXWhNkQOai9Opz4tREq4/KT/vjPD
         qB4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8Z++WwfuMg3/vsF0ErLdpYIbZuPMmBs+Z4u8nOu08wBWnniqtA3qMYrqiiZGWHx9Hzy97@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy/wj3xAiXeeHwcrI9EKoZo+kmQYzUtj/YYoqLFr66Av9A39S2n
	kw1VAjCfGzab/qHiDY4iCPczlBUfA+L7f6FgM8+k2CTPGpyo7msVqed5RvVhHNs=
X-Gm-Gg: ASbGnctqQMPCAiUyCCUR8MoFBGcYdaliauPgzATWD4FduFguXRyt9ZkwpWi9rFH0O3D
	YLSfAbJvAH5ecEjvCXNGzzv5AsQPW+5RWGMucxdAY5HlazddiDlcnXwlX/Qw36sRWIaAXngLW6Q
	+vHNV0wlHPfBzzFw2vlHi16FvxAURInEFxSm528Cxlt18NNbf15xXz2/pdWb1/0neQ4paeLglIq
	ohlN2vPp9oGL4M8Ut4J1MapGbU3peBNob61w0+hfthPJDk1kCDPXUY05LICfGUVXmRSSVX0w2J6
	KRn8ZpfC0pvdj7sh7ESh3yQNMlu8pyMM9p7dGKgnpH0q6EL/
X-Google-Smtp-Source: AGHT+IH4K+cdl22MDazIohnZ4q9FA0+dycya5f+7XXf2iBdpVDiCCaHGcVdAa+MOYQ5qAuDbqfDcgQ==
X-Received: by 2002:a05:6214:3c9f:b0:6d8:a9a6:83ef with SMTP id 6a1803df08f44-6dd23618bb2mr314294306d6.20.1735082033335;
        Tue, 24 Dec 2024 15:13:53 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181d42f0sm56756466d6.109.2024.12.24.15.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 15:13:52 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3A09C1200074;
	Tue, 24 Dec 2024 18:13:52 -0500 (EST)
Received: from phl-imap-09 ([10.202.2.99])
  by phl-compute-01.internal (MEProxy); Tue, 24 Dec 2024 18:13:52 -0500
X-ME-Sender: <xms:MEBrZ6ihMPv34-TMGUzVYxgR8xoGy5t94Day7xDbxK2vwzXkOzjAtw>
    <xme:MEBrZ7Dgx6NUZYI0QZs8JAEsvYop77F_DJoqKYczIIq9pX3TGsJF-E_tCBnPZXzMt
    jUArIxXcpkDBCks9RQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudduhedgtdejucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:MEBrZyEjmQkSbfm7keA0StkF5P0Kv8jpGEfEnI3PqTubyr0mHSm5ww>
    <xmx:MEBrZzQHE_GX_oWayXnJJr-mvAJqIFSL0D-5C0qNnil6rVLlLv1Lxg>
    <xmx:MEBrZ3yNxrUs57fAyyixUlkm7Yt_OnVjJ_CivcFQnPb95qv-jclilA>
    <xmx:MEBrZx5C3j8ufpym3sXVVLuXO9Qlv5tsp1vO6YyvFuDX9zcGrUWKiA>
    <xmx:MEBrZ0ysTkt6oYkjB54ZgYr9VRjvti0p-uaXjs5fGMkGirwX3s1ZEY31>
Feedback-ID: idd3648b2:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0A6A8780068; Tue, 24 Dec 2024 18:13:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 24 Dec 2024 17:13:31 -0600
From: "Javier Tia" <javier.tia@linaro.org>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
Cc: "Mikko Rapeli" <mikko.rapeli@linaro.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>
Message-Id: <d507bfc4-a4ab-45e8-adee-6503896fc045@app.fastmail.com>
In-Reply-To: 
 <0fc165187afd965a79989a412d16bc77271248a3.camel@linuxfoundation.org>
References: <20241224221625.4092917-1-javier.tia@linaro.org>
 <0fc165187afd965a79989a412d16bc77271248a3.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] Set max supported Python version
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 23:13:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6027

Hi Richard,

On Tue, Dec 24, 2024, at 4:54 PM, Richard Purdie wrote:
> On Tue, 2024-12-24 at 16:16 -0600, Javier Tia via lists.yoctoproject.o=
rg wrote:
>> When Bitbake is used with Python 3.13, it generates numerous build
>> issues that do not occur with Python 3.12. The documentation is clear
>> for the supported Linux distributions, but not for the supported Pyth=
on
>> versions.
>>=20
>> Signed-off-by: Javier Tia <javier.tia@linaro.org>
>
> Can you be specific about which version of bitbake you saw the issues
> with? I was hoping we had resolved most of the issues with 3.13, at
> least in master. We do aim to work with new versions of python but it
> obviously takes time to catch up and for fixes to make older versions.

With Bitbake from poky master (284a08b6e40761f) and BitBake from the lat=
est master (c9906bb289dcfd9). Python 3.13.1.=20

Issues:

- "ERROR: ParseError in None: Not all recipes parsed, parser thread kill=
ed/died? Exciting." I noticed it was solved in Yocto Bugzilla, but I reo=
pened the bug because I believe it is still not fixed.

- The problem mentioned on https://wiki.yoctoproject.org/wiki/Pseudo_Abo=
rt with several poky recipes (base-files, update-rc.d, qemu, and u-boot)=
 and other recipes from other layers.

Please let me know if more information is needed.

> Cheers,
>
> Richard

--=20
=C2=BB Javier Tia =E2=9C=8D

