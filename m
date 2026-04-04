Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9452FE63FE5
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 16:29:38 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19803.1775320175986466554
 for <docs@lists.yoctoproject.org>;
 Sat, 04 Apr 2026 09:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=szWh01R/;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-89cc71f4311so37517886d6.3
        for <docs@lists.yoctoproject.org>; Sat, 04 Apr 2026 09:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775320175; cv=none;
        d=google.com; s=arc-20240605;
        b=RCYdVzf8zhs3m8d9yOnYcMRphJIJ+h2qVwPqm+tcxxzDRrAEioEIhkkHmkNXE++dYf
         LnqBVKQ9Tn2i1hwHYbmj/JsYxVlK2Wb+xVEYOeYpENKdzDZmdbvmFZdj1ZI+rTZWu2Y2
         p0gtO9l0CiQpbPK6E6C33XQhwiB4EPPFIgKxh+sK6fiyVJ78lXDMi2yOz99GDYVsHWmu
         Lo7+z6asJPFuKJ0cdyTtZTksBWmvmHkWhS/4IRLfluXyOY0ErpHEy3rvHEEKs3kBdHJ7
         7ePTKhBbDgaNqz9JcZij3mFDZZNoeVWehOT/wqv9D6LjAMB3Dgr7lN7fSF8+3DqUvwly
         IY6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/092/afLggCBkNnrCH3GDqmPKoAyx/QY5RdPwMitOJo=;
        fh=jI6n6YtPUB3OosCtNoCXCEf+a2MwJaEnTn5oYO49mFc=;
        b=Qh8o6wgulllKVHQX9HSXix4d7sKAFT0VHbrLoG8GyDXGQMr3h9iKIcG8oAP41pGxEU
         ovxXR9fGNqN1VB+JnTfzJRJp2zF59SCZxCL7v7KxAHyb1DBang7U5lpSxcG7Kdp/2zW6
         1oTbAGpxAqJNtK4I7d4AM5QpyikVkAvtcpQ/E0fkb/9kksNZDjpqtT4yxNZvJUks8Qq3
         VKNMJhuD6DvKAZqs/mCzWe759a2F7MNtOCbZkLghOa7tyJA70cflVJ/qdbCFmKdVFmQy
         I6LOxf8TmNH4WN+9BNYh+e1C76aUQe6aiWMtb8LrC37qjg0VE64JnI6W4treLJMFYwQ1
         8iWw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775320175; x=1775924975; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/092/afLggCBkNnrCH3GDqmPKoAyx/QY5RdPwMitOJo=;
        b=szWh01R//LywBfj04yFV8LVyHyy3begBtmCVCkv7wFonyG6XJ5NWLKDsMzfSemDFzl
         b1HQxVDadyhJQ9OsmUt44klqTjfJJKWUY+j4SuOzKCTc+NJDDuy5Kc9U/oxfMhQDD4tY
         MJp/Bnv9vWerNb4WOBn2BC/axhvS0/QsB/LofXqSwVH1T6i9EWjuM39C0ZHzKFQF6mpr
         r6EeKX64wPx4y9gsYBrz2tX0s8MfS/kwwr+ZCX+ayoatr0v8pNqoMVIr6sk+9gooi95x
         yFJVTKni4eEsEYi75lcDRZLZw9MQrMBxc4oZJYS7o2xYmH1kebonzcRKS1PshvI2YfmB
         CJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775320175; x=1775924975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/092/afLggCBkNnrCH3GDqmPKoAyx/QY5RdPwMitOJo=;
        b=mVfm4NfdjpE5G2tGaJSpGWcYT9TaKh3Ro9y4zJEcHc0F6EnLNkBXS3SmCjehmBS3en
         lFQw6OHEAOZcui7xBfZxmrI7a2idOe+ZsOYKTF44UkQEUmM0ES5f1slV8ds6oNc9+FwG
         91GFmjMRyI+DA6GfMcShbDVHIfOC9em5stTtdJrZaOFvxqxLnzMOz9IFvOPWhOws5hNh
         w/qKdrT3KDFxmyIriFc4yvxP9/auyQ8V1E9vL6DzWAR1f/IUgwt/QjP4yQ590UnZ1IRp
         mqMwIp6+zxuF2TJ6WlFqW822aBge65YjKCKpjXO9L3bEGVe7hngznRtOyGliI5Am2T4q
         LBHg==
X-Forwarded-Encrypted: i=1; AJvYcCXcAJNgtGTomWXDc3/OTZfhVWKr3ieRF8PBZTjVz0bch4IfL5pz3WdPiE9V8G5fUJVtNrd5@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwccKoUvUe8B03+t7maRS6Tw5hhVfn/cb+adbXZ84FlAMiYM6R+
	qw3lJYjIan8dAqAce631C9pNvFn+v0NL4iFqESmT+3MxDbcx0kozRI4i544UqJQIpv7qA39cgxp
	FG83t3YHQR5ULMuibKVVZ4fSP+d8i2HE=
X-Gm-Gg: AeBDiev1pDoQ0z4RQrVRaZBcrdmT9InqjzMVRPgXiMd1IE9A2QD9WR86/J7VVzP9a7b
	VaJg6LFLbvrSk3nv/5XvSNVNHq8hRArP/5g+UJ5wYiGqm4fjua6ixrfy1c4r+cIp+DS/lAL4vmO
	SiJn83N0PJ0WoN53Ge4E4DwYdlC/oB8Nhf5xEeQowAkgA/3jcvez7j3M2K9nthU7yz78lduTmYu
	KSMiMkon9KrMhtjiUA6XneJ+Y5Pol17jEtAOc6XOGoM8k71YEq7q7kkbpd+6FJa9PVKlqsF1Db4
	ZUwBJUqgHq9UU/rvZEptnQZjmPpiD8ukIwgTzSO85qQC5Aw26kI=
X-Received: by 2002:a05:6214:5903:b0:8a1:88f7:d292 with SMTP id
 6a1803df08f44-8a7023c1573mr115208476d6.13.1775320174924; Sat, 04 Apr 2026
 09:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260331-docs-fixes-v1-0-45ee34341e72@bootlin.com>
 <20260331-docs-fixes-v1-1-45ee34341e72@bootlin.com> <6f743774-fe4b-4e9e-ba99-6ffe1d76a51b@cherry.de>
 <57bb4e5300a4be34f4cfddcf41d9a21b5b7bc579.camel@linuxfoundation.org>
 <CANNYZj9U3BYUv-cvQvmu7d=8O82Gdg-2GSon6vNJ71BMi6bKsg@mail.gmail.com>
 <DHJD5ZA0XGWN.3LDDWNE9PDM1X@bootlin.com> <CANNYZj8=z7U5jpCN+NaAmTspYduH=pcMohMcbnqGp8mQvmHoiA@mail.gmail.com>
 <ea91cc2bf0fcaeee1a152e62f0ebfd367b58b2fa.camel@linuxfoundation.org>
 <275547.1775288047872145943@lists.yoctoproject.org> <CANNYZj9dkJ_Bz-a_DLHB4SW5_tJCkHHd1Y_QJOQ6_8eZrmnMvg@mail.gmail.com>
 <CAFAffzw-TXoYgc5Xw4Ds1Mop9RO7ofN1zp92t-Uh7FtEp8PboQ@mail.gmail.com> <18A333954F38AD11.657799@lists.yoctoproject.org>
In-Reply-To: <18A333954F38AD11.657799@lists.yoctoproject.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 4 Apr 2026 18:29:23 +0200
X-Gm-Features: AQROBzDFYrQZR3BhL5-SK6gL-4vs6V6S0Y35yObttmTElS3GCXOofBG5sMuwxpI
Message-ID: <CANNYZj-Oaun1Jx3GqZPtBO9uS2Rdt+NPhBdb8yzag9ziWa+5vg@mail.gmail.com>
Subject: Re: [bitbake-devel] [docs] [PATCH 1/2] bitbake-setup: rename "abort"
 rebase conflict stragegy to "halt"
To: alex.kanavin@gmail.com
Cc: Adam Blank <adam.blank.g@gmail.com>, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000006397c7064ea4f0db"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 04 Apr 2026 16:29:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9182

--0000000000006397c7064ea4f0db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Having read that, and the entry for =E2=80=98abandon=E2=80=99, there=E2=80=
=99s a clear difference
between them.

Abandoning is uncontrolled, dangerous and ungraceful. Abortion is the
opposite, and does go back to a previous, =E2=80=98safe=E2=80=99 state in e=
xamples, if not
in definition itself.

Alex

On Sat 4. Apr 2026 at 18.16, Alexander Kanavin via lists.yoctoproject.org
<alex.kanavin=3Dgmail.com@lists.yoctoproject.org> wrote:

> Please include a link to any citations. Because this is not what it says:
> https://www.merriam-webster.com/dictionary/abort
>
>
> Alex
>
> On Sat 4. Apr 2026 at 17.58, Adam Blank <adam.blank.g@gmail.com> wrote:
>
>> On Sat, 4 Apr 2026, 17:34 Alexander Kanavin, <alex.kanavin@gmail.com>
>> wrote:
>>
>>> =E2=80=98Abandon=E2=80=99 doesn=E2=80=99t revert the state to how it wa=
s. It just leaves the
>>> mess as it is.
>>>
>>>
>> After Merriam-Webster:
>>
>> Abort means to stop, cancel, or terminate a process, project, or mission
>> before its completion. It is often used to describe abandoning a dangero=
us
>> or flawed plan (e.g., "abort the mission") or ending a pregnancy
>> prematurely. It also refers to a technical stoppage in computing or
>> aerospace.
>>
>> Synonyms for Abort:
>> Terminate/Stop: Halt, end, cease, discontinue, break off.
>> Cancel/Abandon: Scrub, scrap, call off, abandon.
>>
>> 'Abort' carries no notion of reverting the mess either.
>>
>>
>>> Alex
>>>
>>> On Sat 4. Apr 2026 at 9.34, Adam Blank via lists.yoctoproject.org
>>> <adam.blank.g=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>
>>>> Personally I don't have any specific preference, but as a hint for you
>>>> guys: for a non-native English speaker (of a Slavic origin at least),
>>>> "abandon" would convey a practically identical sense to "abort" and wo=
uld
>>>> be some sort of a compromise.
>>>>
>>>> Thanks,
>>>> Adam
>>>>
>>>>
>>>>
>>>>
>>>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9180):
> https://lists.yoctoproject.org/g/docs/message/9180
> Mute This Topic: https://lists.yoctoproject.org/mt/118594590/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006397c7064ea4f0db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Having read that, and the entry for =E2=80=98abandon=E2=
=80=99, there=E2=80=99s a clear difference between them.=C2=A0</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Abandoning is uncontrolled, dangerou=
s and ungraceful. Abortion is the opposite, and does go back to a previous,=
 =E2=80=98safe=E2=80=99 state in examples, if not in definition itself.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Sat 4. Apr 2026 at 18.16, Alexander Kanavin via <a href=3D"http://li=
sts.yoctoproject.org">lists.yoctoproject.org</a> &lt;alex.kanavin=3D<a href=
=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproject.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-l=
eft:1ex;border-left-color:rgb(204,204,204)"><div dir=3D"auto">Please includ=
e a link to any citations. Because this is not what it says:</div><div dir=
=3D"auto"><div style=3D"font-size:inherit" dir=3D"auto"><a href=3D"https://=
www.merriam-webster.com/dictionary/abort" style=3D"font-size:inherit" targe=
t=3D"_blank">https://www.merriam-webster.com/dictionary/abort</a></div><div=
 style=3D"font-size:inherit" dir=3D"auto"><br></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat 4. Apr 2026 at 17.58, Adam Bla=
nk &lt;<a href=3D"mailto:adam.blank.g@gmail.com" target=3D"_blank">adam.bla=
nk.g@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:sol=
id;padding-left:1ex;border-left-color:rgb(204,204,204)"><div dir=3D"ltr"><d=
iv dir=3D"auto"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Sat, 4 Apr 2026, 17:34 Alexander Kanavin, &lt;<a href=3D"mailto:al=
ex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-=
left-color:rgb(204,204,204)"><div dir=3D"auto">=E2=80=98Abandon=E2=80=99 do=
esn=E2=80=99t revert the state to how it was. It just leaves the mess as it=
 is.</div><div dir=3D"auto"><br></div></blockquote><div><br></div><div><div=
 class=3D"gmail_default" style=3D"font-size:small">After Merriam-Webster:</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Abort means to stop, canc=
el, or terminate a process, project, or mission before its completion. It i=
s often used to describe abandoning a dangerous or flawed plan (e.g., &quot=
;abort the mission&quot;) or ending a pregnancy prematurely. It also refers=
 to a technical stoppage in computing or aerospace.=C2=A0</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Synonyms for Abort:</div><div dir=3D"auto=
">Terminate/Stop: Halt, end, cease, discontinue, break off.</div><div dir=
=3D"auto">Cancel/Abandon: Scrub, scrap, call off, abandon.</div><br></div><=
div><div class=3D"gmail_default" style=3D"font-size:small">&#39;Abort&#39; =
carries no notion of reverting the mess either.</div></div></div></div></di=
v><div dir=3D"ltr"><div dir=3D"auto"><div class=3D"gmail_quote"><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-c=
olor:rgb(204,204,204)"><div dir=3D"auto"></div><div dir=3D"auto">Alex</div>=
<div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Sat 4. Apr 2026 at 9.34, Adam Blank via <a href=3D"http://lists.yoctoproj=
ect.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> &l=
t;adam.blank.g=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" rel=3D=
"noreferrer" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border=
-left-color:rgb(204,204,204)"><div>Personally I don&#39;t have any specific=
 preference, but as a hint for you guys: for a non-native English speaker (=
of a Slavic origin at least), &quot;abandon&quot; would convey a practicall=
y identical sense to &quot;abort&quot; and would be some sort of a compromi=
se.</div>
<div>=C2=A0</div>
<div>Thanks,</div>
<div>Adam</div>
<br>
<br>
<br><br>
</blockquote></div></div>
</blockquote></div></div>
</div>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9180): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/9180" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/9180</a><br>
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

--0000000000006397c7064ea4f0db--

