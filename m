Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C23FE7718D
	for <webhook@archiver.kernel.org>; Wed, 25 Dec 2024 00:57:21 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.876.1735088231198164410
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Dec 2024 16:57:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KfMhsJtL;
 spf=pass (domain: linaro.org, ip: 209.85.160.174, mailfrom: javier.tia@linaro.org)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-468f6b3a439so50240881cf.1
        for <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 16:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735088230; x=1735693030; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9gCGqEuajLrFb4L8qEmKUGODKlWT2Xc1/XphVoDwkc=;
        b=KfMhsJtLxobF1Vd1syubmMXsg4gLjd2lkkQME/I89N1YqiIOHVUkAltUgnh3caUSar
         PPnY9zPGMHjA8I/qM9CA3NxIqxsm2JWfsHeVOmy4sjqG4ZgIUQ7sLre0bthaA9Y5UbSe
         RGbRr8RF26hA63Gg4N4RGW8AzGEaRFn018FuYiduKfAlIRP26k2ntLHMCO+5JAD9ko5p
         VDAz3qSK5RbIHoZuWxrexS/2JNOeF9hi7oZlbs3IGdquPSDOW22RoEE9QjXMy+2HJbUI
         lyWygoWGt0EfkMNd7xZQqEqDSl5T03US094PcjOByP7pdPhd73utIcfyN7oMdQP65twF
         RLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735088230; x=1735693030;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I9gCGqEuajLrFb4L8qEmKUGODKlWT2Xc1/XphVoDwkc=;
        b=bB49vEU3obFXgiviDIfCslkCiAhf3fTjxA8TllKM/mGX1mleTOIjikt5JMcnMYep3/
         u1MVAHfyNy0M2LgYV4bgZLiOCSQbKGvZtai1bBM8MEgkmO2NaGurP4pVWQMy3s1sxyLK
         GtBhC46EKgfOZzDMgWKWmCRjXxCsuT0QIJt8ba2rfzKkHTuzqHSaRF+VP9PH1J5+fOKZ
         /UA0KN8yylZfz2gF7tzWL6nAD8GHNCR20lpCQDZiEgkkEoYK+u5ybWS4PAZITJ5w2r2n
         Nft7whRTUTJ3hVooFLcZeJ3xemo3sB8rYhJxewOx/sv8o4mIQZB65Wa4N4gYlWieB61j
         AvdA==
X-Forwarded-Encrypted: i=1; AJvYcCVPIYePDmrExPMi0r1/Ug/aiahP2TQZaHDbk/BSSVw8N/9KlY4ey/dTHTRVuoq9rYXGJP/W@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxnoL3qXnXJjKU0JDcbGyWoDd1Q01Rfws20S7BVivhqW3e8uUj1
	FnbPD3CykTrLqcjIaYztnvhoNd2I2bxyyAa8dXfYx0Yqn5YS1BovS8vmB+5lrnU=
X-Gm-Gg: ASbGncuHJ/9WYWl3n8gF5rislKHTfDNJxLdlid+laDuTOhqKelGQm7gko/BTbiudKx5
	dxFjR12EuPrSRIfSlLDYyMGwaC7PgPEZLCifwSK/qjl2Bz7PjUDsCnhpj2X50aMKNFZmHF03jmY
	gUdTIhl0GBAOx0lzkpOgYh8uUE/ViP00+NGObN9ESlDtL/XdkketRXB05JdVQSC7klw12EEX9o9
	aepNQpjxQ8TT2QBLEB9z1DGRUeFq8SXQwuz8cKZ3COx5brkv+uIW9coAmV3e1MSkpSCgYaTgEg5
	hO8xrgTuhza1EtzdCczWqEafZD43MB9NDbKuXKcPm3ZImOWj
X-Google-Smtp-Source: AGHT+IGZWplr9pw5ZvWYiaIjhcH4Bex2QMXvLvIyny8IfmTDcNrD4wBvHbcTzXPq5dXlT+QOT4IsbA==
X-Received: by 2002:a05:622a:8f:b0:467:6833:e30c with SMTP id d75a77b69052e-46a4a8ef47dmr236134251cf.30.1735088230122;
        Tue, 24 Dec 2024 16:57:10 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e680e85sm58094491cf.34.2024.12.24.16.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 16:57:09 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id C9CD61200078;
	Tue, 24 Dec 2024 19:57:08 -0500 (EST)
Received: from phl-imap-09 ([10.202.2.99])
  by phl-compute-01.internal (MEProxy); Tue, 24 Dec 2024 19:57:08 -0500
X-ME-Sender: <xms:ZFhrZxHHtqPFwZURFq1El6UyX2cA2GHbVSztVn101TsYN__WzdodEg>
    <xme:ZFhrZ2UkTnVPCJ5KOsxpT4u3TjDTYFHbfS98hhPvYed8QJrUmpADtIRxywzzSxK8h
    khfSpOplTbSe9bGqgE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudduhedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfgrvhhivghrucfvihgrfdcuoehjrghvihgvrhdrthhirgeslhhinh
    grrhhordhorhhgqeenucggtffrrghtthgvrhhnpeegffeijefghfejjefhheetgeffgfet
    heeifeeluddujeeihfdtheffgfeghedttdenucffohhmrghinhepohhpvghnvghmsggvug
    guvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjrghvihgvrhdomhgvshhmthhprg
    huthhhphgvrhhsohhnrghlihhthidqudehvdekkeelheekfedqfedufeeigedvleeiqdhj
    rghvihgvrhdrthhirgeppehlihhnrghrohdrohhrghesjhgvthhmrdhmvgdpnhgspghrtg
    hpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrrhhtihhnrdhj
    rghnshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhlihgrshdrrghprghlohguih
    hmrghssehlihhnrghrohdrohhrghdprhgtphhtthhopehmihhkkhhordhrrghpvghlihes
    lhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlih
    hnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhs
    rdihohgtthhophhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:ZFhrZzKVdEF5FJ2pNPigncKWuDGhZOgYo9f-6tLAu6Yb9idhKK0_DQ>
    <xmx:ZFhrZ3Heqcc5IzYQ2DxQApAmEqabt9RuHJgNCxQBOcynhycztIZ1OA>
    <xmx:ZFhrZ3UAneuM7l-enNkpGAxf77Oz-qluvw4JUmVItk__Ne2upCsg5Q>
    <xmx:ZFhrZyPsBMOVLYQEmOPt5suowC0PDFHnqbFmmhw37Fk4rxZVb8r30g>
    <xmx:ZFhrZ22OIfJH6zk7NQ5Ev0lEs_ej0fOhmJ-bYkpz3QtcKmYp8ZrkixXC>
Feedback-ID: idd3648b2:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A03D0780068; Tue, 24 Dec 2024 19:57:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 24 Dec 2024 18:56:47 -0600
From: "Javier Tia" <javier.tia@linaro.org>
To: "Martin Jansa" <martin.jansa@gmail.com>
Cc: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org, "Mikko Rapeli" <mikko.rapeli@linaro.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>
Message-Id: <19cd1f59-485b-4b83-9d8c-b96585cb8a62@app.fastmail.com>
In-Reply-To: 
 <CA+chaQeH8EaVww4=18WhDXCXZW=Yyn2gD-cbkD-acteDw03aTA@mail.gmail.com>
References: <20241224221625.4092917-1-javier.tia@linaro.org>
 <0fc165187afd965a79989a412d16bc77271248a3.camel@linuxfoundation.org>
 <d507bfc4-a4ab-45e8-adee-6503896fc045@app.fastmail.com>
 <42f3567668e35a5398dbbeefc408d71e90292463.camel@linuxfoundation.org>
 <CA+chaQcQN96LXQGKuP_MR1AO+ROvWZrAyMCci=F8E1xJWOQA-Q@mail.gmail.com>
 <031a8378-b9a0-4bf9-aab7-8b98517f6779@app.fastmail.com>
 <CA+chaQeH8EaVww4=18WhDXCXZW=Yyn2gD-cbkD-acteDw03aTA@mail.gmail.com>
Subject: Re: [docs] [PATCH] Set max supported Python version
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Dec 2024 00:57:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6032

Hi Martin,

On Tue, Dec 24, 2024, at 5:47 PM, Martin Jansa wrote:
> Hi Javier,
>
> yeah I believe you. I just wanted to show that not all 3.13.1 pythons
> trigger this issue and it's important to figure out what's different
> on your system. e.g. in gentoo I'm disabling pgo in python since 3.13
> due to some issues (detected in python test suite already).

Disabling PGO made the difference. After rebuilding the python package, =
everything went back to normal. Thank you!

> I meant this commit (which you already have unless you're using more
> layers and one of them changes SRCREV in pseudo recipe - which we also
> had before in one of our layers):
> https://git.openembedded.org/openembedded-core/commit/?id=3Dd80e20d70d=
170397f9827c5a5fc75ad1f2e8cd94

Thank you for this, too!

> Cheers,
>
> On Wed, Dec 25, 2024 at 12:39=E2=80=AFAM Javier Tia <javier.tia@linaro=
.org> wrote:
>>
>> Hi Martin,
>>
>> On Tue, Dec 24, 2024, at 5:34 PM, Martin Jansa wrote:
>> > FWIW: I'm using gentoo with 3.13.1 and I'm not seeing these issues
>> > since pseudo was updated.
>>
>> Yes, I updated pseudo [1], but all build issues happened:
>>
>> [1] bitbake pseudo-native -c cleanall && bitbake pseudo-native.
>>
>> Thanks,
>>
>> > On Wed, Dec 25, 2024 at 12:22=E2=80=AFAM Richard Purdie via
>> > lists.yoctoproject.org
>> > <richard.purdie=3Dlinuxfoundation.org@lists.yoctoproject.org> wrote:
>> >>
>> >> On Tue, 2024-12-24 at 17:13 -0600, Javier Tia wrote:
>> >> > On Tue, Dec 24, 2024, at 4:54 PM, Richard Purdie wrote:
>> >> > > On Tue, 2024-12-24 at 16:16 -0600, Javier Tia via
>> >> > > lists.yoctoproject.org wrote:
>> >> > > > When Bitbake is used with Python 3.13, it generates numerous
>> >> > > > build
>> >> > > > issues that do not occur with Python 3.12. The documentation=
 is
>> >> > > > clear
>> >> > > > for the supported Linux distributions, but not for the suppo=
rted
>> >> > > > Python
>> >> > > > versions.
>> >> > > >
>> >> > > > Signed-off-by: Javier Tia <javier.tia@linaro.org>
>> >> > >
>> >> > > Can you be specific about which version of bitbake you saw the
>> >> > > issues
>> >> > > with? I was hoping we had resolved most of the issues with 3.1=
3, at
>> >> > > least in master. We do aim to work with new versions of python=
 but
>> >> > > it
>> >> > > obviously takes time to catch up and for fixes to make older
>> >> > > versions.
>> >> >
>> >> > With Bitbake from poky master (284a08b6e40761f) and BitBake from=
 the
>> >> > latest master (c9906bb289dcfd9). Python 3.13.1.
>> >> >
>> >> > Issues:
>> >> >
>> >> > - "ERROR: ParseError in None: Not all recipes parsed, parser thr=
ead
>> >> > killed/died? Exciting." I noticed it was solved in Yocto Bugzill=
a,
>> >> > but I reopened the bug because I believe it is still not fixed.
>> >> >
>> >> > - The problem mentioned on
>> >> > https://wiki.yoctoproject.org/wiki/Pseudo_Abort with several poky
>> >> > recipes (base-files, update-rc.d, qemu, and u-boot) and other re=
cipes
>> >> > from other layers.
>> >> >
>> >> > Please let me know if more information is needed.
>> >>
>> >> We have a fedora41 worker in the autobuilder cluster which has:
>> >>
>> >> fedora41-vk-1:~$ python3 --version
>> >> Python 3.13.0
>> >>
>> >> As you can see here:
>> >>
>> >> https://valkyrie.yoctoproject.org/#/workers/54
>> >>
>> >> is it running builds successfully. There is therefore some differe=
nce
>> >> in your environment and I'm not sure it is python 3.13 that is the
>> >> cause of the problems you're seeing.
>> >>
>> >> Are there any tracebacks in bitbake-cookerdaemon.log? Which distro=
 is
>> >> this?
>> >>
>> >> The pseudo aborts are likely a different problem with a missing li=
bc
>> >> intercept or similar issue and secondary to the other problem.
>> >>
>> >> Cheers,
>> >>
>> >> Richard
>>
>> --
>> =C2=BB Javier Tia =E2=9C=8D

--=20
=C2=BB Javier Tia =E2=9C=8D

