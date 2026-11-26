Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6813.1795731994285870733
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Nov 2026 14:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Dpeo0iU2;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: twoerner@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c14f3dab09so3757747e87.0
        for <docs@lists.yoctoproject.org>; Thu, 26 Nov 2026 14:26:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795731992; cv=none;
        d=google.com; s=arc-20260327;
        b=l0M5phHBjuM2Rf+EOgrAB26Q25IXYGoCqHvO5j1BHpt6r6GZL/9u19S+k5vPKia8fb
         5108Bi7zUNSUWQIJ/hDN1N1kS80eENI4jGCKpthM80hQjGhiQ7KJUEH9+5aCbkq6P+v5
         Vm7kqpWpZa8Kqoc8T+3c7sW8jt/GEv7nDmtSn9O5kW+g61vdjEAPU1EjZszlZxOrjIMi
         b9rrZzL1fO1IowV4giFECd2m6QDnkvxbri6uqDmotRLrQMVSiLhTixPkujEZPTNxu8vs
         NMkYgIZLIgLdYh70OhJbfFB01AE1Y7KDk1APpcQfUmPPQwOQzFJZF8SIcic4gJbc2ZUP
         CMXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9ogS7z4HU1OHxi+C/8JkdIG5e1y3ky/c7uSWV9Uzhgo=;
        fh=4hS1yeconpIjCT2RpsjSCX8nsHAojH08ouzykNU7bCU=;
        b=WyN5X6tjcVQKfFlHNFodpeTW0oyyF7J0heMuVChNzWNEwTxaYTwWxN01yjUhgL3XN8
         c01M7nPGAjjm67kezF5MNnJLbxGfYyHuirmw9e9ABCIxgNdrou1EzSIOOz/PMlSKjL+9
         pUuBRHYPzX6mjayGqf6J3hkcR1MdFHt8sUDAbzFbkzs5zQYjmgaU797OrXasVqXG3y2d
         AyMV8FHjEU9UpBuciZJnXzNaRvh1kj3ArK/tC4vdhIipe1bA8z4sP7oVlZfEQ+PfffDL
         SogkjlRRXZHeool5+9RX/c0Kb3QuegscK8wZaCnyDWeCrW1cXbGhgDKevzCgB9fAyYEH
         /WiA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795731992; x=1796336792; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ogS7z4HU1OHxi+C/8JkdIG5e1y3ky/c7uSWV9Uzhgo=;
        b=Dpeo0iU2eMB48/cv4q0mE/PSL18hoK2Eb0wVZT49kVrnJ0RZOhfOybfgge+USPQfdb
         tghOmMY2HaqHACEqFKdJdcUq2RvfUyxK+suZowMtt+QwI/ytwV1LD51akFZyenE8FCKo
         PAn9usOhrcQgap0v3+g2+0sstAXFdff+HmLgWcuk8Ox9RGRNoaj/5ps2cujCyst9pA8G
         GzdLYIeOgUuShO+cBXOL7m4WdUEN4f/fV5mYdiS6RP5dSxljWwgZnzDYVeJaB7RzRwqE
         4d818eDZGC99gTyt89QBBJ6atMCr1uyjKRHJZX0XWGKoCbA/kYCfhNcKCXJyYH/rcDKV
         3M1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795731992; x=1796336792;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ogS7z4HU1OHxi+C/8JkdIG5e1y3ky/c7uSWV9Uzhgo=;
        b=s4tNvPql5LGNY1koidPn7X3NvGYohEmmDhW+sdRsF+VwRRo96q4ceZ1t7QAiRj5NQc
         kudkiOpRnN85mQESmUXUdCLRwaNfOcr6PosRUZDH4j5K/TekOLeaRuiuwq/o74jikN4I
         8D1YM+LD6dObYcihrgt6FHCHRbwAPaQsh/BXly5WURI9EIghTz1GODmsWRjgyFhXUjl0
         rukhfnEIy9qzgTmHow98A1CWxmCnrMyUSgR46A12DniwhFv9R1kOVLmKS9vcV3f5N7Tt
         Ez9wH1VTJQOWo2W24WBMeWZWbOVVTNOavLBgwuU9dS4FKnqNIZoHugIS10XCHSgC1I7U
         afrg==
X-Gm-Message-State: APuU4Z8NlwaoG9kmd/eRw6TPwR1ueM9WWc4nFjeKE3K3rm0m+Mqq7vzu
	+jLM1Rdq0XYWAMc0TPNPK0WdpDkqqMtdGuirxoNYWwCSlL8FSypqBRBi2RQH+fsPO8mWkz3NL3I
	oKcsaRYh7fvpsWuwXGVnS5RnpjafiS6U=
X-Gm-Gg: AZFdTZcmmMc19XHqN4CpACkRdsaHgXbn1ZikMAEdPEhfhU1RNmfC2uf6ktdYbTa1RaI
	WEdE0y3EPvlvbxu9AnwsVao5DbRPj4gKvSAnBNy8/rfJmFFV2iJGu1v4g6l5rpOBAi9UZel1ZPL
	4gF7AYwm7ROhMDqBL5gJ8TpBIurFnAWc+kqAl5g3u8srKGv4OnhWC0JY+8b+hIDCTLOhXlhrU2/
	UochMJ+vjzWQRhV9U5l2OHEciNA7Qx3Z8VadhPrE0AqIe1p5viS9xjVT808Es5aElHx99ICJ0A2
	NwZURmbHGjkGvip+yX4apALpNpwDr8nnxCCnazJDhiY+THEa94eCuabxsNDaPKai946vrYkqbqY
	0Jw5nRw+SwaB3xlJVYKbzd/G/VYPevlZ2YBqQtw325fe8etVKf/WdNodP1PSPIQo0IMhwCyQjPl
	rfKdjTTTqt/BYydyw/4sI=
X-Received: by 2002:a05:6512:124a:b0:5bf:b603:365d with SMTP id
 2adb3069b0e04-5c1bc7ad56amr7098632e87.10.1795731991744; Thu, 26 Nov 2026
 14:26:31 -0800 (PST)
MIME-Version: 1.0
References: <20261125154535.3486104-1-twoerner@gmail.com> <DN5AD0E8NBFJ.2E0I9RWKIMG2J@bootlin.com>
In-Reply-To: <DN5AD0E8NBFJ.2E0I9RWKIMG2J@bootlin.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 26 Nov 2026 17:26:18 -0500
X-Gm-Features: Aa3M54oipWTAoSTgz4tjndkWD-HrGH45b9dM1QcXgXVIuRmfhP7jQEEjqmfqy8I
Message-ID: <CAHUNapTSQtdi4Dt58BpX5a2joaq6anrqHnwihkFgzWW7tWk5Ag@mail.gmail.com>
Subject: Re: [docs] [PATCH 0/7] sphinx: carry lexers for the languages the
 manuals show
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 26 Nov 2026 22:26:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10845

On Thu, Nov 26, 2026 at 11:33=E2=80=AFAM Antonin Godard
<antonin.godard@bootlin.com> wrote:
>
> Hi Trevor,
>
> On Wed Nov 25, 2026 at 4:45 PM CET, Trevor Woerner via docs wrote:
> > This is the series proposed in [1]: the BitBake lexer first, then the
> > other lexers, one patch each. The BitBake lexer is patch 1 and can be
> > applied on its own.
>
> For most of the series, the code is unfortunately unreviewable and I don'=
t
> think we want to maintain that in the future. While I think there is some
> justification in adding lexers (better readability), I also think we coul=
d aim
> for an in-between:
>
> Pygments already has an upstream BitBake lexer (thanks to you). It can co=
ver
> most of our existing snippets. For the ones that are failing, we can skip=
 them
> (with a 'text' code-block) until the upstream lexer is fixed. Having our =
own
> BitBake lexer will not encourage upstream fixes - it will hide those upst=
ream
> errors and will rarely lead to an upstream fix.
>
> Patch 4 and 5, however, look like simple lexers, I am fine with keeping t=
hem.
> For the remaining lexers, I think we can accept that they won't be highli=
ghted
> (or highlight them with a similar lexer, if that is possible).
>
> > The series is based on master-next with two of your pending series
> > applied, since both also edit the extension list in conf.py:
> >
> >   - Add support for documentation tags [3]
> >   - Add a "Library Functions" section to the ref-manual [4]
>
> Can you rebase on master? These two series won't be merged before M1 anyw=
ay as
> they require some updates on the Autobuilder.

Absolutely! v2 coming up :-)
Thanks

>
> Thanks,
> Antonin
