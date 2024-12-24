Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2EEE77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 23:39:31 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.42.1735083561999705362
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Dec 2024 15:39:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=auyBL8BI;
 spf=pass (domain: linaro.org, ip: 209.85.222.182, mailfrom: javier.tia@linaro.org)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b7041273ddso397092585a.3
        for <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 15:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735083561; x=1735688361; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gp3HMfxPgKfobPT5jANNOmO3+PGCi9wBlP9R9jBqP9E=;
        b=auyBL8BIHAewfteVDbKWA29HOf1rLh52n4XcuUggGwsGPiN5TDTqL/lX/01/Vt7/K5
         Lg3YxJKZvC6wYS8ITmSnSjCAq/CxMwn9HP4jnb/sijvYAKh5CSPuoEll1KQYFPzYxiud
         tMCiUWEPyKcjXodP45RjyouJ0vwNOu0gG0xt1NLhNCjYaTwlx9oGBhATKF1y3ppW8aKz
         wnVnW4xb8gafwEJAUZqFNa4OUNjq2iGaqWxXdgOXAI4ER4tjw6WgVwRkCPWnEQdJQCIy
         yzdICbvyrU38/JdndTjw/eXwDFlBFVPeCBG5OX2NDDp0NYaxd1iBIk9qzh5AcEkum14o
         HF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735083561; x=1735688361;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gp3HMfxPgKfobPT5jANNOmO3+PGCi9wBlP9R9jBqP9E=;
        b=LQR4YkOUd5FBDLaAnUpPKLQAhK486FOSjwMS0lmWJjvoBxazVRSBMYN4KbIhtXKDlx
         PK1zI/+I+Jyqbi/hno42GzRoO2YCffV0W6Cljuwg4u2gicqWKB7o2sZzcGcR2mVGfJGh
         AjzMMmHuD7dktmYSwq5CtsLwzJtJayJ8ZCydRi+SKebyD2olQ19/rAzn004WkXR6CzuU
         9+YKTpuReckMSBKOzsy76QpNnbxZPDt3bE9wJwOfxk3quqhICyEjjH8KRsDHDeqsoYwa
         oV6heERsPFOHAQKYwanHltUwWYW8QUT9RWrFh7PimzHbvirK0UUsqeXhqiUX+OMFaWQ2
         OiDA==
X-Gm-Message-State: AOJu0YwaMNrFxqWR+JpRfjFwGKzlrZ96UX+hEsKuVMK17eigAL4f/T4C
	mqkPEkuNESKHxvG6JxVZbVPU/mfsqPDNO0GYUQxjz1gLTj4XwZoNDLHNlzg0tiU=
X-Gm-Gg: ASbGncvjqWl5vzxj3EvskAKhkg3GNe3jY0nn2k9tGB/FJ5wC2/lhfXp8WCLSZT2eB1S
	iQahjx1Wra0dJZrI/dqWFP6cyL9zVm6ohCN4iYpCNxazxz+rR3u3CzfzoaSVsamWS1+8t0Frm/d
	4BcSPFSZdzXkpzBT8GUZqWhvGxYaC71whTZcVlvZhGzL5/ZQ5BeKHj90drMKM9boa6PSutW6B2E
	WtTtJtxKI4Ww+XhzIAhgjIB76AN/fmQIUhsodiIFJeSs/a3NB+m0LKJDi3/vKCEhAhao2keb9iH
	Iq1AREFeIdJsbAkKHeUZ3o8ca5W9o8XjHvTSfULpU8cx+uik
X-Google-Smtp-Source: AGHT+IHEiRw9o2CUvg0EOGIaVUHuXs6CYiaK7C4K6PP1gnmNV8mxTg3Y07p4PfKJgXBU8kVmL01eHg==
X-Received: by 2002:a05:620a:268c:b0:7b1:3f19:b81a with SMTP id af79cd13be357-7b9ba80f6famr3058912985a.53.1735083561030;
        Tue, 24 Dec 2024 15:39:21 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2df39fsm503866185a.38.2024.12.24.15.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 15:39:20 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2428B1200043;
	Tue, 24 Dec 2024 18:39:20 -0500 (EST)
Received: from phl-imap-09 ([10.202.2.99])
  by phl-compute-01.internal (MEProxy); Tue, 24 Dec 2024 18:39:20 -0500
X-ME-Sender: <xms:KEZrZ2kr_8yU_SZBM92PYv64Dtb4tWiMdbS7bBgJ_w3RNEkq40OOlA>
    <xme:KEZrZ93tZ-QJcGFc99Bq7JqUyiF7mqe4CQTaOqDMA5RjJkSMWPoi9-VGf9Hobt_la
    cVN_ftwn70HMuy1Y-8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudduhedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfgrvhhivghrucfvihgrfdcuoehjrghvihgvrhdrthhirgeslhhinh
    grrhhordhorhhgqeenucggtffrrghtthgvrhhnpeefjedvtdetffekfefgudeukefgudeg
    udfggfetkeekheelieeuhefhkefgveevhfenucffohhmrghinhephihotghtohhprhhojh
    gvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepjhgrvhhivghrodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduhe
    dvkeekleehkeefqdefudefieegvdeliedqjhgrvhhivghrrdhtihgrpeeplhhinhgrrhho
    rdhorhhgsehjvghtmhdrmhgvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehmrghrthhinhdrjhgrnhhsrgesghhmrghilhdrtghomhdprhgt
    phhtthhopehilhhirghsrdgrphgrlhhoughimhgrsheslhhinhgrrhhordhorhhgpdhrtg
    hpthhtohepmhhikhhkohdrrhgrphgvlhhisehlihhnrghrohdrohhrghdprhgtphhtthho
    pehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrgh
    dprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:KEZrZ0otEYUHd7E6cxz3hpNHM554J5munaELfsk8PlY-GFqnQNL20g>
    <xmx:KEZrZ6kwHEiMBSCk4T914Lu-kOxpO-xp_Yfzzju03XuABHbUt_cCHQ>
    <xmx:KEZrZ01SyK1ZhRwD8Xc9ol3Jnn6c-wYFBV1YSgyUZcdwhKr02sHJrA>
    <xmx:KEZrZxvVHh4C_DncTUK7PocMsscsiJln3GX6pbAvTZ28qFdHV8SWvA>
    <xmx:KEZrZwWQGNjKEA7M7-kwBDOsHSYihVifczeXeUferj75hnmh2k5X_UzM>
Feedback-ID: idd3648b2:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EC118780068; Tue, 24 Dec 2024 18:39:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 24 Dec 2024 17:38:59 -0600
From: "Javier Tia" <javier.tia@linaro.org>
To: "Martin Jansa" <martin.jansa@gmail.com>,
 "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org, "Mikko Rapeli" <mikko.rapeli@linaro.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>
Message-Id: <031a8378-b9a0-4bf9-aab7-8b98517f6779@app.fastmail.com>
In-Reply-To: 
 <CA+chaQcQN96LXQGKuP_MR1AO+ROvWZrAyMCci=F8E1xJWOQA-Q@mail.gmail.com>
References: <20241224221625.4092917-1-javier.tia@linaro.org>
 <0fc165187afd965a79989a412d16bc77271248a3.camel@linuxfoundation.org>
 <d507bfc4-a4ab-45e8-adee-6503896fc045@app.fastmail.com>
 <42f3567668e35a5398dbbeefc408d71e90292463.camel@linuxfoundation.org>
 <CA+chaQcQN96LXQGKuP_MR1AO+ROvWZrAyMCci=F8E1xJWOQA-Q@mail.gmail.com>
Subject: Re: [docs] [PATCH] Set max supported Python version
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 23:39:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6030

Hi Martin,

On Tue, Dec 24, 2024, at 5:34 PM, Martin Jansa wrote:
> FWIW: I'm using gentoo with 3.13.1 and I'm not seeing these issues
> since pseudo was updated.

Yes, I updated pseudo [1], but all build issues happened:

[1] bitbake pseudo-native -c cleanall && bitbake pseudo-native.

Thanks,

> On Wed, Dec 25, 2024 at 12:22=E2=80=AFAM Richard Purdie via
> lists.yoctoproject.org
> <richard.purdie=3Dlinuxfoundation.org@lists.yoctoproject.org> wrote:
>>
>> On Tue, 2024-12-24 at 17:13 -0600, Javier Tia wrote:
>> > On Tue, Dec 24, 2024, at 4:54 PM, Richard Purdie wrote:
>> > > On Tue, 2024-12-24 at 16:16 -0600, Javier Tia via
>> > > lists.yoctoproject.org wrote:
>> > > > When Bitbake is used with Python 3.13, it generates numerous
>> > > > build
>> > > > issues that do not occur with Python 3.12. The documentation is
>> > > > clear
>> > > > for the supported Linux distributions, but not for the supported
>> > > > Python
>> > > > versions.
>> > > >
>> > > > Signed-off-by: Javier Tia <javier.tia@linaro.org>
>> > >
>> > > Can you be specific about which version of bitbake you saw the
>> > > issues
>> > > with? I was hoping we had resolved most of the issues with 3.13, =
at
>> > > least in master. We do aim to work with new versions of python but
>> > > it
>> > > obviously takes time to catch up and for fixes to make older
>> > > versions.
>> >
>> > With Bitbake from poky master (284a08b6e40761f) and BitBake from the
>> > latest master (c9906bb289dcfd9). Python 3.13.1.
>> >
>> > Issues:
>> >
>> > - "ERROR: ParseError in None: Not all recipes parsed, parser thread
>> > killed/died? Exciting." I noticed it was solved in Yocto Bugzilla,
>> > but I reopened the bug because I believe it is still not fixed.
>> >
>> > - The problem mentioned on
>> > https://wiki.yoctoproject.org/wiki/Pseudo_Abort with several poky
>> > recipes (base-files, update-rc.d, qemu, and u-boot) and other recip=
es
>> > from other layers.
>> >
>> > Please let me know if more information is needed.
>>
>> We have a fedora41 worker in the autobuilder cluster which has:
>>
>> fedora41-vk-1:~$ python3 --version
>> Python 3.13.0
>>
>> As you can see here:
>>
>> https://valkyrie.yoctoproject.org/#/workers/54
>>
>> is it running builds successfully. There is therefore some difference
>> in your environment and I'm not sure it is python 3.13 that is the
>> cause of the problems you're seeing.
>>
>> Are there any tracebacks in bitbake-cookerdaemon.log? Which distro is
>> this?
>>
>> The pseudo aborts are likely a different problem with a missing libc
>> intercept or similar issue and secondary to the other problem.
>>
>> Cheers,
>>
>> Richard

--=20
=C2=BB Javier Tia =E2=9C=8D

