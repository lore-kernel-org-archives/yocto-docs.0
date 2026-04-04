Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A25FF4936
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 16:16:38 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19265.1775319394267073682
 for <docs@lists.yoctoproject.org>;
 Sat, 04 Apr 2026 09:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EOBH3ajq;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-89f87257904so24621306d6.1
        for <docs@lists.yoctoproject.org>; Sat, 04 Apr 2026 09:16:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775319393; cv=none;
        d=google.com; s=arc-20240605;
        b=Adz73qskNuMokjJglTK76SfNYW/rePGJ7Ut263k/DvyYVsGOiQby8Es6edi3QfaNxc
         AeUAV8VazXRoonPTBJnr2Bn0c7I13R26BWeBt3MAcYngiRBu9MKMpNgE9pE9gOCFK4IV
         4OjChyUqr6d9D6FksAlu90bg9Mt3Mh5vs35b7vcvEci5XAPrWGec/6bspLA5BtE9yQ6O
         XAkTwlqDn8LyXg3RSihTGAYuheEt+3adr6bBX1y/qJd2anqHD24cg08VUD1CvpWvmlca
         NcmU1DhWS8SGA8FwlB6pcIO2DXjallZ/pM76KC153BuY7++y2lzqKIwtjQG/BtCaUGqW
         ScIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cMNKtSbbCVuTMAlxmb9oNofqkOHjPESjkejzVEFhQ50=;
        fh=ooBG7VR6cIDtg3HW1+YXxQyRer0qVZLxYo+89tBG6hg=;
        b=CAwotZ2IToPjMJzvlKhYn35fzbIYx/ZQGfZlfudUrg3PoPqycOtuk+hJ1e+h+8645r
         NsAr9cL8EsEcgAszZj9zvgvpKgI8sbjMqRHwsA26913j3141k9gn0lzBLBoO4DkdMgih
         seU6yRrrrkjyVLSXrfksFDMXz1AGt486IkAEJuOfvEjPcXgHNtq7WPhSd6PGbSbmuqwO
         oA3V3R7F51+MmiRZFQywI7AyxTDUurOuMxM7vTlMS1vcckfFMEvV0xjVZ+8Lwg04d/FB
         8Bk2Miq4/zbemUScpv9gu/j6UbpuS4ZsbS+hxGZceySFUhwFNdCxaKF2csbF9NzIZvL3
         XvGA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775319393; x=1775924193; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cMNKtSbbCVuTMAlxmb9oNofqkOHjPESjkejzVEFhQ50=;
        b=EOBH3ajqTiihXHzzK4GaTR4BrsQJyb5roy8zevT4dfFVEuFnMS9gaYWvvhI9Mm5Cpl
         D7SpgTAaYkJszpF7QcFruI4LezoUxtj8uOJQlpM4ouhk3KXXUm1tLkqLkekgSnK3Iqse
         5UJkZJUHweXs29Q+yBD2Ht6OSs0sqMS6fOeo9ve0Axs+O9Ig42ymQFjkPU50D6q1YVD6
         177Jrh3Xn5zUGdYqdMKMswDkxYPiPmB6KZwQJDFVHQ1lJwjpvoTU0/2FwhJEPJjnZDqi
         u3xfUxJ3G5L69sBYixd1w+P3keSUFzoz41FZ4H0kodnmMsYd8qyTxfPdZ2m7Xpp9D8Ge
         Q3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775319393; x=1775924193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMNKtSbbCVuTMAlxmb9oNofqkOHjPESjkejzVEFhQ50=;
        b=NPulO1syvmZVNiegxCYW2ougjlV/ZYWUFG0f7IJYEYntaUkg6GofeFolUXiPI3qdhj
         mitpIGrVfdOo1evxanOt/ht39Gj617ap6eClA3Vn5J2F28qRYzFy7UYMAz476BXUwJMl
         t/WL7BnBowbHk2sCaJjArGIz4AYNfFHuc5D1a+CcQHagKP+Ht+RgqwT/gdnWiRYY0Jh8
         Q9nH23+YYEV9nyjRCkGILpoqj79je9Hq7pfgWzvZoSRDVIGhFhyb6AbfzoIP3R2kppt6
         y04o0Z7d1Guk+LEQYCVwvtbulSRqZ+qkWvK3hd5qPCkNjbE5SovELxsq3ShQYm024+Gs
         1wiw==
X-Gm-Message-State: AOJu0Ywu4ZD6xkghj9vOgWW8hW/1izxwGlC47CJb9bbHTIVrhXNr/XP0
	Cvg+q6fgF1Qqd7z5+kqphKC7jsurFqVdOvV3Jhyozpi2FQXY2QFHgHOstEmnI2yzoFXM5Njc8D3
	0pJRadonGEuncgs29hexub6Ku19zIICE=
X-Gm-Gg: AeBDietxX+VPUufgLuKMShrrgWcT2L8xZ65gK6ID/nQvRVE0MPp6bHbSSTEbn0FQP/L
	3Bc80cRMO3YFVyCZG0ZBbJAy1Ubgk5CM4T80PipEyELdsDzLwgRazt6gbiIfRp1J7hLYy8X9yAU
	V1sDqp/I8Hii88kq+kHBqxVqxqwmOyGfSzSfrBicbZUUHbQI4zJ/KbqY/RQVvdBPE8Dw8yfGMP6
	lLs7DIagzonCG0hjDmo+7goa2A8D3ux6/pVuL3pjf8dlv6iYAkhYQvN7JNk7v0ppTt3OMsMGJUn
	gBUx4oMjcHVzdbWyozAh1MyakhKSLm4HAUzk5auU
X-Received: by 2002:a0c:e011:0:b0:89c:ab9c:a3c4 with SMTP id
 6a1803df08f44-8a705384914mr94295906d6.51.1775319393010; Sat, 04 Apr 2026
 09:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260331-docs-fixes-v1-0-45ee34341e72@bootlin.com>
 <20260331-docs-fixes-v1-1-45ee34341e72@bootlin.com> <6f743774-fe4b-4e9e-ba99-6ffe1d76a51b@cherry.de>
 <57bb4e5300a4be34f4cfddcf41d9a21b5b7bc579.camel@linuxfoundation.org>
 <CANNYZj9U3BYUv-cvQvmu7d=8O82Gdg-2GSon6vNJ71BMi6bKsg@mail.gmail.com>
 <DHJD5ZA0XGWN.3LDDWNE9PDM1X@bootlin.com> <CANNYZj8=z7U5jpCN+NaAmTspYduH=pcMohMcbnqGp8mQvmHoiA@mail.gmail.com>
 <ea91cc2bf0fcaeee1a152e62f0ebfd367b58b2fa.camel@linuxfoundation.org>
 <275547.1775288047872145943@lists.yoctoproject.org> <CANNYZj9dkJ_Bz-a_DLHB4SW5_tJCkHHd1Y_QJOQ6_8eZrmnMvg@mail.gmail.com>
 <CAFAffzw-TXoYgc5Xw4Ds1Mop9RO7ofN1zp92t-Uh7FtEp8PboQ@mail.gmail.com>
In-Reply-To: <CAFAffzw-TXoYgc5Xw4Ds1Mop9RO7ofN1zp92t-Uh7FtEp8PboQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 4 Apr 2026 18:16:22 +0200
X-Gm-Features: AQROBzBTe57QUnI84T_ghI59z738MHGq15GnCDzdYipJTkHniikGmBQJbpIn80c
Message-ID: <CANNYZj_wNAYurJcO1T2L6BbaaizGjgr3FHabrcpk4cAYN0UoAw@mail.gmail.com>
Subject: Re: [bitbake-devel] [docs] [PATCH 1/2] bitbake-setup: rename "abort"
 rebase conflict stragegy to "halt"
To: Adam Blank <adam.blank.g@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c886f3064ea4c1a5"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 04 Apr 2026 16:16:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9180

--000000000000c886f3064ea4c1a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please include a link to any citations. Because this is not what it says:
https://www.merriam-webster.com/dictionary/abort


Alex

On Sat 4. Apr 2026 at 17.58, Adam Blank <adam.blank.g@gmail.com> wrote:

> On Sat, 4 Apr 2026, 17:34 Alexander Kanavin, <alex.kanavin@gmail.com>
> wrote:
>
>> =E2=80=98Abandon=E2=80=99 doesn=E2=80=99t revert the state to how it was=
. It just leaves the mess
>> as it is.
>>
>>
> After Merriam-Webster:
>
> Abort means to stop, cancel, or terminate a process, project, or mission
> before its completion. It is often used to describe abandoning a dangerou=
s
> or flawed plan (e.g., "abort the mission") or ending a pregnancy
> prematurely. It also refers to a technical stoppage in computing or
> aerospace.
>
> Synonyms for Abort:
> Terminate/Stop: Halt, end, cease, discontinue, break off.
> Cancel/Abandon: Scrub, scrap, call off, abandon.
>
> 'Abort' carries no notion of reverting the mess either.
>
>
>> Alex
>>
>> On Sat 4. Apr 2026 at 9.34, Adam Blank via lists.yoctoproject.org
>> <adam.blank.g=3Dgmail.com@lists.yoctoproject.org> wrote:
>>
>>> Personally I don't have any specific preference, but as a hint for you
>>> guys: for a non-native English speaker (of a Slavic origin at least),
>>> "abandon" would convey a practically identical sense to "abort" and wou=
ld
>>> be some sort of a compromise.
>>>
>>> Thanks,
>>> Adam
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#9177):
>>> https://lists.yoctoproject.org/g/docs/message/9177
>>> Mute This Topic: https://lists.yoctoproject.org/mt/118594590/1686489
>>> Group Owner: docs+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
>>> alex.kanavin@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>
>>>

--000000000000c886f3064ea4c1a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please include a link to any citations. Because this is n=
ot what it says:</div><div dir=3D"auto"><div style=3D"font-size:inherit" di=
r=3D"auto"><a href=3D"https://www.merriam-webster.com/dictionary/abort" sty=
le=3D"font-size:inherit">https://www.merriam-webster.com/dictionary/abort</=
a></div><div style=3D"font-size:inherit" dir=3D"auto"><br></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"g=
mail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On =
Sat 4. Apr 2026 at 17.58, Adam Blank &lt;<a href=3D"mailto:adam.blank.g@gma=
il.com">adam.blank.g@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><di=
v dir=3D"ltr"><div dir=3D"auto"><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sat, 4 Apr 2026, 17:34 Alexander Kanavin, &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-=
left:1ex;border-left-color:rgb(204,204,204)"><div dir=3D"auto">=E2=80=98Aba=
ndon=E2=80=99 doesn=E2=80=99t revert the state to how it was. It just leave=
s the mess as it is.</div><div dir=3D"auto"><br></div></blockquote><div><br=
></div><div><div class=3D"gmail_default" style=3D"font-size:small">After Me=
rriam-Webster:</div><div dir=3D"auto"><br></div><div dir=3D"auto">Abort mea=
ns to stop, cancel, or terminate a process, project, or mission before its =
completion. It is often used to describe abandoning a dangerous or flawed p=
lan (e.g., &quot;abort the mission&quot;) or ending a pregnancy prematurely=
. It also refers to a technical stoppage in computing or aerospace.=C2=A0</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Synonyms for Abort:</div>=
<div dir=3D"auto">Terminate/Stop: Halt, end, cease, discontinue, break off.=
</div><div dir=3D"auto">Cancel/Abandon: Scrub, scrap, call off, abandon.</d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">&#=
39;Abort&#39; carries no notion of reverting the mess either.</div></div></=
div></div></div><div dir=3D"ltr"><div dir=3D"auto"><div class=3D"gmail_quot=
e"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex=
;border-left-color:rgb(204,204,204)"><div dir=3D"auto"></div><div dir=3D"au=
to">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sat 4. Apr 2026 at 9.34, Adam Blank via <a href=3D"http://l=
ists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproj=
ect.org</a> &lt;adam.blank.g=3D<a href=3D"mailto:gmail.com@lists.yoctoproje=
ct.org" rel=3D"noreferrer" target=3D"_blank">gmail.com@lists.yoctoproject.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-l=
eft:1ex;border-left-color:rgb(204,204,204)"><div>Personally I don&#39;t hav=
e any specific preference, but as a hint for you guys: for a non-native Eng=
lish speaker (of a Slavic origin at least), &quot;abandon&quot; would conve=
y a practically identical sense to &quot;abort&quot; and would be some sort=
 of a compromise.</div>
<div>=C2=A0</div>
<div>Thanks,</div>
<div>Adam</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9177): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/9177" rel=3D"noreferrer noreferrer" target=3D"_blank">https://list=
s.yoctoproject.org/g/docs/message/9177</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/118594590/168=
6489" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopr=
oject.org/mt/118594590/1686489</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" rel=3D"=
noreferrer" target=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/=
docs/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" rel=3D"noreferrer=
" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br><br>
</blockquote></div></div>
</blockquote></div></div>
</div>
</blockquote></div></div>

--000000000000c886f3064ea4c1a5--

