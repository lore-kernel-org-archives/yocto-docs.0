Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA81E63FEB
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 17:13:38 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20383.1775322810685560884
 for <docs@lists.yoctoproject.org>;
 Sat, 04 Apr 2026 10:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CN3m64Ag;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cfc795ca97so229273785a.0
        for <docs@lists.yoctoproject.org>; Sat, 04 Apr 2026 10:13:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775322810; cv=none;
        d=google.com; s=arc-20240605;
        b=bORNqajsoF/iHIc3q35IAMda5ZbM0jtOaIkrcjMagsZkqp5/WREnalk2rhrZplLIhQ
         BxSTLq3/akyjJbM+iIO7zoZJVxdtuqhFmg5GHufcganPXERVF0hMGGaGlawEWS4bHYfo
         ejSc+2jd6YmA2Pn8JIqG8Y4VQRALTppE/12jpRN0303LwqGDt3enELW/GfMRE/qEBdmG
         dRxygyZ8T+mz/8vZ9HwN99EvU1+rPrPVMx+d6fKka7PyYX9n3YQUyOmSTWBVMyT+jeoF
         ZIthDFN4DxKIPYsU9NIkXJvwQevgWr8pRnG1gpo4LKe20dm2M1I1yYTdrnoS/ZS5CGqY
         CJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NoZlGYrQl5i9hd+YMmZ51XO33n2aAja79V3pPTj8j48=;
        fh=ooBG7VR6cIDtg3HW1+YXxQyRer0qVZLxYo+89tBG6hg=;
        b=XjcLz8LUOPlxFaHlKp70lNvYfshdzXecSnVtptmNvvDtfy2HfAiLMalxGcZwu5adVB
         Tjd+K98xGzQGhxzhANEYeePHzLh2+dcC5gqq29xIcAVf6VtwhsBc8URYAbe0p/OdnwKc
         kCeBgLpgWlNwTEH4dOnwic3ETxiSBwQQHICPSWnqECNILK1jQjS97mFLWziTXmQcDDd2
         owLu8NTdmLmLBF7zLNSDjFQl22xJRajfy9ddyR03JBV8hsZ8UEV7Y+GxKF2LunNXr4ki
         JGnkUSO6Jp/MYnhUk05XbEzVfMA4RWKGv76Oa1BkcRTTPgB1yQGZi07zDXBmsGigbxY6
         KO4w==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775322810; x=1775927610; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NoZlGYrQl5i9hd+YMmZ51XO33n2aAja79V3pPTj8j48=;
        b=CN3m64AgrOMJ4BH3Pg2LWGZB2azu7cAXb7H+VVWUO65xplekcgyay4SF3KcEeAF6uU
         NIjvlPy2L80+vR5ejku8ExZO5VjNbD2KbmbSrjYn4pmKHvLAtXSciUxviS0Q2sWMdHvt
         UbaCp1Eti9b+h0SnZadgtKCS2rArJPCf0IoWFfwaji8I+XBuZSwxV23spaAnEtyON7eC
         rqXK0eJwyyyTZjRnDk3RQYhbuiUCfYh+MUxPFYgZ3/LNURIX0fGTA8CZhYI0h0QnMRET
         JZMBFENYpGabkd+Grx+zEdNd5snK9YvaFEMirKFgWBkzkmy/leM5rHKTFqShZuqjyevB
         t3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775322810; x=1775927610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoZlGYrQl5i9hd+YMmZ51XO33n2aAja79V3pPTj8j48=;
        b=KdteXmEItQg6OWdplbojiXobx4HkRXAPJ+J3FmV6KHC6HpZxFIWm0fuCKdnHyvbqbf
         UImMCQi0pUptuvWB+NWVaAcOh3RYSRgqahbIR6l6Eui+8bebcj0BFHzu/3sKD4lHGnsK
         4eQfE8ypu1X8lWxW+BHJ7k1svUB/fcMCddZAVwQB+4vjWHuKzBS/czQTD34LuYSXYvvz
         ELDkhIwV3ZCtr35oI+1Z3DOBNxoJHMdTRIHDTCcvrY77A6k6iH/TqTihUOsr3jpZ+0y9
         wx7hUfbocK7CCpMDOiOoYLOi7yP9jH2BGnvoKoMlDykocwkWnF5P2C+8hHJiPoD+UH8y
         IYSg==
X-Gm-Message-State: AOJu0YyDdVC6iH4VYCGMB0zquPWyY/0ddPa6fUTXVoascCjgu/B0By79
	9B906WOI3fMPz2Nsxyhe8qk4C0YGBFvA5MGeiMTcafly3rg+XjeQCq4QhBDU348X7VB5XHALBiZ
	i7HtgUfKb+lDQsCuGj6k9PHdFb8x9H6M=
X-Gm-Gg: AeBDieucVYoVORTJjKSycuhMEgGcmRnt7DZBDkSbXcM7hpB+8kQGG7LbtMwxctE4jqx
	6axAU69HjcPLWhGF1CQ8JQgnP8onScppAmPYefd0HQOxFLZzSAVCKFa/zr8SlZt+ACdqAgGkZkG
	bR4GFJO+D4mIJIldwklvXwQjnLzV/HVIlda0FPj/bCxrDH3MH0075D8NKR5WCC35FzWCIp4wAHz
	h5yFxZsqO4HPElbkHDFKU1tPb+VmI3MMDM/oH0//Z6mknKNlqls4+UJnj1ZpcQZOD2l0TsA+FdQ
	JSEtakIWg8f774tM4+GARAsdD6cGGEAfz0pc/N5T
X-Received: by 2002:ad4:5aa4:0:b0:8a0:d08c:a721 with SMTP id
 6a1803df08f44-8a70345e395mr126588086d6.22.1775322809556; Sat, 04 Apr 2026
 10:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260331-docs-fixes-v1-0-45ee34341e72@bootlin.com>
 <20260331-docs-fixes-v1-1-45ee34341e72@bootlin.com> <6f743774-fe4b-4e9e-ba99-6ffe1d76a51b@cherry.de>
 <57bb4e5300a4be34f4cfddcf41d9a21b5b7bc579.camel@linuxfoundation.org>
 <CANNYZj9U3BYUv-cvQvmu7d=8O82Gdg-2GSon6vNJ71BMi6bKsg@mail.gmail.com>
 <DHJD5ZA0XGWN.3LDDWNE9PDM1X@bootlin.com> <CANNYZj8=z7U5jpCN+NaAmTspYduH=pcMohMcbnqGp8mQvmHoiA@mail.gmail.com>
 <ea91cc2bf0fcaeee1a152e62f0ebfd367b58b2fa.camel@linuxfoundation.org>
 <275547.1775288047872145943@lists.yoctoproject.org> <CANNYZj9dkJ_Bz-a_DLHB4SW5_tJCkHHd1Y_QJOQ6_8eZrmnMvg@mail.gmail.com>
 <CAFAffzw-TXoYgc5Xw4Ds1Mop9RO7ofN1zp92t-Uh7FtEp8PboQ@mail.gmail.com>
 <18A333954F38AD11.657799@lists.yoctoproject.org> <CANNYZj-Oaun1Jx3GqZPtBO9uS2Rdt+NPhBdb8yzag9ziWa+5vg@mail.gmail.com>
 <CAFAffzyD+Kkx7TzC1QVe6LZVBv5Y+dur4WouAfsT9wcqjbLcaw@mail.gmail.com>
In-Reply-To: <CAFAffzyD+Kkx7TzC1QVe6LZVBv5Y+dur4WouAfsT9wcqjbLcaw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 4 Apr 2026 19:13:18 +0200
X-Gm-Features: AQROBzDX1CR2B7_OJDThfQvhB9os5a_-UYyjgFmIy964la5I38pZBwzXDMl5Lz0
Message-ID: <CANNYZj8QK0XYUcy__Ov0122bRpCPYekQLhbtFuSJGDP8JBrCTA@mail.gmail.com>
Subject: Re: [bitbake-devel] [docs] [PATCH 1/2] bitbake-setup: rename "abort"
 rebase conflict stragegy to "halt"
To: Adam Blank <adam.blank.g@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000006ce219064ea58de2"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 04 Apr 2026 17:13:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9184

--0000000000006ce219064ea58de2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Equally, bitbake-setup will not abandon anything or anyone. That word has a
clear, negative connotation in all of its usages (unlike abort).

Alex

On Sat 4. Apr 2026 at 19.06, Adam Blank <adam.blank.g@gmail.com> wrote:

> On Sat, 4 Apr 2026 at 18:29, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> Having read that, and the entry for =E2=80=98abandon=E2=80=99, there=E2=
=80=99s a clear difference
>> between them.
>>
>> Abandoning is uncontrolled, dangerous and ungraceful. Abortion is the
>> opposite, and does go back to a previous, =E2=80=98safe=E2=80=99 state i=
n examples, if not
>> in definition itself.
>>
>>
> The trick with human languages is, that they are inherently subjective. I=
t
> is not possible to analytically compare two ways in which a given word
> 'rings' to a human ear.
> The whole topic was not about the exact, dictionary defined meaning of th=
e
> word 'abort', but rather about a human perception of it, and possibly
> undesired connotations it might invoke in some humans.
> I wanted to offer a helping hand, that all.
>
> Adam
>
>
>> Alex
>>
>> On Sat 4. Apr 2026 at 18.16, Alexander Kanavin via lists.yoctoproject.or=
g
>> <alex.kanavin=3Dgmail.com@lists.yoctoproject.org> wrote:
>>
>>> Please include a link to any citations. Because this is not what it say=
s:
>>> https://www.merriam-webster.com/dictionary/abort
>>>
>>>
>>> Alex
>>>
>>> On Sat 4. Apr 2026 at 17.58, Adam Blank <adam.blank.g@gmail.com> wrote:
>>>
>>>> On Sat, 4 Apr 2026, 17:34 Alexander Kanavin, <alex.kanavin@gmail.com>
>>>> wrote:
>>>>
>>>>> =E2=80=98Abandon=E2=80=99 doesn=E2=80=99t revert the state to how it =
was. It just leaves the
>>>>> mess as it is.
>>>>>
>>>>>
>>>> After Merriam-Webster:
>>>>
>>>> Abort means to stop, cancel, or terminate a process, project, or
>>>> mission before its completion. It is often used to describe abandoning=
 a
>>>> dangerous or flawed plan (e.g., "abort the mission") or ending a pregn=
ancy
>>>> prematurely. It also refers to a technical stoppage in computing or
>>>> aerospace.
>>>>
>>>> Synonyms for Abort:
>>>> Terminate/Stop: Halt, end, cease, discontinue, break off.
>>>> Cancel/Abandon: Scrub, scrap, call off, abandon.
>>>>
>>>> 'Abort' carries no notion of reverting the mess either.
>>>>
>>>>
>>>>> Alex
>>>>>
>>>>> On Sat 4. Apr 2026 at 9.34, Adam Blank via lists.yoctoproject.org
>>>>> <adam.blank.g=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>>>
>>>>>> Personally I don't have any specific preference, but as a hint for
>>>>>> you guys: for a non-native English speaker (of a Slavic origin at le=
ast),
>>>>>> "abandon" would convey a practically identical sense to "abort" and =
would
>>>>>> be some sort of a compromise.
>>>>>>
>>>>>> Thanks,
>>>>>> Adam
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#9180):
>>> https://lists.yoctoproject.org/g/docs/message/9180
>>> Mute This Topic: https://lists.yoctoproject.org/mt/118594590/1686489
>>> Group Owner: docs+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
>>> alex.kanavin@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>

--0000000000006ce219064ea58de2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Equally, bitbake-setup will not abandon anything or anyon=
e. That word has a clear, negative connotation in all of its usages (unlike=
 abort).</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div>=
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat 4. Apr 2026 at 19.06, Adam Blank &lt;<a href=3D"mail=
to:adam.blank.g@gmail.com">adam.blank.g@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rg=
b(204,204,204)"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defau=
lt" style=3D"font-size:small">On Sat, 4 Apr 2026 at 18:29, Alexander Kanavi=
n &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kana=
vin@gmail.com</a>&gt; wrote:</div></div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)"><div dir=3D"auto">Having read that, and the entry for =E2=80=98aba=
ndon=E2=80=99, there=E2=80=99s a clear difference between them.=C2=A0</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Abandoning is uncontrolled, d=
angerous and ungraceful. Abortion is the opposite, and does go back to a pr=
evious, =E2=80=98safe=E2=80=99 state in examples, if not in definition itse=
lf.</div><div dir=3D"auto"><br></div></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">The trick with human lang=
uages is, that they are inherently subjective. It is not possible to analyt=
ically compare two ways in which a given word &#39;rings&#39; to a human ea=
r.</div><div class=3D"gmail_default" style=3D"font-size:small">The whole to=
pic was not about the exact, dictionary defined meaning of the word &#39;ab=
ort&#39;, but rather about a human perception of it, and possibly undesired=
 connotations it might invoke in some humans.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">I wanted to offer a helping hand, that all.<=
/div></div></div></div><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br=
></div><div><div class=3D"gmail_default" style=3D"font-size:small">Adam</di=
v></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-lef=
t:1ex;border-left-color:rgb(204,204,204)"><div dir=3D"auto"></div><div dir=
=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Sat 4. Apr 2026 at 18.16, Alexander Kanavin via <a hr=
ef=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctoproject.o=
rg</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.or=
g" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-colo=
r:rgb(204,204,204)"><div dir=3D"auto">Please include a link to any citation=
s. Because this is not what it says:</div><div dir=3D"auto"><div style=3D"f=
ont-size:inherit" dir=3D"auto"><a href=3D"https://www.merriam-webster.com/d=
ictionary/abort" style=3D"font-size:inherit" target=3D"_blank">https://www.=
merriam-webster.com/dictionary/abort</a></div><div style=3D"font-size:inher=
it" dir=3D"auto"><br></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sat 4. Apr 2026 at 17.58, Adam Blank &lt;<a href=3D"mailto:=
adam.blank.g@gmail.com" target=3D"_blank">adam.blank.g@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;borde=
r-left-color:rgb(204,204,204)"><div dir=3D"ltr"><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 4 Apr 2026,=
 17:34 Alexander Kanavin, &lt;<a href=3D"mailto:alex.kanavin@gmail.com" tar=
get=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1p=
x;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,20=
4)"><div dir=3D"auto">=E2=80=98Abandon=E2=80=99 doesn=E2=80=99t revert the =
state to how it was. It just leaves the mess as it is.</div><div dir=3D"aut=
o"><br></div></blockquote><div><br></div><div><div style=3D"font-size:small=
">After Merriam-Webster:</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Abort means to stop, cancel, or terminate a process, project, or mission b=
efore its completion. It is often used to describe abandoning a dangerous o=
r flawed plan (e.g., &quot;abort the mission&quot;) or ending a pregnancy p=
rematurely. It also refers to a technical stoppage in computing or aerospac=
e.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Synonyms for Ab=
ort:</div><div dir=3D"auto">Terminate/Stop: Halt, end, cease, discontinue, =
break off.</div><div dir=3D"auto">Cancel/Abandon: Scrub, scrap, call off, a=
bandon.</div><br></div><div><div style=3D"font-size:small">&#39;Abort&#39; =
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
</blockquote></div></div>
</blockquote></div></div>

--0000000000006ce219064ea58de2--

