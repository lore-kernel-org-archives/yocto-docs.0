Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1FBC4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 11:09:27 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.9130.1664881763262080323
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 04:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iNoBx0SA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 z13-20020a7bc7cd000000b003b5054c6f9bso10623922wmk.2
        for <docs@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 04:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=Ur3ANninksD1O1XNC+fNe3hVg55ccnIwEiTBfm5k+6w=;
        b=iNoBx0SANnoIt+tx3YBA2AIDY6BBWRn295AJ26Ww8Qv1IHOFzagfmEvN7NzoNL6eua
         rZHPBKGMqV3mrXlxps3g4y5QSKJHU44Xo+qPWZWt0Z8mEak1xmPeMMSos9v7FnQ0//Oy
         wk4aEq8gWf8XsU5BdbuhcSl8RE78v2OW7o5dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=Ur3ANninksD1O1XNC+fNe3hVg55ccnIwEiTBfm5k+6w=;
        b=qpHgAGj1N6yo9nhT0o82Kq+wR7udutSFM74rq1Tz4b5f1Dgm4iKVSE9S4jAhK8fTV1
         x8HdQ+2H0oPTk2/SCRE5S57GD9uMSrqulE8ZjiW8RNlzBYu0WKZfzw6pURTA8O4uxy+b
         WHJ+dBrIMTsdaeGnM1Z3QwzYHY5HHzlowHeIws265a08oikbf/Bn8fQqmQHZqgtqht/M
         y3hideCaqkypoHAJ8jTEuY0A5RKKpDMAdY/RuNs3ZMvvUFCdc8bhqyvTjfJZktYkzk4W
         kiqAOXIuiPn5YLI6Zlbj0fD+j049O8smXLEonadpd8ny3KaUuYNjy2M1l9HvrJHAhDyu
         Ahzw==
X-Gm-Message-State: ACrzQf2Ui0ayetEgUKmGu1xYxLKJtxEPdwMfAst2Vt8lIwkzNU8Syy5h
	h14YggtP1W+44Dj+ecOq3zrODQ==
X-Google-Smtp-Source: 
 AMsMyM5GKCD2pYZ7BclN8gmk5IziDg/2zg0btyb/QaON20MsoM7naiKcyBVTnSCtWxBDWmYM77cifQ==
X-Received: by 2002:a05:600c:1d94:b0:3b4:7b91:7056 with SMTP id
 p20-20020a05600c1d9400b003b47b917056mr9642781wms.18.1664881761552;
        Tue, 04 Oct 2022 04:09:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a418:d17a:77b7:6987?
 ([2001:8b0:aba:5f3c:a418:d17a:77b7:6987])
        by smtp.gmail.com with ESMTPSA id
 d16-20020adfe890000000b0022e035a4e93sm11529571wrm.87.2022.10.04.04.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 04:09:20 -0700 (PDT)
Message-ID: 
 <99339c298138b6f300146d81beec455815b11771.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 1/4] openssl-native.bbclass: add bbclass
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
	openembedded-core@lists.openembedded.org
Cc: docs@lists.yoctoproject.org
Date: Tue, 04 Oct 2022 12:09:18 +0100
In-Reply-To: <20221004101038.2736600-1-mikko.rapeli@linaro.org>
References: <20221004101038.2736600-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Oct 2022 11:09:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3269

Hi Mikko,

Thanks for working on this, particularly with upstream.

On Tue, 2022-10-04 at 13:10 +0300, Mikko Rapeli wrote:
> Using openssl-native shared libraries correctly is hard. A number
> of environment variables need to be correctly set or
> the errors may be really confusing. openssl can be made
> to detect these paths automatically, but upstream has rejected
> these ideas. openssl-native provides a wrapper script for 'openssl'
> binary, but shared library users like python3-cryptgraphy-native
> need to have the shared libraries working directly. Thus follow
> example from python3native.bbclass and implement this via
> openssl-native.bbclass.
>=20
> If full certificate checking is needed, then users
> also need to DEPEND on ca-certificates-native.
>=20
> See also:
> https://lists.openembedded.org/g/openembedded-core/topic/93651845#170562
> https://github.com/openssl/openssl/issues/19242
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  documentation/ref-manual/classes.rst               | 11 +++++++++++
>  meta/classes/openssl-native.bbclass                |  7 +++++++
>  meta/recipes-connectivity/openssl/openssl_3.0.5.bb |  1 +
>  3 files changed, 19 insertions(+)

Docs are in a different repo to OE-Core so this patch would need to be
split.

I think it is worth referencing this too:

https://github.com/openssl/openssl/pull/19260

I noticed there that the patches have thrown some compiler warnings:

crypto/conf/conf_mod.c:667:20: error: passing 'const char *(int)' to parame=
ter of type 'const void *' converts between void pointer and function point=
er [-Werror,-Wpedantic]
        if (dladdr(OpenSSL_version, &info)) {
crypto/conf/conf_mod.c: In function 'CONF_get1_default_config_file':
crypto/conf/conf_mod.c:667:20: error: ISO C forbids passing argument 1 of '=
dladdr' between function pointer and 'void *' [-Werror=3Dpedantic]
  667 |         if (dladdr(OpenSSL_version, &info)) {
      |                    ^~~~~~~~~~~~~~~
In file included from /usr/aarch64-linux-gnu/include/link.h:25,
                 from crypto/conf/conf_mod.c:34:
/usr/aarch64-linux-gnu/include/dlfcn.h:98:32: note: expected 'const void *'=
 but argument is of type 'const char * (*)(int)'
   98 | extern int dladdr (const void *__address, Dl_info *__info)


It may be worth fixing those just in case they consider the patch.

I'm wondering whether we should just carry those patches? They don't
look so invasive and it would save complicating things elsewhere in our
codebase...

Cheers,

Richard



