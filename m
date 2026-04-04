Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4A6D7308D
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 15:34:08 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18535.1775316847171415793
 for <docs@lists.yoctoproject.org>;
 Sat, 04 Apr 2026 08:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WPzvyl5u;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8a093c784b0so38855206d6.3
        for <docs@lists.yoctoproject.org>; Sat, 04 Apr 2026 08:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775316846; cv=none;
        d=google.com; s=arc-20240605;
        b=D/rykYH5hb66mhp6mouZCeJRwmOzrTOB51hlGMPdcABxBqzP/vMMA+R1Ppb8iKIwdJ
         9FVppqSAh676rsJuG1metZkc8a8LL3bJqlEgMyWv82Y6CS1Xef6qoa8oqV0uyg1f9alc
         Ca9PRmN2BLrE+/Um6t3r6lDBSgXGuic3O/NZkfa5tBC/3BaqDMrocLo3mmYgWh9HWGsM
         nrE7jlzQMdXWLtl3OpBXIjVk9PrGF91L4COJoJrA36Hp3xKlQKbeR3+9LE49mNMXCk/U
         2ArTVBTsqN5gshw2l3MDUTRN25vkQdc+J1hC5JEk5ijXuQdxWAOYwCT+sK3XMq+uOtJ1
         CsAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0rO92fOQ9xn3uzes8aINrhVgjRRdDL5WwtvHo2D2QIE=;
        fh=cQSS+1wM4lAoMWrxv+sw4e0bKwicAFbgVXp8BJhXmvA=;
        b=Z+VL6U++yfsBvvHpkiU42DsBVAn1ERKrQffPhqpL/4hPq+kz/EsaxwNbobAwOaFCuX
         pL4YVrbljSlwTDb74NTsMpqS4kYioA/ud4m3X7XaH/V5z6vpOPY9uA/CMimLC6ACRy7E
         5XW5Sm0//E9Eony1897cj/BjjU2L3M3ErNSpgC8ka1gznI/slLtQUVpJbUhmksMtnC6h
         KF8iRbpFYRQGPyomnNv4+EbOZpMrZFyb0GJwmfZyIQ//zRiHxhFvRiQxqhYzqoq4NNeY
         sGSeb4ey6K0fhTWJURrKX57qc8D0rwtXW3Dn7S30eddf2VmZfb6dSs/USqWeGwEH0r4b
         On1w==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775316846; x=1775921646; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0rO92fOQ9xn3uzes8aINrhVgjRRdDL5WwtvHo2D2QIE=;
        b=WPzvyl5u90T64vf/R6aAEyckjpdwJCKlN+SZp/UEa1DQ7Cxx97Oky5zdyfTyczL0nc
         Hwu1BRYhElNM3xqCtFGXZf3SIBLtreygVALWjUxGWY9FMcMNtCKU2XNUh99sUtGkx1xa
         QBi6h7sY91bOD/x/3xONEOu75Z+/+eXMM0mRLIBCvQOoBHBV4uvBk2vlI1M/5y5ydJwo
         T80oViaoHkIZDQUchALiwRPH2+bwnVcV9CUqZu0t/i41Cx8iOqkMXq/mfsWzuUxblzgI
         jPZJcPS7GkROHMbpLJJF1ZLGLTPOtDmHvB382DAjvkFvxuUOMLTxGRwJU29GZPtf51pg
         pJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775316846; x=1775921646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rO92fOQ9xn3uzes8aINrhVgjRRdDL5WwtvHo2D2QIE=;
        b=HOSNtoSfX3mTc4kazjs89QsnoLvH8J1lUfqwYUBb+rpQJjrokcSb3xGyqtz6BRl8VH
         qpWIoakYoqweygN+8QQ8T8VWMUSzvPDD8w+np1F1MApmJbpasOLD5INo7ffZV0wumW7a
         Sve49xOnM31YM+t2bw7GpgC7KDJdUvgwYADQsrzttIflFgqAla9P/8RwqJCGAaYmm40h
         HiA0Clj/6aVCvJyaZCLAOpmKCg3K83O7V9Nk9ju8yFHpZVx1Z3tG4ybxz75AZdWYv4bQ
         3gJIqcF7mKad2TwGIwuqErYnDfv3SgJXVhihmIiYtOn7ZzkH4CbPIazyy3Vmr3MFVwCZ
         5jvA==
X-Gm-Message-State: AOJu0YyhsDxDUJbb/Lg2sOZZrzkK3MmlYfJotLCOCN307dlwL2GwQ9fT
	3rlBRe58+ZIHtH4O/jySlIXJXBUaa2Bm/xvDHHRxt6GWEPWFRzSRBL0NWdAxAiS/xv3I4XHFa7m
	4wnwOCNA31ILYUn1oLHKcJ6cb6+34WlY=
X-Gm-Gg: AeBDietsP07QdKZTA+3eCCL5uRhbnLKCOawZXviq+tnbF+h7GXGU1LgyF/HMY17H29C
	QFvK8hJnbhSXub8n27ubeIT3UQPsT2Xga36JR/QZXUHOTYEgy1qZ4lfGwjuhdCJVALfEapyHFIm
	Lou8SKgpZKqvuzlXxotlorWtu67dH01zmIgjzrfbhW6WO5XyS1M1/wZ4MWmm9AOoP7/n/5JH6lX
	CPGC2wzqpxXEqL7iUnCpkTtr3igN087j9Wgin5gjAg3LvS6I+2QkrvwV3VkzFssxNdE3n/tuxa+
	EGMzv/s26LMWfZLrpYCQdJDmpunLd4mXJsiS96pE
X-Received: by 2002:ad4:5e8a:0:b0:8a5:104b:e385 with SMTP id
 6a1803df08f44-8a7043ee17fmr111538956d6.35.1775316845951; Sat, 04 Apr 2026
 08:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260331-docs-fixes-v1-0-45ee34341e72@bootlin.com>
 <20260331-docs-fixes-v1-1-45ee34341e72@bootlin.com> <6f743774-fe4b-4e9e-ba99-6ffe1d76a51b@cherry.de>
 <57bb4e5300a4be34f4cfddcf41d9a21b5b7bc579.camel@linuxfoundation.org>
 <CANNYZj9U3BYUv-cvQvmu7d=8O82Gdg-2GSon6vNJ71BMi6bKsg@mail.gmail.com>
 <DHJD5ZA0XGWN.3LDDWNE9PDM1X@bootlin.com> <CANNYZj8=z7U5jpCN+NaAmTspYduH=pcMohMcbnqGp8mQvmHoiA@mail.gmail.com>
 <ea91cc2bf0fcaeee1a152e62f0ebfd367b58b2fa.camel@linuxfoundation.org> <275547.1775288047872145943@lists.yoctoproject.org>
In-Reply-To: <275547.1775288047872145943@lists.yoctoproject.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 4 Apr 2026 17:33:55 +0200
X-Gm-Features: AQROBzDCiU0Xf5OvfEidGySP8VBE0uNrJfSZSxfrgOLD9iQIzfyTFi-SuAXZCYQ
Message-ID: <CANNYZj9dkJ_Bz-a_DLHB4SW5_tJCkHHd1Y_QJOQ6_8eZrmnMvg@mail.gmail.com>
Subject: Re: [bitbake-devel] [docs] [PATCH 1/2] bitbake-setup: rename "abort"
 rebase conflict stragegy to "halt"
To: adam.blank.g@gmail.com
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f77c66064ea4291b"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 04 Apr 2026 15:34:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9178

--000000000000f77c66064ea4291b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=E2=80=98Abandon=E2=80=99 doesn=E2=80=99t revert the state to how it was. I=
t just leaves the mess
as it is.

Alex

On Sat 4. Apr 2026 at 9.34, Adam Blank via lists.yoctoproject.org
<adam.blank.g=3Dgmail.com@lists.yoctoproject.org> wrote:

> Personally I don't have any specific preference, but as a hint for you
> guys: for a non-native English speaker (of a Slavic origin at least),
> "abandon" would convey a practically identical sense to "abort" and would
> be some sort of a compromise.
>
> Thanks,
> Adam
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9177):
> https://lists.yoctoproject.org/g/docs/message/9177
> Mute This Topic: https://lists.yoctoproject.org/mt/118594590/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f77c66064ea4291b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">=E2=80=98Abandon=E2=80=99 doesn=E2=80=99t revert the stat=
e to how it was. It just leaves the mess as it is.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 4. Apr 202=
6 at 9.34, Adam Blank via <a href=3D"http://lists.yoctoproject.org">lists.y=
octoproject.org</a> &lt;adam.blank.g=3D<a href=3D"mailto:gmail.com@lists.yo=
ctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb=
(204,204,204)"><div>Personally I don&#39;t have any specific preference, bu=
t as a hint for you guys: for a non-native English speaker (of a Slavic ori=
gin at least), &quot;abandon&quot; would convey a practically identical sen=
se to &quot;abort&quot; and would be some sort of a compromise.</div>
<div>=C2=A0</div>
<div>Thanks,</div>
<div>Adam</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9177): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/9177" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/9177</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/118594590/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/118594590/1686489</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f77c66064ea4291b--

