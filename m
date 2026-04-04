Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5373E63FEA
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 17:06:58 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20265.1775322411621019257
 for <docs@lists.yoctoproject.org>;
 Sat, 04 Apr 2026 10:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WllM/CES;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: adam.blank.g@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-66f747175d8so1491049eaf.0
        for <docs@lists.yoctoproject.org>; Sat, 04 Apr 2026 10:06:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775322411; cv=none;
        d=google.com; s=arc-20240605;
        b=Pm4GEL2Ot+Qqb/GXlM6y63FZ5fRvYhN7BRcDMc9a1jpV5lAes+izAoY1ilpg5YYd9D
         WxQrPGe7FHHFJ+W0ttoXdqb+ajHHIy+DnqFI5YpQDMB0buuQYw/xS024W/Hdcdpd5hwb
         94mt7v6HQc6nYiIxipD9FN9GfZi3+GUi6RIKcCwTi6AntHVCbB8+REp5c/0gJ2eXF0aG
         k3Slo+uArtSPtJGlnQj5Bh96ekLbMMgYJpvVH4NeVUWshjZaYYhfL3BILIvyJxvk0UVU
         9G5xBAF1OlrzGNwOLGu3epxU8CFYKVrY4y9Xaq5yd9t5MPpOeWgBJWOIE1l4B9pZ/xah
         xUIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WwgSM7jCkmPrKNekWANqm0mjO428qJkRbsLGPSq9f54=;
        fh=gzmcFeIkORwNvcShKO/tM7Jfzun5wc4Ah+P2S/YLtf4=;
        b=IWSTMQqeqDrdoU6yz45K1yPWfv3ar+YXw5tU55zqWTFIS7xIgDaRBC8es3Yu1//TNY
         XB7dYPg9xxmTtrcbW1ZunZMSvphyZvKWpCVTWxmci0uqPXeAoK7GmdoAPNjN3XmvX/C7
         qMHYHCLAmkgIg5+NN9EqmltcryD0lUNehWtKFM6uO66LZRUQ+3KpAIOxah2OVe1HMMP/
         S39rPZiZJzH9aqgfpCAWk3UQrLDFcvQAG4zQ+Wj/rsYB5KMH/OdY6oXB/SkgTWFQGUQH
         4yJnbuaOody1BBPTJHoXWywxWQzoFyfsdbDYC7/WUxUqQkZvM3j09Pe36sg3N/kJkRqF
         fhzA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775322411; x=1775927211; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WwgSM7jCkmPrKNekWANqm0mjO428qJkRbsLGPSq9f54=;
        b=WllM/CES9ofoahZJMy+kjwJDtW2b4omgwnTIenMcQ8GAjiMQmcOTcGkjhD0QwcDvX+
         qFEdAskjSWk/ZJajh0DgdpDqxOj0GBly4sfxh3csIgEskjiioc7872EkJY0Dh5cg2Gfk
         UiOjKQfZLoaNebObUcjOGFzs1JsrQIzsWuJWbW0K/QU2hQX2/sRElqLAPQdJAZT2OhvP
         fF3OP4SOa0cjKN3Prv7riMvz6uk2A2DOFDig0CWobGuie6c+Nlddki7Ls6n1kAZ2pOYY
         7J0uQYvLOvg7WeZSDmthmZwG+5pH1cnDKzecBKkaPEsoSSLPxhAN12aF7H4QhnoAno+W
         yKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775322411; x=1775927211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwgSM7jCkmPrKNekWANqm0mjO428qJkRbsLGPSq9f54=;
        b=JXN59FtA1ZJxBhc2nr3rNhir3AjUi2Te6mzI+DVzCKSXXdc/NLvPEFc3GjzlvJo6xj
         78Rn1m7D+26lqCDGPuKQ7n3h9eMc9mZf+3cjT2OKLc1V+r5kj2ve8SDg4muWrhHxnqg+
         yp1RB4KNzP4ANBR6BmdXMufBCSXXt8FD6wMT7um/22gaJLBKA9dDP1A5Wyx0Q4rp2LoN
         qYyKyJXUf8AZ3dLfcx9phEJ2BQDkxqiw4F1BTCH8K4+P6O0vKo1Nfcz8nz6xvxjL27XO
         kmyX+Anqs7d9AJ5MCtpHBrIl4ApK8YSCHIslQVZuns4lPOEOu1QcwR/pfDXZtZJayu6C
         5b/A==
X-Gm-Message-State: AOJu0YxQd82+/PFR4Glkb/qbDXk+lQm5aiMYhs8uwPHm04MaMXMIPYPX
	cm3MQsA1ig/2oME/l7mZO+bBS28Nm5yAHLzJNkoI3GcGvaY8V91/cqRkHwVNIymrxZgY9Gn4cgh
	POc3N21a7gijH8NJQtns8GRAjFr6f/Kw=
X-Gm-Gg: AeBDievfOmFxka0C4cRfHg3Sasj9zj2UAVdptRy4u7TPQeXEq3rs0oT7H1u6uvgqw/C
	lHf7oWg2H4owgKLTJfE7chx3oFYFwkEgcT9Fb47IaEM617rbYcYSXUqETCoSFMLuGs9GJu/qwGe
	hqY3FuRZQ2O/g1nU04cp799mXn9rUwhQNrwN4dpXI/jtwUCUhvJn7T+OeWr6DGASQQH65W/JJFB
	nBeWbMJBKdY4+HkG0aOrqhKM4dAt0MjS2mAu4zZfi7bxNVOH8Tw4mfUAMCq7UAt3IEgoolupbob
	y42XujWOMi9Z1TfN
X-Received: by 2002:a05:6820:1c83:b0:67d:e619:5c5a with SMTP id
 006d021491bc7-6821dd6a40cmr3965863eaf.16.1775322410532; Sat, 04 Apr 2026
 10:06:50 -0700 (PDT)
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
In-Reply-To: <CANNYZj-Oaun1Jx3GqZPtBO9uS2Rdt+NPhBdb8yzag9ziWa+5vg@mail.gmail.com>
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sat, 4 Apr 2026 19:06:38 +0200
X-Gm-Features: AQROBzBr3zlIEXNyfBwMESyvt7oHwrYEpqmJOnHH7063fnbGGY9mTEIxtjti2y8
Message-ID: <CAFAffzyD+Kkx7TzC1QVe6LZVBv5Y+dur4WouAfsT9wcqjbLcaw@mail.gmail.com>
Subject: Re: [bitbake-devel] [docs] [PATCH 1/2] bitbake-setup: rename "abort"
 rebase conflict stragegy to "halt"
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000a455f7064ea575af"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 04 Apr 2026 17:06:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9183

--000000000000a455f7064ea575af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 4 Apr 2026 at 18:29, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Having read that, and the entry for =E2=80=98abandon=E2=80=99, there=E2=
=80=99s a clear difference
> between them.
>
> Abandoning is uncontrolled, dangerous and ungraceful. Abortion is the
> opposite, and does go back to a previous, =E2=80=98safe=E2=80=99 state in=
 examples, if not
> in definition itself.
>
>
The trick with human languages is, that they are inherently subjective. It
is not possible to analytically compare two ways in which a given word
'rings' to a human ear.
The whole topic was not about the exact, dictionary defined meaning of the
word 'abort', but rather about a human perception of it, and possibly
undesired connotations it might invoke in some humans.
I wanted to offer a helping hand, that all.

Adam


> Alex
>
> On Sat 4. Apr 2026 at 18.16, Alexander Kanavin via lists.yoctoproject.org
> <alex.kanavin=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>> Please include a link to any citations. Because this is not what it says=
:
>> https://www.merriam-webster.com/dictionary/abort
>>
>>
>> Alex
>>
>> On Sat 4. Apr 2026 at 17.58, Adam Blank <adam.blank.g@gmail.com> wrote:
>>
>>> On Sat, 4 Apr 2026, 17:34 Alexander Kanavin, <alex.kanavin@gmail.com>
>>> wrote:
>>>
>>>> =E2=80=98Abandon=E2=80=99 doesn=E2=80=99t revert the state to how it w=
as. It just leaves the
>>>> mess as it is.
>>>>
>>>>
>>> After Merriam-Webster:
>>>
>>> Abort means to stop, cancel, or terminate a process, project, or missio=
n
>>> before its completion. It is often used to describe abandoning a danger=
ous
>>> or flawed plan (e.g., "abort the mission") or ending a pregnancy
>>> prematurely. It also refers to a technical stoppage in computing or
>>> aerospace.
>>>
>>> Synonyms for Abort:
>>> Terminate/Stop: Halt, end, cease, discontinue, break off.
>>> Cancel/Abandon: Scrub, scrap, call off, abandon.
>>>
>>> 'Abort' carries no notion of reverting the mess either.
>>>
>>>
>>>> Alex
>>>>
>>>> On Sat 4. Apr 2026 at 9.34, Adam Blank via lists.yoctoproject.org
>>>> <adam.blank.g=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>>
>>>>> Personally I don't have any specific preference, but as a hint for yo=
u
>>>>> guys: for a non-native English speaker (of a Slavic origin at least),
>>>>> "abandon" would convey a practically identical sense to "abort" and w=
ould
>>>>> be some sort of a compromise.
>>>>>
>>>>> Thanks,
>>>>> Adam
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9180):
>> https://lists.yoctoproject.org/g/docs/message/9180
>> Mute This Topic: https://lists.yoctoproject.org/mt/118594590/1686489
>> Group Owner: docs+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
>> alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000a455f7064ea575af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Sat, 4 Apr 2026 at 18:29, Alexander Kanavin &lt;<a href=3D=
"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:</div>=
</div><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"auto">Having read that, and the e=
ntry for =E2=80=98abandon=E2=80=99, there=E2=80=99s a clear difference betw=
een them.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Abandoni=
ng is uncontrolled, dangerous and ungraceful. Abortion is the opposite, and=
 does go back to a previous, =E2=80=98safe=E2=80=99 state in examples, if n=
ot in definition itself.</div><div dir=3D"auto"><br></div></blockquote><div=
><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">The =
trick with human languages is, that they are inherently subjective. It is n=
ot possible to analytically compare two ways in which a given word &#39;rin=
gs&#39; to a human ear.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">The whole topic was not about the exact, dictionary defined meanin=
g of the word &#39;abort&#39;, but rather about a human perception of it, a=
nd possibly undesired connotations it might invoke in some humans.</div><di=
v class=3D"gmail_default" style=3D"font-size:small">I wanted to offer a hel=
ping hand, that all.</div></div><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Adam</div></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"></div><div dir=3D=
"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat 4. Apr 2026 at 18.16, Alexander Kanavin via <a href=
=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctoproject.org=
</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org"=
 target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">Please=
 include a link to any citations. Because this is not what it says:</div><d=
iv dir=3D"auto"><div style=3D"font-size:inherit" dir=3D"auto"><a href=3D"ht=
tps://www.merriam-webster.com/dictionary/abort" style=3D"font-size:inherit"=
 target=3D"_blank">https://www.merriam-webster.com/dictionary/abort</a></di=
v><div style=3D"font-size:inherit" dir=3D"auto"><br></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 4. Apr 2026 at 17.58, Ad=
am Blank &lt;<a href=3D"mailto:adam.blank.g@gmail.com" target=3D"_blank">ad=
am.blank.g@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"auto"><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 4 Apr 2026, 17:34 Alex=
ander Kanavin, &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_bla=
nk">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"auto">=E2=80=98Abandon=E2=80=99 doesn=
=E2=80=99t revert the state to how it was. It just leaves the mess as it is=
.</div><div dir=3D"auto"><br></div></blockquote><div><br></div><div><div st=
yle=3D"font-size:small">After Merriam-Webster:</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Abort means to stop, cancel, or terminate a process,=
 project, or mission before its completion. It is often used to describe ab=
andoning a dangerous or flawed plan (e.g., &quot;abort the mission&quot;) o=
r ending a pregnancy prematurely. It also refers to a technical stoppage in=
 computing or aerospace.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Synonyms for Abort:</div><div dir=3D"auto">Terminate/Stop: Halt, end=
, cease, discontinue, break off.</div><div dir=3D"auto">Cancel/Abandon: Scr=
ub, scrap, call off, abandon.</div><br></div><div><div style=3D"font-size:s=
mall">&#39;Abort&#39; carries no notion of reverting the mess either.</div>=
</div></div></div></div><div dir=3D"ltr"><div dir=3D"auto"><div class=3D"gm=
ail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"auto"></div><div dir=3D"auto">Alex</div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 4. Apr 2026 a=
t 9.34, Adam Blank via <a href=3D"http://lists.yoctoproject.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.yoctoproject.org</a> &lt;adam.blank.g=3D<a=
 href=3D"mailto:gmail.com@lists.yoctoproject.org" rel=3D"noreferrer" target=
=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div>Personally I don&#39;t hav=
e any specific preference, but as a hint for you guys: for a non-native Eng=
lish speaker (of a Slavic origin at least), &quot;abandon&quot; would conve=
y a practically identical sense to &quot;abort&quot; and would be some sort=
 of a compromise.</div>
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

--000000000000a455f7064ea575af--

