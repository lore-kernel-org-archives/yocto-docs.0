Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33839CD6E46
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 08:55:20 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.12324.1697014511247635741
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 01:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZviTBPEM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so6312747f8f.2
        for <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 01:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697014509; x=1697619309; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPvWSc39QnXzthuWmKGhzwhtlSuhTQaEQRfes5PzZvc=;
        b=ZviTBPEMoIIaCs0w+rKdc0Tp940W9n4+fQTy1sQ7fzJPvs5Yx8LiSejreBattmBnVI
         Z0xfuqOhl/Q+10egrvAuJAF2j4liEkyr03rUYQ14xWe0MX/bKjt7rVRw/JAdSke4E1wj
         4R8pTo6cU844CykgEKeBkzIOweRRAWjXKMkWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697014509; x=1697619309;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yPvWSc39QnXzthuWmKGhzwhtlSuhTQaEQRfes5PzZvc=;
        b=TjV68m8j7IQJiNuxI4WCazqVjL0gSggGG3Thpnc4pU6eezWW9tbYIKNN+UOeEbS2gq
         tBBlBGob2wtJBgcy9o0HKDzOMkIlvsD+6ldgUIM/4tAr2DJZnUcz9geDKP6xaKuROZKI
         dR85fDQiWlfwoE+oDY/mZvl2lmY7s45oWPIovZOBMZ+T/A8xcc12pGy8ew99q0d/8v49
         yFcQmWproTfTnFi6zE236Jq0nI+bH07Nu7rARH8z/HEw8PtpsRilhn0FLEVljahfHYJr
         67x9KPvH2cFouivqoMmQ5/Zb9AJkrQ3pMRqdjEdv5eOXHjWTVb3q8jK6dDlkgSs640Yb
         rzgg==
X-Gm-Message-State: AOJu0YzNjs68zbDoe4MFL0RYNMxTCcQ8Mubn5dpwZaEGAE3C5j4z0Jlc
	L8o8nKnVOE9/CcVwZza/11dryQ==
X-Google-Smtp-Source: AGHT+IFEpMCyhx5n7WJacz62XCxWQhl7AlvQEOqH1JnfLopwfpZtZlaQWBr5M3z++kKwSVFFEABLsw==
X-Received: by 2002:a5d:50c8:0:b0:323:2563:be13 with SMTP id f8-20020a5d50c8000000b003232563be13mr18001040wrt.52.1697014509426;
        Wed, 11 Oct 2023 01:55:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:af0b:dd0f:66a6:9b90? ([2001:8b0:aba:5f3c:af0b:dd0f:66a6:9b90])
        by smtp.gmail.com with ESMTPSA id c17-20020a056000105100b003231ca246b6sm14874440wrx.95.2023.10.11.01.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 01:55:09 -0700 (PDT)
Message-ID: <3f9eaa19ebb74df218439d6ac03f8f837a7a41f6.camel@linuxfoundation.org>
Subject: Re: [docs] does bbappend wildcarding cover when there is no version
 string?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Wed, 11 Oct 2023 09:55:08 +0100
In-Reply-To: <b69076ea-5ef4-6c5a-9aff-9a99ff19ce@crashcourse.ca>
References: <b69076ea-5ef4-6c5a-9aff-9a99ff19ce@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 08:55:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4339

On Wed, 2023-10-11 at 04:51 -0400, Robert P. J. Day wrote:
>   can't remember where this is properly covered, but we all know how
> version wildcarding works with bbappend files, as discussed here:
>=20
> https://docs.yoctoproject.org/ref-manual/terms.html#term-Append-Files
>=20
> but do the docs explain what happens when there is no version number,
> such as with the perf.bb file?
>=20
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/p=
erf
>=20
> in cases like that, AIUI, the only bbappend format that will work will
> be perf.bbappend.
>=20
>   this might be worth clarifying in case readers get the impression
> that the most general and all-encompassing wildcard pattern would be
>=20
>   perf_%.bbappend

FWIW I suspect

perf%.bbappend

would work but would also match

performance_1.0.bb

which is why we suggest perf_%.bbappend

Cheers,

Richard

